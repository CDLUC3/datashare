package org.cdlib.xtf.dynaXML;


/*
 * Copyright (c) 2004, Regents of the University of California
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of the University of California nor the names of its
 *   contributors may be used to endorse or promote products derived from this
 *   software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.SAXParser;
import javax.xml.transform.Templates;
import javax.xml.transform.sax.SAXResult;

import net.sf.saxon.Configuration;
import net.sf.saxon.event.Receiver;
import net.sf.saxon.event.ReceivingContentHandler;
import org.cdlib.xtf.lazyTree.LazyTreeBuilder;
import org.cdlib.xtf.servletBase.TextConfig;
import org.cdlib.xtf.servletBase.TextServlet;
import org.cdlib.xtf.textEngine.IndexUtil;
import org.cdlib.xtf.util.DocTypeDeclRemover;
import org.cdlib.xtf.util.Path;
import org.cdlib.xtf.util.StructuredFile;
import org.cdlib.xtf.util.StructuredStore;
import org.cdlib.xtf.util.SubStoreReader;
import org.cdlib.xtf.util.SubStoreWriter;
import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/*
 * This file created on Mar 11, 2005 by Martin Haye
 */

/**
 * Provides local filesystem-based access to lazy and non-lazy versions of
 * a source XML document.
 *
 * @author Martin Haye
 */
public class DefaultDocLocator implements DocLocator 
{
  /** Servlet we are part of */
  private TextServlet servlet;

  /** Attach to a servlet */
  public void setServlet(TextServlet servlet) {
    this.servlet = servlet;
  }

  /**
   * Search for a StructuredStore containing the "lazy" or persistent
   * representation of a given document. Index parameters are specified,
   * since often the lazy file is stored along with the index. This method
   * is called first, and if it returns null, then
   * {@link #getInputSource(String, boolean)} will be called as a fall-back.
   * 
   * Note: synchronized to prevent the situation where multiple threads
   * might try to create the same lazy store at the same time and interfere
   * with each other.
   *
   * @param indexConfigPath Path to the index configuration file
   * @param indexName       Name of the index being searched
   * @param sourcePath      Path to the source document
   * @param preFilter       Prefilter stylesheet to run (or null for none)
   * @param removeDoctypeDecl Set to true to remove DOCTYPE declaration from
   *                          the XML document.
   *
   * @return                Store containing the tree, or null if none
   *                        could be found.
   */
  public synchronized StructuredStore getLazyStore(String indexConfigPath, String indexName,
                                                   String sourcePath, Templates preFilter,
                                                   boolean removeDoctypeDecl)
    throws IOException 
  {
    // If we're not allowed to use lazy files, then don't.
    TextConfig config = servlet.getConfig();
    if (config instanceof DynaXMLConfig && !((DynaXMLConfig)config).useLazyFiles)
      return null;
    
    // If no 'index' specified in the docInfo, then there's no way we can
    // find the lazy file.
    //
    if (indexConfigPath == null || indexName == null)
      return null;

    // If the source isn't a local file, we also can't use a lazy file.
    if (sourcePath.startsWith("http:"))
      return null;
    if (sourcePath.startsWith("https:"))
      return null;

    // If it's a directory, something went wrong. No lazy file for sure.
    File sourceFile = new File(sourcePath);
    if (!sourceFile.isFile())
      return null;

    // Figure out where the lazy file is (or should be.)
    File lazyFile = calcLazyPath(new File(servlet.getRealPath("")),
                                 new File(indexConfigPath),
                                 indexName,
                                 new File(sourcePath),
                                 false);
      
    // Get the config flag telling us whether we're allowed to build lazy
    // files outside of indexing.
    //
    boolean buildLazyFilesAlone = false;
    if (config instanceof DynaXMLConfig)
      buildLazyFilesAlone = ((DynaXMLConfig)config).buildLazyFilesAlone;

    // If the lazy file is out of date (and we created it), rebuild it. Note
    // that it's not safe to rebuild lazy files created by the indexer, since
    // it would cause hit highlighting to fail due to a mismatch between
    // node numbers stored in the index vs. stored in the lazy file.
    //
    if (buildLazyFilesAlone &&
        lazyFile.canRead() &&
        sourceFile.lastModified() > lazyFile.lastModified() &&
        isPostIndexLazyFile(lazyFile))
    {
      lazyFile.delete();
    }

    // If we can't read it for any reason (including because we just deleted an
    // out-of-date file), try to build it instead...
    //
    if (!lazyFile.canRead()) 
    {
      // ... unless we've been asked not to build lazy files alone.
      // This is the case by default, but people who want to use dynaXML
      // without textIndexer will allow dynaXML to build lazy files by
      // itself.
      //
      if (!buildLazyFilesAlone)
        return null;
      
      // Decide whether we need to strip whitespace
      boolean stripWhitespace = false;
      try {
        stripWhitespace = IndexUtil.getIndexInfo(new File(indexConfigPath),
                                                 indexName).stripWhitespace;
      }
      catch (Exception e) {
      }

      // Build the lazy file.
      buildLazyStore(lazyFile,
                     sourcePath,
                     preFilter,
                     removeDoctypeDecl,
                     stripWhitespace);
    }

    // Cool. Open the lazy file.
    return StructuredFile.open(lazyFile);
  } // getLazyStore()

