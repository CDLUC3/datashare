package org.cdlib.xtf.textIndexer;


/**
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
import java.io.IOException;
import java.io.InputStream;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.util.PDFTextStripper;
import org.cdlib.xtf.util.*;

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////

/** This class provides a single static {@link PDFToString#convert(InputStream) convert() }
 *  method that converts the text in a PDF file into an XML string that can be
 *  pre-filtered and added to a Lucene database by the
 *  {@link XMLTextProcessor } class. <br><br>
 *
 *  Internally, the text of the PDF file is extracted using the PDFBox library.
 */
public class PDFToString 
{
  static boolean mustConfigureLogger = true;

  /** PDFBox text stripper. Created once to save time. */
  static PDFTextStripper stripper;

  //////////////////////////////////////////////////////////////////////////////

  /** Convert a PDF file into an XML string.
   *
   *  @param PDFInputStream  The stream of PDF data to convert to an
   *                         XML string.
   *
   *  @return
   *      If successful, a string containing the XML equivalent of the source
   *      PDF file. If an error occurred, this method returns <code>null</code>.
   *
   */
  static String convert(InputStream PDFInputStream)
    throws IOException 
  {
    // Make a stripper if we haven't already.
    if (stripper == null)
      stripper = new PDFTextStripper();

    // Workaround: using PDFTextStripper normally results in a Window
    // being created. However, since we're running in a servlet container, this
    // isn't generally desirable (and often isn't possible.) So we let AWT know
    // that it's running in "headless" mode, and this prevents the window from
    // being created.
    //
    System.setProperty("java.awt.headless", "true");
    
    XMLFormatter formatter = new XMLFormatter();

    try 
    {
      PDDocument pdfDoc = null;

      try 
      {
        // Get hold of the PDF document to convert.
        pdfDoc = PDDocument.load(PDFInputStream);

        // If the document is encrypted, we've got a problem.
        if (pdfDoc.isEncrypted()) {
          Trace.info("*** PDF File is Encrypted. File Skipped.");
          throw new Exception();
        }

        // Start the XML with an XML format tag.
        formatter.procInstr("xml version=\"1.0\" encoding=\"utf-8\"");

        // Set up the tab size and blank line formatting.   
        formatter.tabSize(4);
        formatter.blankLineAfterTag(false);

        // Determine how many pages there are in the PDF file.   
        int pageCount = pdfDoc.getNumberOfPages();

        // Create an all-enclosing document tag summarizing 
        // the original document name and the number of pages.
        //   
        formatter.beginTag("pdfDocument");
        formatter.attr("pageCount", pageCount);

        // Process each page in the PDF document.   
        for (int i = 1; i <= pageCount; i++) 
        {
          // Start with a new page tag.
          formatter.beginTag("pdfPage");
          formatter.attr("number", i);

          // Tell the stripper to only process the current page.
          stripper.setStartPage(i);
          stripper.setEndPage(i);

          // Get the text for this page.
          String pdfText = stripper.getText(pdfDoc);

          // Escape and normalize characters.
          pdfText = XMLIndexSource.normalize(pdfText);

          // Tack the text onto the XML output, nicely formatted
          // into lines of 128 characters or less.
          //   
          formatter.text(pdfText, 128);
          formatter.newLineAfterText();

          // End the current page tag.   
          formatter.endTag();
        } // for( int i = 1; i <= pageCount; i++ )

        // End any remaining open tags (should only be the pdfDocument
        // tag.)
        //
        formatter.endAllTags();
      } // try

      // If anything went wrong, say what it was.    
      catch (Throwable t) {
        Trace.error("*** PDFToXML.convert() Exception: " + t.getClass());
        Trace.error("                    With message: " + t.getMessage());
      }

      // Finally, close up the the PDF document.
      finally {
        if (pdfDoc != null)
          pdfDoc.close();
      }
    } // try

    // Shunt out any other exceptions.
    catch (Throwable t) {
      Trace.error("*** PDFToXML.convert() Exception: " + t.getClass());
      Trace.error("                    With message: " + t.getMessage());
    }

    // Return the resulting XML string to the caller.
    return formatter.toString();
  } // public convert()
} // class PDFToString()