  /**
   * Wrapper for IndexUtil.calcLazyPath(); useful for derived classes to supply their
   * own implementation.
   */
  public File calcLazyPath(
    File xtfHome, File idxConfigFile,
    String idxName, File srcTextFile,
    boolean createDir) throws IOException 
  {
    return IndexUtil.calcLazyPath(xtfHome, idxConfigFile, idxName, srcTextFile, createDir);
  }

  /**
   * Retrieve the data stream for an XML source document.
   *
   * @param sourcePath  Path to the source document
   * @param removeDoctypeDecl Set to true to remove DOCTYPE declaration from
   *                          the XML document.
   *
   * @return            Data stream for the document.
   */
  public InputSource getInputSource(String sourcePath, boolean removeDoctypeDecl)
    throws IOException 
  {
    // If it's non-local, load the URL.
    if (sourcePath.startsWith("http:") || sourcePath.startsWith("https:")) {
      return new InputSource(sourcePath);
    }

    // Okay, assume it's a local file.
    InputStream inStream = new FileInputStream(sourcePath);

    // Remove DOCTYPE declarations, since the XML reader will barf 
    // if it can't resolve the entity reference, and we really 
    // don't care one way or the other.
    //
    if (removeDoctypeDecl)
      inStream = new DocTypeDeclRemover(inStream);

    // Make the input source, and give it a real system ID.
    InputSource inSrc = new InputSource(inStream);
    inSrc.setSystemId(new File(sourcePath).toURL().toString());

    // All done!
    return inSrc;
  } // getInputSource()

  /**
   * Create a lazy document by loading the original, building the lazy
   * tree, and writing it out.
   *
   * @param lazyFile      Lazy file to create
   * @param sourcePath    Path to the source document
   * @param preFilter     A prefilter stylesheet (or null for no pre-filtering.)
   * @param removeDoctypeDecl true to remove DOCTYPE declarations from the
   *                          XML document
   * @param stripWhitespace If set, whitespace will be removed between elements
   *                        in the lazy file.
   */
  private void buildLazyStore(File lazyFile, String sourcePath,
                              Templates preFilter, boolean removeDoctypeDecl,
                              boolean stripWhitespace)
    throws IOException 
  {
    // The directory the lazy file is to be stored in might not exist yet.
    // If not, we need to create it now before making the lazy file.
    //
    Path.createPath(lazyFile.getParent());
    
    // Build a temp file, and when it's finished, rename it.
    File tmpFile = new File(lazyFile.getAbsolutePath() + ".tmp");

    // While we parse the source document, we're going to also build up 
    // a tree that will be written to the lazy file.
    //
    Configuration config = new Configuration();
    LazyTreeBuilder lazyBuilder = new LazyTreeBuilder(config);
    StructuredStore lazyStore = StructuredFile.create(tmpFile);
    
    // Put a special marker subfile within the store so we know it was created
    // outside of the indexing process. That way, we can identify files that
    // are okay to update when the timestamp of the original changes.
    //
    SubStoreWriter sub = lazyStore.createSubStore("isPostIndexLazyFile");
    sub.writeByte(1);
    sub.close();
    
    // Start the build process.
    Receiver lazyReceiver = lazyBuilder.begin(lazyStore);

    try
    {
      ReceivingContentHandler lazyHandler = new ReceivingContentHandler();
      lazyHandler.setReceiver(lazyReceiver);
      lazyHandler.setPipelineConfiguration(lazyReceiver.getPipelineConfiguration());
  
      // Instantiate a new XML parser, being sure to get the right one.
      SAXParser xmlParser = IndexUtil.createSAXParser();
  
      // Open the source file for reading
      InputStream inStream = new FileInputStream(sourcePath);
  
      // Apply the standard set of document filters.
      InputSource inSrc = new InputSource(IndexUtil.filterXMLDocument(
                                                                      inStream,
                                                                      xmlParser,
                                                                      removeDoctypeDecl));
  
      // Put a proper system ID onto the InputSource.
      inSrc.setSystemId(new File(sourcePath).toURL().toString());
  
      // Make a DefaultHandler that will pass events to the lazy receiver.
      LazyPassthru passthru = new LazyPassthru(lazyHandler, stripWhitespace);
  
      // Apply a prefilter if one was specified.
      if (preFilter == null) 
      {
        try {
          xmlParser.parse(inSrc, passthru);
        }
        catch (Exception e) {
          throw new RuntimeException(e);
        }
      }
      else {
        // Apply the pre-filter.
        try {
          Templates[] array = new Templates[1];
          array[0] = preFilter;
          IndexUtil.applyPreFilters(array,
                                    xmlParser.getXMLReader(),
                                    inSrc,
                                    new SAXResult(passthru));
        }
        catch (Exception e) {
          lazyBuilder.abort(lazyReceiver);
          throw new RuntimeException(e);
        }
      }
  
      // Finish off the lazy file.
      lazyBuilder.finish(lazyReceiver, true);
      
      // And rename the temp file.
      tmpFile.renameTo(lazyFile);
    }
    catch (IOException e) {
      lazyBuilder.abort(lazyReceiver);
      throw e;
    }
  } // buildLazyStore()
  
  /**
   * Check if the given lazy file was created after the indexing process
   * (i.e. by this doc locator)
   */
  private boolean isPostIndexLazyFile(File f)
  {
    StructuredStore store = null;
    SubStoreReader sub = null;
    boolean ret = false;
    try {
      store = StructuredFile.open(f);
      sub = store.openSubStore("isPostIndexLazyFile");
      if (sub.readByte() == 1)
        ret = true;
    }
    catch (IOException e) { }
    finally {
      try {
        if (sub != null)
          sub.close();
        if (store != null)
          store.close();
      }
      catch (IOException e) { }
    }
    
    return ret;
  }

  /**
   * Passes SAX events to a ContentHandler. Also performs character
   * buffering that mimics what the textIndexer normally does.
   */
  private static class LazyPassthru extends DefaultHandler 
  {
    private StringBuffer charBuf = new StringBuffer();
    private ContentHandler lazyHandler;
    private boolean stripWhitespace;

    public LazyPassthru(ContentHandler lazyHandler, boolean stripWhitespace) {
      this.lazyHandler = lazyHandler;
      this.stripWhitespace = stripWhitespace;
    }

    public void startDocument()
      throws SAXException 
    {
      lazyHandler.startDocument();
    }

    public void startElement(String uri, String localName, String qName,
                             Attributes atts)
      throws SAXException 
    {
      flushCharacters();
      lazyHandler.startElement(uri, localName, qName, atts);
    }

    public void endElement(String uri, String localName, String qName)
      throws SAXException 
    {
      flushCharacters();
      lazyHandler.endElement(uri, localName, qName);
    }

    public void processingInstruction(String target, String data)
      throws SAXException 
    {
      lazyHandler.processingInstruction(target, data);
    }

    public void endDocument()
      throws SAXException 
    {
      lazyHandler.endDocument();
    }

    public void characters(char[] ch, int start, int length) {
      charBuf.append(ch, start, length);
    }

    private void flushCharacters()
      throws SAXException 
    {
      // If the entire buffer is whitespace (or empty), we can safely 
      // strip it.
      //
      int i = 0;
      if (stripWhitespace) {
        for (i = 0; i < charBuf.length(); i++)
          if (!Character.isWhitespace(charBuf.charAt(i)))
            break;
      }
      if (i < charBuf.length())
        lazyHandler.characters(charBuf.toString().toCharArray(),
                               0,
                               charBuf.length());
      charBuf.setLength(0);
    }
  }
  ;
} // class DefaultDocLocator
