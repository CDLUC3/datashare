package org.cdlib.xtf.servletBase;


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
 *
 * Acknowledgements:
 *
 * A significant amount of new and/or modified code in this module
 * was made possible by a grant from the Andrew W. Mellon Foundation,
 * as part of the Melvyl Recommender Project.
 */
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.SocketException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Result;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import net.sf.saxon.Controller;
import net.sf.saxon.event.Receiver;
import net.sf.saxon.event.SerializerFactory;
import net.sf.saxon.trans.XPathException;
import net.sf.saxon.tree.TreeBuilder;
import net.sf.saxon.value.StringValue;
import org.apache.lucene.analysis.Token;
import org.apache.lucene.limit.ExcessiveWorkException;
import org.apache.lucene.limit.TermLimitException;
import org.cdlib.xtf.saxonExt.sql.SQLConnect;
import org.cdlib.xtf.textEngine.DefaultQueryProcessor;
import org.cdlib.xtf.textEngine.IndexUtil;
import org.cdlib.xtf.textEngine.IndexWarmer;
import org.cdlib.xtf.textEngine.QueryProcessor;
import org.cdlib.xtf.textIndexer.tokenizer.XTFTokenizer;
import org.cdlib.xtf.util.Attrib;
import org.cdlib.xtf.util.AttribList;
import org.cdlib.xtf.util.EasyNode;
import org.cdlib.xtf.util.FastStringReader;
import org.cdlib.xtf.util.FastTokenizer;
import org.cdlib.xtf.util.GeneralException;
import org.cdlib.xtf.util.Path;
import org.cdlib.xtf.util.ThreadWatcher;
import org.cdlib.xtf.util.Trace;
import org.cdlib.xtf.util.XMLFormatter;
import org.cdlib.xtf.util.XTFSaxonErrorListener;
import org.cdlib.xtf.xslt.FileUtils;
import org.z3950.zing.cql.CQLNode;
import org.z3950.zing.cql.CQLParser;

/**
 * Base class for the crossQuery and dynaXML servlets. Handles first-time
 * initialization, config file loading and some parsing, error handling, and
 * a few utility methods.
 */
public abstract class TextServlet extends HttpServlet 
{
  /** Caches stylesheets (based on their URL) */
  public StylesheetCache stylesheetCache;

  /** Context useful for mapping partial paths to full paths */
  private ServletContext staticContext;

  /** Base directory specified in servlet config (if any) */
  private String baseDir;

  /** Flag to discern whether class has been initialized yet */
  private boolean isInitted = false;

  /** The error generator stylesheet to use */
  private ThreadLocal<String> errorGenSheet = new ThreadLocal<String>();

  /**
   * Last modification time of the configuration file, so we can decide
   * when we need to re-initialize the servlet.
   */
  private long configFileLastModified = 0;

  /** Keeps track, per thread, of the servlet performing a request */
  private static ThreadLocal curServlet = new ThreadLocal();

  /** Keeps track, per thread, of the HTTP servlet request being processed */
  private static ThreadLocal curRequest = new ThreadLocal();

  /** Keeps track, per thread, of the HTTP servlet response */
  private static ThreadLocal curResponse = new ThreadLocal();

  /** Used for warming up indexes in the background */
  private static HashMap<String,IndexWarmer> indexWarmers = new HashMap();

  /**
   * During tokenization, the '*' wildcard has to be changed to a word
   * to keep it from being removed.
   */
  private static final String SAVE_WILD_STAR = "jwxbkn";

  /**
   * During tokenization, the '?' wildcard has to be changed to a word
   * to keep it from being removed.
   */
  private static final String SAVE_WILD_QMARK = "vkyqxw";

  /**
   * Extracts all of the text data from a tree element node.
   *
   * @param element   element to get text from
   * @return          Concatenated text from the element.
   */
  public static String getText(EasyNode element) 
  {
    String text = "";
    for (int i = 0; i < element.nChildren(); i++) {
      EasyNode n = element.child(i);
      if (!n.isText())
        continue;
      text = text + n.toString();
    }

    return text.trim();
  }

  /**
   * Translate a partial filesystem path to a full path.
   *
   * @param partialPath   A partial (or full) path
   * @return              The full path
   */
  public String getRealPath(String partialPath) 
  {
    if (staticContext == null)
      return partialPath;

    if (partialPath.startsWith("http://"))
      return partialPath;
    if (partialPath.startsWith("/") || partialPath.startsWith("\\"))
      return partialPath;
    if (partialPath.length() > 1 && partialPath.charAt(1) == ':')
      return partialPath;
    if (!isEmpty(baseDir))
      return Path.resolveRelOrAbs(baseDir, partialPath);
    return staticContext.getRealPath(partialPath);
  } // getRealPath()

  /**
   * Utility function - check if string is null or ""
   *
   * @param s     String to check
   * @return      true if the string is null or the empty string ("")
   */
  public static boolean isEmpty(String s) {
    return (s == null || s.equals(""));
  }

  /**
   * Utlity function - if the value is null, throws an exception.
   *
   * @param value     The value to check for null
   * @param descrip   If exception is thrown, this will be the message.
   * @throws GeneralException    Only if the value is null
   */
  public static void requireOrElse(String value, String descrip)
    throws GeneralException 
  {
    if (isEmpty(value))
      throw new GeneralException(descrip);
  } // requireOrElse()

  /**
   * Get the servlet that is currently executing a request in this thread,
   * or null if no request is being processed by this thread.
   */
  public static TextServlet getCurServlet() {
    return (TextServlet)curServlet.get();
  }

  /**
   * Get the HTTP servlet request that is currently being processed by
   * this thread, or null if none is being processed by this thread.
   */
  public static HttpServletRequest getCurRequest() {
    return (HttpServletRequest)curRequest.get();
  }

  /**
   * Get the HTTP servlet response that is currently being generated by
   * this thread, or null if no request is being processed.
   */
  public static HttpServletResponse getCurResponse() {
    return (HttpServletResponse)curResponse.get();
  }
  
  /** 
   * Called by the servlet container to indicate this servlet is being taken
   * out of service. We clean up all resources we can.
   */
  @Override
  public void destroy()
  {
    // Close down any index warmers we have created
    synchronized (indexWarmers) {
      for (IndexWarmer w : indexWarmers.values())
        w.close();
      indexWarmers.clear();
    }
  }

  /**
   * Ensures that the servlet has been properly initialized. If init()
   * hasn't been called yet, or if the config file changes, then this
   * method reads the config file, then calls derivedInit().
   */
  private final void firstTimeInit(boolean forceInit) 
  {
    // Even if multiple instances get called at the same time, make sure
    // that we init once and only once.
    //
    synchronized (getClass()) 
    {
      // Record the context so we can easily translate paths.
      staticContext = getServletContext();

      // If a base directory was specified, record it.
      baseDir = getServletConfig().getInitParameter("base-dir");
      if (!isEmpty(baseDir) && !baseDir.endsWith("/"))
        baseDir = baseDir + "/";

      // If the modification time of the configuration file has
      // changed, we need to re-initialize.
      //
      String configPath = getRealPath(getConfigName());
      File configFile = new File(configPath);
      if (configFileLastModified > 0 &&
          configFile.lastModified() != configFileLastModified) 
      {
        stylesheetCache.clear();
        isInitted = false;
      }
      configFileLastModified = configFile.lastModified();

      // Force reinitialization if requested
      if (forceInit)
        isInitted = false;

      // Only init once.
      if (isInitted)
        return;

      // Read in the configuration file.
      TextConfig config = readConfig(configPath);

      // Set up the trace facility so it prints timestamps. Then print out
      // trace info that we're restarting the servlet.
      //
      setupTrace(config);

      // Create the caches
      stylesheetCache = new StylesheetCache(config.stylesheetCacheSize,
                                            config.stylesheetCacheExpire,
                                            config.dependencyCheckingEnabled);

      // Mark the flag so we won't init again.
      isInitted = true;
    }
  } // firstTimeInit()

  /**
   * Sets up the trace facility for serlvet operation:
   *   1. Print timestamps with each line
   *   2. Flush output immediately rather than buffering til end of line
   *   3. Output level from config
   *   4. Log a message that we're restarting the servlet
   */
  protected void setupTrace(TextConfig config) 
  {
    // Set up the Trace facility. We want timestamps.
    Trace.printTimestamps(true);

    // Make sure output lines get flushed immediately, since we may
    // be sharing the log file with other servlets.
    //
    Trace.setAutoFlush(true);

    // Establish the trace output level.
    Trace.setOutputLevel(
        (config.logLevel.equals("silent")) ? Trace.silent
      : (config.logLevel.equals("errors")) ? Trace.errors
      : (config.logLevel.equals("warnings")) ? Trace.warnings
      : (config.logLevel.equals("debug")) ? Trace.debug : Trace.info);

    // And let everyone know the servlet has restarted
    Trace.error("");
    Trace.error("*** SERVLET RESTART: " + getServletInfo() + " ***");
    Trace.error("");
    Trace.error("Log level: " + config.logLevel);
  } // setupTrace()

  /**
   * General service method. We set a watch on each request in case it
   * becomes a "runaway", and institute various filters.
   */
  @SuppressWarnings("unused")
  protected void service(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException 
  {
    // If we've been asked to clear the caches, do it now, by simply
    // forcing a re-init.
    //
    // If not initialized yet, do it now.
    //
    String clearCaches = req.getParameter("clear-caches");
    firstTimeInit("yes".equals(clearCaches));

    // If reporting latency, record the start time.
    TextConfig config = getConfig();
    long reqStartTime = 0;
    if (config.reportLatency)
      reqStartTime = System.currentTimeMillis();

    // Enable ';' as a URL parameter separator in addition to '&'. Also,
    // strip out the jsessionid if present.
    //
    req = new RequestWrapper(req);
    
    // If a latency cut-off is specified, substitute a counting output 
    // stream.
    //
    String requestUrl = getRequestURL(req);
    LatencyCutoffStream cutoffStream = null;
    if (config.reportLatency && config.latencyCutoffSize > 0) {
      cutoffStream = new LatencyCutoffStream(res.getOutputStream(),
                                             config.latencyCutoffSize,
                                             reqStartTime,
                                             requestUrl);
      res = new ResponseWrapper(res, cutoffStream);
    }

    // Record the stuff going on in this thread at the moment, so that
    // our Saxon extensions can access the servlet externally.
    //
    curServlet.set(this);
    curRequest.set(req);
    curResponse.set(res);
    
    // Clear any Saxon errors that have previously occurred, so we can accurately
    // report any that occur while processing this request.
    //
    XTFSaxonErrorListener.clearThreadErrors();

    // Default the error generator stylesheet to use
    errorGenSheet.set(config.errorGenSheet);

    // Get or create a session if enabled.
    if (config.trackSessions)
      req.getSession(true);

    // Turn on runaway tracking if enabled.
    boolean trackRunaway = (config.runawayNormalTime > 0) ||
                           (config.runawayKillTime > 0);

    try 
    {
      if (trackRunaway) {
        ThreadWatcher.beginWatch(requestUrl,
                                 config.runawayNormalTime * 1000,
                                 config.runawayKillTime * 1000);
      }
      
      // In general it doesn't make sense to cache pages served by XTF servlets.
      // This becomes especially evident when the book bag comes into play. So
      // we need to set HTTP headers so that browsers (and proxies) won't cache
      // our pages.
      //
      if (!config.allowBrowserCaching) 
      {
        // Set to expire far in the past.
        res.setHeader("Expires", "Sat, 6 May 1995 12:00:00 GMT");
        
        // The following are not safe and can cause IE7 downloads to fail.
        // See article http://edn.embarcadero.com/print/39141
        //
        if (false) {
          // Set standard HTTP/1.1 no-cache headers.
          res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
          // Set IE extended HTTP/1.1 no-cache headers (use addHeader).
          res.addHeader("Cache-Control", "post-check=0, pre-check=0");
          // Set standard HTTP/1.0 no-cache header.
          res.setHeader("Pragma", "no-cache");
        }
      }

      // Let the specific servlet serve the request.
      super.service(req, res);

      // And make sure all output gets to the client.
      res.getOutputStream().flush();
    }
    finally {
      if (trackRunaway)
        ThreadWatcher.endWatch();

      // If any SQL connections were made while processing this 
      // request, close them now.
      //
      SQLConnect.closeThreadConnections();

      // Report latency if requested
      if (config.reportLatency) {
        long latency = System.currentTimeMillis() - reqStartTime;
        boolean alreadyPrinted = (cutoffStream != null &&
                                 cutoffStream.isReported());
        String extraText = alreadyPrinted ? " (final)" : "";
        Trace.info(
          "Latency" + extraText + ": " + latency + " msec for request: " +
          requestUrl);
      } // if
      
      // If any temporary files were created while processing this request,
      // close them now.
      //
      FileUtils.deleteTempFiles();

      // Clean up.
      curServlet.set(null);
      curRequest.set(null);
      curResponse.set(null);
      XTFSaxonErrorListener.clearThreadErrors();
    } // finally
  } // service()

  /**
   * Switch to using a different error generator stylesheet than the default.
   */
  public void setErrorGenSheet(String newPath) {
    errorGenSheet.set(newPath);
  }

  /**
   * Derived classes must supply this method. It is the main entry point for
   * processing an HTTP request.
   */
  public abstract void doGet(HttpServletRequest req, HttpServletResponse res)
    throws IOException;

  /**
   * Derived classes may optionally supply this method. If not supplied, 
   * {@link #doGet(HttpServletRequest, HttpServletResponse)}
   * is called and the parameters are decoded automatically by the
   * {@link HttpServletRequest}, assuming they're URL encoded..
   */
  public void doPost(HttpServletRequest req, HttpServletResponse resp)
    throws IOException, ServletException
  {   
    doGet(req, resp);
  }
  
  /**
   * Derived classes must supply this method. Simply returns the relative
   * path name of the configuration file (e.g. "conf/dynaXml.conf").
   */
  public abstract String getConfigName();

  /**
   * Derived classes must supply this method. It reads in the servlet's
   * configuration file, and performs any derived class initialization
   * as necessary.
   *
   * @param path        Path to the configuration file
   * @return            Parsed config information
   */
  protected abstract TextConfig readConfig(String path);

  /**
   * Derived classes must supply this method. It simply returns the
   * configuration info that was read previously by readConfig()
   */
  public abstract TextConfig getConfig();

  /** Tells whether session tracking was enabled in the config file */
  public boolean isSessionTrackingEnabled() {
    return getConfig().trackSessions;
  }

  /**
   * Gets the full URL, including query parameters, from an HTTP
   * request. This is a bit tricky since different servlet containers
   * return slightly different info.
   */
  public static String getRequestURL(HttpServletRequest req)
  {
    return getRequestURL(req, false);
  }
  
  /**
   * Gets the full URL, including query parameters, from an HTTP
   * request. This is a bit tricky since different servlet containers
   * return slightly different info.
   * 
   * @param raw true to suppress un-escaping of % codes and probable
   *            utf-8 coding in the URL.
   */
  public static String getRequestURL(HttpServletRequest req, boolean raw) 
  {
    // Start with the basics
    String url = req.getRequestURL().toString();

    // Sometimes we don't get the query parameters, sometimes we do. If
    // we didn't get them but there are some, add them on.
    //
    if (url.indexOf('?') < 0 &&
        req.getQueryString() != null &&
        req.getQueryString().length() > 0) 
    {
      url = url + "?" + req.getQueryString();
    }

    // Remove any session ID present.
    if (url.indexOf("jsessionid") >= 0)
      url = url.replaceAll("[&;]jsessionid=[a-zA-Z0-9]+", "");

    // Translate escaping and UTF coding if necessary and requested
    if (!raw) {
      url = decodeURL(url);
      url = convertUTF8inURL(url);
    }

    // All done.
    return url;
  } // getRequestURL()

  /**
   * Adds all URL attributes from the request into a transformer.
   *
   * @param   trans   The transformer to stuff the parameters in
   * @param   req     The request containing the parameters
   */
  public void stuffAttribs(Transformer trans, HttpServletRequest req) 
  {
    Enumeration p = req.getParameterNames();
    while (p.hasMoreElements()) 
    {
      String name = (String)p.nextElement();
      String[] values = req.getParameterValues(name);

      // Skip parameters with empty values.
      if (values != null) {
        for (String value : values)
        {
          if (value == null || value.length() == 0)
            continue;
          
          // Deal with screwy URL encoding of Unicode strings on
          // many browsers.
          //
          value = convertUTF8inURL(value);
          trans.setParameter(name, new StringValue(value));
        }
      }

    }

    stuffSpecialAttribs(req, trans);
  } // stuffAttribs()

  /**
   * Adds all the attributes in the list to the transformer as parameters
   * that can be used by the stylesheet.
   *
   * @param   trans   The transformer to stuff the parameters in
   * @param   list    The list containing attributes to stuff
   */
  public static void stuffAttribs(Transformer trans, AttribList list) 
  {
    for (Iterator i = list.iterator(); i.hasNext();) {
      Attrib a = (Attrib)i.next();
      if (a.value == null || a.value.length() == 0)
        continue;
      trans.setParameter(a.key, new StringValue(a.value));
    }
  } // stuffAttribs()

  /**
   * Calculates and adds the "servlet.path" and "root.path" attributes
   * to the given transformer. Also adds "xtf.home" based on the servlet
   * root directory.
   */
  public void stuffSpecialAttribs(HttpServletRequest req, Transformer trans) 
  {
    // This is useful so the stylesheet can be entirely portable... it
    // can call itself in new URLs by simply using this path. Some servlet
    // containers include the parameters, so strip those if present.
    //
    String uri = req.getRequestURL().toString();
    if (!uri.startsWith("http"))
      uri = req.getRequestURI();
    if (uri.indexOf('?') >= 0)
      uri = uri.substring(0, uri.indexOf('?'));

    // Translate funky UTF-8 coding in URLs
    uri = decodeURL(uri);
    uri = convertUTF8inURL(uri);

    trans.setParameter("servlet.URL", new StringValue(uri));
    trans.setParameter("servlet.path", new StringValue(uri)); // old

    // Another useful parameter is the path to this instance in the
    // servlet container, for other resources such as icons and
    // CSS files.
    //
    String rootPath = uri;
    if (rootPath.endsWith("/"))
      rootPath = rootPath.substring(0, rootPath.length() - 1);

    int slashPos = rootPath.lastIndexOf('/');
    if (slashPos >= 1)
      rootPath = rootPath.substring(0, slashPos);

    String lookFor = "/servlet";
    if (rootPath.endsWith(lookFor))
      rootPath = rootPath.substring(0, rootPath.length() - lookFor.length());

    rootPath = rootPath + "/";
    trans.setParameter("root.URL", new StringValue(rootPath));
    trans.setParameter("root.path", new StringValue(rootPath)); // old

    // Stylesheets often access local files directly, and it can be quite 
    // a pain for them to always use relative paths, since Saxon resolves
    // these relative to the stylesheet directory. Therefore, pass the
    // servlet home directory to allow direct access.
    //
    String xtfHome = Path.normalizePath(getRealPath(""));
    trans.setParameter("servlet.dir", xtfHome);

    // Stuff all the HTTP request parameters for the stylesheet to
    // use if it wants to.
    //
    Enumeration i = req.getHeaderNames();
    trans.setParameter("http.URL", getRequestURL(req));
    trans.setParameter("http.rawURL", getRequestURL(req, true));
    while (i.hasMoreElements()) {
      String name = (String)i.nextElement();
      String value = req.getHeader(name);

      // For backward compatibility, stuff the parameter exactly as named
      trans.setParameter("http." + name, new StringValue(value));

      // But for ease of standardized code, make sure the lower-case version is
      // also available at all times.
      //
      if (!(name.equals(name.toLowerCase())))
        trans.setParameter("http." + (name.toLowerCase()), new StringValue(value));
    }
  } // stuffSpecialAttribs()

  /**
   * Reads a brand profile (a simple stylesheet) and stuffs all the output
   * tags into the specified transformer as parameters.
   *
   * @param path          Filesystem path to the brand profile
   * @param req           HTTP servlet request containing URL parameters
   * @param targetTrans   Where to stuff the attributes into
   * @throws Exception    If an error occurs loading or parsing the profile.
   */
  protected void readBranding(String path, HttpServletRequest req,
                              Transformer targetTrans)
    throws Exception 
  {
    if (path == null || path.equals(""))
      return;

    // First, load the stylesheet.
    Templates pss = stylesheetCache.find(path);

    // Make a transformer and stuff it full of parameters.
    Transformer trans = pss.newTransformer();
    stuffAttribs(trans, req);
    stuffAttribs(trans, getConfig().attribs);

    // Make a tiny document for it to transform
    String doc = "<dummy>dummy</dummy>\n";
    StreamSource src = new StreamSource(new StringReader(doc));

    // Make sure errors get directed to the right place.
    if (!(trans.getErrorListener() instanceof XTFSaxonErrorListener))
      trans.setErrorListener(new XTFSaxonErrorListener());

    // Now request it to give us the info we crave.
    TreeBuilder result = new TreeBuilder();
    trans.transform(src, result);

    // Process all the tags.
    EasyNode root = new EasyNode(result.getCurrentRoot());
    for (int i = 0; i < root.nChildren(); i++) 
    {
      EasyNode el = root.child(i);
      if (!el.isElement())
        continue;

      String tagName = el.name();
      String strVal = getText(el);

      targetTrans.setParameter(tagName, new StringValue(strVal));
    } // for node
  } // readBranding()

  /**
   * Makes a Saxon Receiver that will transparently add a session IDs
   * to URLs if they match the servlet URL, or other patterns configured
   * in the conf file.
   *
   * @param trans   The transformer that will do the work
   * @param req     The servlet request being processed
   * @param res     The servlet response to output to
   * @return        A Receiver suitable for the target of the transform
   */
  public Result createFilteredReceiver(Transformer trans,
                                       HttpServletRequest req,
                                       HttpServletResponse res)
    throws XPathException, IOException 
  {
    StreamResult stream = new StreamResult(res.getOutputStream());

    TextConfig config = getConfig();
    if (config.trackSessions && config.sessionEncodeURLPattern != null) 
    {
      // NOTE: It's a good thing we're no longer defaulting to doing this, because it
      // effectively prevents Saxon from being able to switch the xsl:output parameters
      // during the transformation (such as in response to an xsl:result-document
      // element.)
      //
      Controller controller = (Controller)trans;
      SerializerFactory factory = controller.getConfiguration().getSerializerFactory();
      Receiver target = factory.getReceiver(stream,
                                            controller.makePipelineConfiguration(),
                                            trans.getOutputProperties());
      return new SessionURLRewriter(target,
                                    config.sessionEncodeURLPattern,
                                    req,
                                    res);
    }
    else
    {
      // Return a StreamResult, not a Receiver. This allows Saxon to change the output
      // parameters during the transformation (e.g. in response to xsl:result-document).
      return stream;
    }
  } // createFilteredReceiver

  /**
   * Translates any HTML-special characters (like quote, ampersand, etc.)
   * into the corresponding code (like &amp;quot;)
   *
   * @param s The string to transform
   */
  public static String makeHtmlString(String s) {
    return makeHtmlString(s, false);
  }

  /**
   * Translates any HTML-special characters (like quote, ampersand, etc.)
   * into the corresponding code (like &amp;quot;)
   *
   * @param s The string to transform
   */
  public static String makeHtmlString(String s, boolean keepTags) 
  {
    if (s == null)
      return "";

    StringBuffer buf = new StringBuffer();

    boolean inTag = false;

    for (int i = 0; i < s.length(); i++) 
    {
      char c = s.charAt(i);

      if (keepTags && !inTag && c == '<') {
        inTag = true;
        buf.append(c);
        continue;
      }

      if (keepTags && inTag && c == '>') {
        inTag = false;
        buf.append(c);
        continue;
      }

      if (inTag) {
        buf.append(c);
        continue;
      }

      // Leave existing entities alone.
      if (c == '&') 
      {
        int j;
        for (j = i + 1; j < s.length(); j++) {
          if (!Character.isLetterOrDigit(s.charAt(j)))
            break;
        }
        if (j < s.length() && s.charAt(j) == ';') {
          while (i <= j)
            buf.append(s.charAt(i++));
          i--;
          continue;
        }
      }

      // Characters 0-31 (except 9, 11, and 13) are not legal in HTML
      // or XLM, so filter them out.
      if (c >= 0 && c <= 31 && c != 9 && c != 11 && c != 13)
        continue;
      
      switch (c) 
      {
        // Translate special characters to known HTML entities     
        case '<':  buf.append("&lt;");    break;
        case '>':  buf.append("&gt;");    break;
        case '&':  buf.append("&amp;");   break;
        case '\'': buf.append("&apos;");  break;
        case '\"': buf.append("&quot;");  break;
        case '\n': buf.append("<br/>\n"); break;
        
        // Characters 128-159 are not legal in HTML (nor generally in Unicode).
        // We have no way of knowing where they came from, so we make a 
        // reasonable guess and treat them as ANSI. The equivalency below comes
        // from http://www.alanwood.net/demos/ansi.html, accessed on 
        // 30-Oct-2007.
        //
        case 128:  buf.append("\u20ac");  break;
        case 129:  buf.append("\u0081");  break;
        case 130:  buf.append("\u201A");  break;
        case 131:  buf.append("\u0192");  break;
        case 132:  buf.append("\u201E");  break;
        case 133:  buf.append("\u2026");  break;
        case 134:  buf.append("\u2020");  break;
        case 135:  buf.append("\u2021");  break;
        case 136:  buf.append("\u02C6");  break;
        case 137:  buf.append("\u2030");  break;
        case 138:  buf.append("\u0160");  break;
        case 139:  buf.append("\u2039");  break;
        case 140:  buf.append("\u0152");  break;
        case 141:  buf.append("\u008D");  break;
        case 142:  buf.append("\u017D");  break;
        case 143:  buf.append("\u008F");  break;
        case 144:  buf.append("\u0090");  break;
        case 145:  buf.append("\u2018");  break;
        case 146:  buf.append("\u2019");  break;
        case 147:  buf.append("\u201C");  break;
        case 148:  buf.append("\u201D");  break;
        case 149:  buf.append("\u2022");  break;
        case 150:  buf.append("\u2013");  break;
        case 151:  buf.append("\u2014");  break;
        case 152:  buf.append("\u02DC");  break;
        case 153:  buf.append("\u2122");  break;
        case 154:  buf.append("\u0161");  break;
        case 155:  buf.append("\u203A");  break;
        case 156:  buf.append("\u0153");  break;
        case 157:  buf.append("\u009D");  break;
        case 158:  buf.append("\u017E");  break;
        case 159:  buf.append("\u0178");  break;
        
        // All other characters need no translation.
        default:
          buf.append(c);
          break;
      }
    }

    return buf.toString();
  } // makeHtmlString()

  /**
   * Create a QueryProcessor. Checks the system property
   * "org.cdlib.xtf.QueryProcessorClass" to see if there is a user-
   * supplied implementation. If not, a {@link DefaultQueryProcessor} is
   * created.
   */
  public QueryProcessor createQueryProcessor() 
  {
    // Check the system property.
    final String propName = "org.cdlib.xtf.QueryProcessorClass";
    String className = System.getProperty(propName);
    Class theClass = DefaultQueryProcessor.class;
    try 
    {
      // Try to create an object of the correct class.
      if (className != null)
        theClass = Class.forName(className);
      QueryProcessor processor = (QueryProcessor)theClass.newInstance();
      
      // Enable background index warming
      IndexWarmer warmer = null;
      synchronized (indexWarmers) {
        String xtfHome = Path.normalizePath(TextServlet.getCurServlet().getRealPath(""));
        warmer = indexWarmers.get(xtfHome);
        if (warmer == null) {
          warmer = new IndexWarmer(xtfHome, 60); // TODO: Make interval configurable
          indexWarmers.put(xtfHome, warmer);
        }
      }
      processor.setIndexWarmer(warmer);
      
      // And we're done.
      return processor;
    }
    catch (ClassCastException e) {
      Trace.error(
        "Error: Class '" + className + "' specified by " + "the '" + propName +
        "' property is not an instance of " + QueryProcessor.class.getName());
      throw new RuntimeException(e);
    }
    catch (Exception e) {
      Trace.error(
        "Error creating instance of class '" + className +
        "' specified by the '" + propName + "' property");
      throw new RuntimeException(e);
    }
  } // createQueryProcessor()

  /**
   * Certain methods of HttpServletRequest do not decode escaped
   * characters in the URL. This method decodes them, and also
   * translates UTF-8 byte sequences into normal characters.
   */
  public static String decodeURL(String value) 
  {
    // Decode any escaped characters in the URL.
    try {
      return URLDecoder.decode(value, "utf-8");
    }
    catch (UnsupportedEncodingException e) {
      throw new RuntimeException(e);
    }
  } // decodeURL()

  /**
   * Although not completely standardized yet, most modern browsers
   * encode Unicode characters above U+007F to UTF8 in the URL. This
   * method looks for probably UTF8 encodings and converts them back
   * to normal Unicode characters.
   *
   * One might ask why this is necessary... doesn't URLDecoder handle
   * it? Well, some servlet containers seem to partially decode
   * URLs; they decode the escapes, but then they don't do the
   * UTF-8 conversion.
   *
   * @param value   value to convert
   * @return        equivalent value with UTF8 decoded to Unicode
   */
  public static String convertUTF8inURL(String value) 
  {
    // Scan the string, looking for likely UTF8.
    char[] chars = value.toCharArray();
    boolean foundUTF = false;
    for (int i = 0; i < chars.length; i++) 
    {
      char c = chars[i];

      // If somehow we already have 2-byte chars, this probably isn't
      // a UTF8 string.
      //
      if ((c & 0xFF00) != 0)
        return value;

      // Skip the ASCII chars
      if (c <= 0x7F)
        continue;

      // Look for a two-byte sequence
      if (c >= 0xC0 &&
          c <= 0xDF &&
          i + 1 < chars.length &&
          chars[i + 1] >= 0x80 &&
          chars[i + 1] <= 0xBF) 
      {
        foundUTF = true;
        i++;
      }

      // Look for a three-byte sequence
      else if (c >= 0xE0 &&
               c <= 0xEF &&
               i + 2 < chars.length &&
               chars[i + 1] >= 0x80 &&
               chars[i + 1] <= 0xBF &&
               chars[i + 2] >= 0x80 &&
               chars[i + 2] <= 0xBF) 
      {
        foundUTF = true;
        i += 2;
      }

      // Look for a four-byte sequence
      else if (c >= 0xF0 &&
               c <= 0xF7 &&
               i + 3 < chars.length &&
               chars[i + 1] >= 0x80 &&
               chars[i + 1] <= 0xBF &&
               chars[i + 2] >= 0x80 &&
               chars[i + 2] <= 0xBF &&
               chars[i + 3] >= 0x80 &&
               chars[i + 3] <= 0xBF) 
      {
        foundUTF = true;
        i += 3;
      }

      // Trailing bytes without leading bytes are illegal, and thus
      // likely this string isn't UTF8 encoded.
      //
      else if (c >= 0x80 && c <= 0xBF)
        return value;

      // Certain other bytes are also illegal.
      else if (c >= 0xF8 && c <= 0xFF)
        return value;
    }

    // No UTF8 chars found? Nothing to do.
    if (!foundUTF)
      return value;

    // Okay, convert the UTF8 value to Unicode.
    try {
      byte[] bytes = value.getBytes("ISO-8859-1");
      return new String(bytes, "UTF-8");
    }
    catch (UnsupportedEncodingException e) {
      return value;
    }
  } // convertUTF8inURL()

  /**
   * Creates a document containing tokenized and untokenized versions of each
   * parameter.
   */
  public void buildParamBlock(AttribList atts, XMLFormatter fmt,
                              Map tokenizerMap, String extra) 
  {
    // The top-level node marks the fact that this is the parameter list.
    fmt.beginTag("parameters");

    // Insert extra text here, verbatim.
    if (extra != null)
      fmt.rawText(extra + "\n");

    // Add each parameter to the document.
    for (Iterator iter = atts.iterator(); iter.hasNext();) 
    {
      Attrib att = (Attrib)iter.next();

      // Don't add built-in attributes.
      if (att.key.equals("servlet.path"))
        continue;
      if (att.key.equals("root.path"))
        continue;
      if (att.key.startsWith("http."))
        continue;
      if (att.key.equals("raw"))
        continue;
      if (att.key.equals("debugStep"))
        continue;

      // Don't add empty attributes.
      if (att.value == null || att.value.length() == 0)
        continue;

      // Got one. Let's add (and optionally tokenize) it.
      addParam(fmt, att.key, att.value, tokenizerMap);
    }

    fmt.endTag();
  } // buildParamBlock()

  /**
   * Adds the tokenized and un-tokenized version of the attribute to the
   * given formatter.
   *
   * @param fmt formatter to add to
   * @param name Name of the URL parameter
   * @param val String value of the URL parameter
   * @param tokenizerMap tells which parameters to tokenize, and how
   */
  protected void addParam(XMLFormatter fmt, String name, String val,
                          Map tokenizerMap) 
  {
    // Create the parameter node and assign its name and value.
    fmt.beginTag("param");
    fmt.attr("name", name);
    fmt.attr("value", val);

    // Now tokenize it.
    if (tokenizerMap != null) 
    {
      String tokenizer = (String)tokenizerMap.get(name);
      if (tokenizer == null ||
          tokenizer.equalsIgnoreCase("default") ||
          tokenizer.equalsIgnoreCase("basic")) 
      {
        defaultTokenize(fmt, name, val);
      }
      else if (tokenizer.equalsIgnoreCase("CQL"))
        cqlTokenize(fmt, name, val);
      else if (tokenizer.equalsIgnoreCase("raw"))
        rawTokenize(fmt, name, val);
    }

    // All done.
    fmt.endTag();
  } // addParam()
  
  /**
   * Interpret 'val' as a raw XML element, and output it.
   *
   * @param fmt formatter to add to
   * @param name Name of the URL parameter
   * @param val value to tokenize
   * @throws TransformerException 
   */
  protected void rawTokenize(XMLFormatter fmt, String name, String val) 
  {
    // First, we need to parse the text as an XML document. That way we can be
    // really sure that it *is* XML.
    //
    StringWriter strOut = new StringWriter();
    try 
    {
      Transformer trans = IndexUtil.createTransformer();
      Properties props = trans.getOutputProperties();
      props.put("indent", "yes");
      props.put("method", "xml");
      props.put("omit-xml-declaration", "yes");
      trans.setOutputProperties(props);
      
      trans.transform(new StreamSource(new StringReader(val)), new StreamResult(strOut));
    }
    catch (TransformerException e) {
      throw new RuntimeException(e);
    }
    
    // Then copy that XML to the output.
    fmt.rawText(strOut.toString());
  }

  /**
   * Break 'val' up into its component tokens and add elements for them.
   *
   * @param fmt formatter to add to
   * @param name Name of the URL parameter
   * @param val value to tokenize
   */
  protected void defaultTokenize(XMLFormatter fmt, String name, String val) 
  {
    char[] chars = val.toCharArray();
    char inQuote = 0;
    String tmpStr;

    int i;
    int start = 0;
    for (i = 0; i < chars.length; i++) 
    {
      char c = chars[i];

      if (c == inQuote) 
      {
        if (i > start) {
          tmpStr = new String(chars, start, i - start);
          addTokens(inQuote, fmt, tmpStr);
        }
        inQuote = 0;
        start = i + 1;
      }
      else if (inQuote == 0 && c == '\"') {
        if (i > start) {
          tmpStr = new String(chars, start, i - start);
          addTokens(inQuote, fmt, tmpStr);
        }
        inQuote = c;
        start = i + 1;
      }
      else
        ; // Don't change start... has result of building up a token.
    } // for i

    // Process the last tokens
    if (i > start) {
      tmpStr = new String(chars, start, i - start);
      addTokens(inQuote, fmt, tmpStr);
    }
  } // tokenize()

  /**
   * Parse 'val' as a CQL query, and add the resulting XCQL to the parameter.
   *
   * @param fmt formatter to add to
   * @param name Name of the URL parameter
   * @param val value to tokenize
   */
  protected void cqlTokenize(XMLFormatter fmt, String name, String val) 
  {
    CQLParser parser = new CQLParser();
    try {
      CQLNode parsed = parser.parse(val);
      String text = parsed.toXCQL(fmt.tabCount() / 2);
      fmt.rawText(text);
    }
    catch (org.z3950.zing.cql.CQLParseException e) {
      throw new CQLParseException(e.getMessage());
    }
    catch (IOException e) {
      throw new RuntimeException(e);
    }
  } // tokenize()

  /**
   * Adds one or more token elements to a parameter node. Also handles
   * phrase nodes.
   *
   * @param inQuote Non-zero means this is a quoted phrase, in which case the
   *                element will be 'phrase' instead of 'token', and it will
   *                be given sub-token elements.
   * @param fmt formatter to add to
   * @param str The token value
   */
  protected void addTokens(char inQuote, XMLFormatter fmt, String str) 
  {
    // If this is a quoted phrase, tokenize the words within it.
    if (inQuote != 0) {
      fmt.beginTag("phrase");
      fmt.attr("value", str);
      defaultTokenize(fmt, "phrase", str);
      fmt.endTag();
      return;
    }

    // We want to retain wildcard characters, but the tokenizer won't see
    // them as part of a word. So substitute, temporarily.
    //
    str = saveWildcards(str);

    // Otherwise, use a tokenizer to break up the string. Do not perform
    // lower-case conversion, apostrophe removal, etc. That should all
    // happen later, at query processing time.
    //
    try 
    {
      XTFTokenizer toks = new XTFTokenizer(new StringReader(str));
      FastTokenizer ftoks = new FastTokenizer(new FastStringReader(str));
      int prevEnd = 0;
      while (true) {
        Token tok = toks.next();
        if (tok == null)
          break;
        
        // Ensure that FastTokenizer produces *exactly* the same results. If it doesn't,
        // that means our index is probably messed up. This way we'll catch these problems
        // pro-actively instead of relying on end users to realize that there's some
        // nefarious reason their queries come back with nothing.
        //
        Token ftok = ftoks.next();
        assert ftok != null && ftok.termText().equals(tok.termText()) :
               "Internal XTF bug: FastTokenizer isn't functioning the same as XTFTokenizer. " +
               "Please report this problem to the xtf-user group, along with your query.";
        
        if (tok.startOffset() > prevEnd)
          addToken(fmt, str.substring(prevEnd, tok.startOffset()), false);
        prevEnd = tok.endOffset();
        addToken(fmt, tok.termText(), true);
      }
      if (str.length() > prevEnd)
        addToken(fmt, str.substring(prevEnd, str.length()), false);
    }
    catch (IOException e) {
      assert false : "How can analyzer throw IO error on string buffer?";
    }
  } // addToken()

  /**
   * Adds a token element to a parameter node.
   *
   * @param fmt formatter to add to
   * @param str The token value
   * @param isWord true if  token is a real word, false if only punctuation
   */
  protected void addToken(XMLFormatter fmt, String str, boolean isWord) 
  {
    // Remove spaces. If nothing is left, don't bother making a token.
    str = str.trim();
    if (str.length() == 0)
      return;

    // Recover wildcards that were saved.
    str = restoreWildcards(str);

    // And create the node
    fmt.beginTag("token");
    fmt.attr("value", str);
    fmt.attr("isWord", isWord ? "yes" : "no");
    fmt.endTag();
  } // addToken()

  /**
   * Converts wildcard characters into word-looking bits that would never
   * occur in real text, so the standard tokenizer will keep them part of
   * words. Resurrect using {@link #restoreWildcards(String)}.
   */
  protected static String saveWildcards(String s) 
  {
    // Early out if no wildcards found.
    if (s.indexOf('*') < 0 && s.indexOf('?') < 0)
      return s;

    // Convert to wordish stuff.
    s = s.replaceAll("\\*", SAVE_WILD_STAR);
    s = s.replaceAll("\\?", SAVE_WILD_QMARK);
    return s;
  } // saveWildcards()

  /**
   * Restores wildcards saved by {@link #saveWildcards(String)}.
   */
  protected static String restoreWildcards(String s) 
  {
    // Early out if no wildcards found.
    if (s.indexOf(SAVE_WILD_STAR) < 0 && s.indexOf(SAVE_WILD_QMARK) < 0)
      return s;

    // Convert back from wordish stuff to real wildcards.
    s = s.replaceAll(SAVE_WILD_STAR, "*");
    s = s.replaceAll(SAVE_WILD_QMARK, "?");
    return s;
  } // restoreWildcards()

  /**
   * Given a stylesheet, determine what the Mime type of the servlet
   * response should be.
   */
  protected static String calcMimeType(Templates stylesheet) 
  {
    Properties details = stylesheet.getOutputProperties();
    String mime = details.getProperty(OutputKeys.MEDIA_TYPE);
    if (mime == null) {
      String method = details.getProperty(OutputKeys.METHOD);
      if (method == null)
        mime = "text/html"; // Take a guess.
      else if (method.equalsIgnoreCase("xml"))
        mime = "text/xml";
      else if (method.equalsIgnoreCase("xhtml"))
        mime = "application/xhtml+xml";
      else if (method.equals("text"))
        mime = "text/plain";
      else if (method.equals("html"))
        mime = "text/html";
      else
        mime = "text/html"; // Take a guess.
    }
    return mime;
  } // calcMimeType

  /**
  * Generate an error page based on the given exception. Utilizes the system
  * error stylesheet to produce a nicely formatted HTML page.
  *
  * @param req  The HTTP request we're responding to
  * @param res  The HTTP result to write to
  * @param exc  The exception producing the error. If it's a
  *             DynaXMLException, the attributes will be passed to
  *             the error stylesheet.
  */
  protected void genErrorPage(HttpServletRequest req, HttpServletResponse res,
                              Exception exc) 
  {
    // If Saxon errors occurred, use those as the stack trace.
    String strStackTrace;
    String[] saxonErrors = XTFSaxonErrorListener.getThreadErrors();
    if (saxonErrors != null) {
      StringBuffer buf = new StringBuffer();
      for (String s : saxonErrors)
        buf.append(s + "\n");
      buf.append("\n");
      strStackTrace = buf.toString();
    }
    else
    {
      // Contort to obtain a string version of the Java stack trace.
      ByteArrayOutputStream traceStream = new ByteArrayOutputStream();
      exc.printStackTrace(new PrintStream(traceStream));
      strStackTrace = traceStream.toString();
    }
    
    String htmlStackTrace = makeHtmlString(strStackTrace);

    try 
    {
      ServletOutputStream out = res.getOutputStream();

      // If we are in raw mode, use a null transform instead of the
      // stylesheet.
      //
      Transformer trans;
      String raw = req.getParameter("raw");
      if (raw == null)
        raw = (String) req.getAttribute("org.cdlib.xtf.servlet.raw");
      if ("yes".equals(raw) || "true".equals(raw) || "1".equals(raw)) 
      {
        res.setContentType("text/xml");

        trans = IndexUtil.createTransformer();
        Properties props = trans.getOutputProperties();
        props.put("indent", "yes");
        props.put("method", "xml");
        trans.setOutputProperties(props);
      }
      else
      {
        // First, load the error generating stylesheet.
        TextConfig config = getConfig();
        Templates pss = stylesheetCache.find(errorGenSheet.get());

        // Figure out the output mime type
        res.setContentType(calcMimeType(pss));

        // Make a trans and put attributes from the HTTP request
        // and from the global config file into it as attributes that
        // the stylesheet can use.
        //
        trans = pss.newTransformer();
        stuffAttribs(trans, req);
        stuffAttribs(trans, config.attribs);
      }

      // Figure out just the last part of the exception class name.
      String className = exc.getClass().getName().replaceAll(".*\\.", "").
        replaceAll(".*\\$", "").replaceAll("Exception", "").replaceAll("Error", "");

      // Now make a document that the stylesheet can parse. Inside it
      // we'll put the exception info.
      //
      StringBuffer doc = new StringBuffer(2048);
      doc.append("<" + className + ">\n");
      trans.setParameter("exception", new StringValue(className));

      // Give the message (if any)
      String msg = makeHtmlString(exc.getMessage());
      if (!isEmpty(msg)) {
        doc.append("<message>" + msg + "</message>\n");
        trans.setParameter("message", new StringValue(msg));
      }

      // Add any attributes if this is a GeneralException
      if (exc instanceof GeneralException) 
      {
        GeneralException bve = (GeneralException)exc;
        for (Iterator i = bve.attribs.iterator(); i.hasNext();) 
        {
          Attrib a = (Attrib)i.next();

          doc.append("<" + a.key + ">");
          doc.append(a.value);
          doc.append("</" + a.key + ">\n");
          trans.setParameter(a.key, new StringValue(a.value));
        }
      }

      // Socket exceptions are pretty common (clients disconnect all the time before
      // they finish downloading a page or file), so work extra hard to identify those.
      //
      boolean isSocketExc = false;
      HashSet<Object> alreadyTraversed = new HashSet();
      for (Throwable t = exc; !isSocketExc && t != null && !alreadyTraversed.contains(t); )
      {
        // Avoid infinite loops
        alreadyTraversed.add(t);
        
        // This is what you would expect
        if (t instanceof SocketException)
          isSocketExc = true;
        
        // But this is actually what happens in Tomcat
        else if (t.getClass().getName().contains("ClientAbortException"))
          isSocketExc = true;
        
        // Unwrap things
        else if (t instanceof TransformerException && ((TransformerException)t).getException() != null)
          t = ((TransformerException)t).getException();
        else if (t.getCause() != null)
          t = t.getCause();
      }
      
      // Give the stack trace, but only if this is *not* a normal
      // servlet exception. (The normal ones happen normally, and
      // thus don't need stack traces for debugging.)
      //
      boolean isNormalException = isSocketExc ||
          exc instanceof ExcessiveWorkException ||
          exc instanceof TermLimitException ||
          exc instanceof SocketException ||
          (exc instanceof GeneralException && !((GeneralException)exc).isSevere());
      
      if (!isNormalException) {
        doc.append("<stackTrace>\n" + htmlStackTrace + "</stackTrace>\n");
        trans.setParameter("stackTrace", new StringValue(htmlStackTrace));
      }

      doc.append("</" + className + ">\n");

      // If this is a socket exception or a severe problem, log it.
      if (isSocketExc)
        Trace.warning("Warning (socket exception): " + msg.toString());
      else if (!isNormalException)
        Trace.error("Error: " + doc.toString().replaceAll("<br/>\n", ""));

      // If the response hasn't been committed, send back the formatted error page.
      if (!res.isCommitted()) {
        StreamSource src = new StreamSource(new StringReader(doc.toString()));
        StreamResult dst = new StreamResult(out);
        trans.transform(src, dst);
      }
    }
    catch (Exception e) {
      // For some reason, we couldn't load or run the error generator.
      // Try to output a reasonable default.
      //
      try 
      {
        Trace.error(
          "Unable to generate error page because: " + e.toString() + "\n" +
          "Original problem: " + exc.toString() + "\n" + strStackTrace);

        // The output stream is only writable if not already commited.
        if (!res.isCommitted()) {
          ServletOutputStream out = res.getOutputStream();
  
          out.println("<HTML><BODY>");
          out.println("<B>Servlet configuration error:</B><br/>");
          out.println("Unable to generate error page: " + e.toString() +
                      "<br>");
          out.println("Caused by: " + exc.toString() + "<br/>" +
                      htmlStackTrace);
          out.println("</BODY></HTML>");
        }
      }
      catch (IOException e2) {
        // We couldn't even write to the output stream. Give up.
      }
    }
  } // genErrorPage()

  /**
   * Generate an AttribList from the parameters in a servlet request. Deals
   * some URL encoding issues introduced by many browsers.
   * 
   * @param req Request to scan for attributes
   * @return    An AttribList containing the parameter names and value
   */
  protected AttribList makeAttribList(HttpServletRequest req) {
    AttribList attribs = new AttribList();
    Enumeration p = req.getParameterNames();
    while (p.hasMoreElements()) 
    {
      String name = (String)p.nextElement();
  
      // Deal with screwy URL encoding of Unicode strings on many browsers.
      String[] values = req.getParameterValues(name);
      if (values != null) {
        for (String value : values)
          attribs.put(name, convertUTF8inURL(value));
      }
    }
    
    return attribs;
  }

  /**
   * Wraps a servlet request, substituting a different parameter set that
   * allows ';' in addition to '&' as a separator. Also, removes any session
   * ID in the URL.
   * 
   * Note: Some deprecated methods are included in HttpServletRequestWrapper.
   * Since there's nothing we can do about that, we simply suppress warnings
   * about that.
   */
  @SuppressWarnings("deprecation")
  private class RequestWrapper extends HttpServletRequestWrapper 
  {
    HttpServletRequest inReq;

    RequestWrapper(HttpServletRequest inReq) {
      super(inReq);
      this.inReq = inReq;
    }

    ArrayList<String> paramNames;
    HashMap<String, ArrayList<String>> params;
    
    private void init() 
    {
      if (params != null)
        return;

      paramNames = new ArrayList();
      params = new HashMap();
      
      Enumeration paramNames = inReq.getParameterNames();
      while (paramNames.hasMoreElements()) 
      {
        String paramName = (String)paramNames.nextElement();
        String[] vals = inReq.getParameterValues(paramName);

        for (String val : vals)
        {
          // If no semicolon, there's no need for special processing.
          if (val.indexOf(';') < 0) 
          {
            if (!paramName.equals("jsessionid"))
              addParam(paramName, val);
            continue;
          }
          
          // We need to know if any semicolons or equal signs here were actually escaped
          // in the URL. This is a complex routine and if it fails it could really bring 
          // down a production system. So fall back if necessary to printing a warning
          // and just going on the old way.
          //
          try {
            val = protectChars(paramName, val);
          }
          catch (Throwable t) {
            Trace.warning("Warning: unexpected error protecting URL escape codes: " + t.toString());
          }
          
          // Break up semicolon separated things.
          StringTokenizer tokenizer = new StringTokenizer(val, ";");
          String name = paramName;
          StringBuffer valbuf = new StringBuffer();
          while (tokenizer.hasMoreTokens()) 
          {
            String tok = tokenizer.nextToken();

            // Locate the first equal sign (outside of quotes)
            int equalPos = -1;
            boolean inQuote = false;
            for (int i=0; i<tok.length() && equalPos < 0; i++) {
              if (tok.charAt(i) == '"')
                inQuote = !inQuote;
              else if (!inQuote && tok.charAt(i) == '=')
                equalPos = i;
            }
            equalPos = tok.indexOf('=');
            
            // If there is one, that means we have a parameter here
            if (equalPos >= 0) {
              if (!name.equals("jsessionid"))
                addParam(name,valbuf.toString());
              valbuf.setLength(0);
              name = unprotectChars(tok.substring(0, equalPos));
              valbuf.append(unprotectChars(tok.substring(equalPos + 1)));
            }
            else {
              if (valbuf.length() > 0)
                valbuf.append(";"); // put back
              valbuf.append(unprotectChars(tok));
            }
          } // while
          
          if (!name.equals("jsessionid"))
            addParam(name, valbuf.toString());
        } // for
      } // while
    } // init()

    /** Special code to protect semicolons in protectChars() */
    private char semiChar = '\uE010';
    
    /** Special code to protect equal signs in protectChars() */
    private char equalChar = '\uE012';
    
    private char[] hexChars = "0123456789ABCDEF".toCharArray();

    /**
     * Protect '=' and ';' characters that were actually escaped with % codes in
     * the original URL. Escaping indicates that the user wanted to query for
     * these, so we should not use them as parameter separators. 
     * 
     * @param paramName Name of the parameter we're working on
     * @param val       Unescaped value to protect
     * @return          Value with % coded '=' or ';' translated to
     *                  equalChar or semiChar respectively.
     */
    private String protectChars(String paramName, String val)
    {
      // Unfortunately, the servlet container has already un-escaped the
      // % codes for us. So we need to refer to the original raw URL to
      // see if they were there. Originally the idea was to form a great
      // big regular expression to match the relevant part of the URL 
      // and extract the parts that are '=' or ';'. However, Java gets
      // pretty inefficient on such a complicated regex, so we have to
      // roll our own.
      //
      String origUrl = TextServlet.getRequestURL(inReq, true);
      int start = 0;
      char[] origChars = origUrl.toCharArray();
      char[] valChars = val.toCharArray();
      String lookFor = paramName + "=";
      while (true) 
      {
        StringBuilder newVal = new StringBuilder(val.length());
        int origPos = origUrl.indexOf(lookFor, start);
        if (origPos < 0) {
          Trace.warning("Warning: failed to match escape codes for param '" + paramName + "' in URL '" + origUrl + "'");
          return val;
        }
        
        int sp = origPos + lookFor.length();
        int i;
        for (i=0; i<valChars.length; i++) {
          char ch = valChars[i];
          boolean pctMatch = matchHex(origChars, sp, origChars.length, ch);
          if (pctMatch) 
          {
            if (ch == ';')
              newVal.append(semiChar);
            else if (ch == '=')
              newVal.append(equalChar);
            else
              newVal.append(ch);
            sp += 3;
          }
          else if (origChars[sp] == ch) {
            newVal.append(ch);
            ++sp;
          }
          else
            break;
        }
        if (i == valChars.length)
          return newVal.toString();
        start = sp+1;
      }
    }

    /** See if there's a '%XX' hex code at the given position for the value. */
    private boolean matchHex(char[] src, int sp, int max, int val)
    {
      if (max - sp < 3)
        return false;
      if (val > 255)
        return false;
      if (src[sp] != '%')
        return false;
      if (Character.toUpperCase(src[sp+1]) != hexChars[val >> 4])
        return false;
      if (Character.toUpperCase(src[sp+2]) != hexChars[val & 0xF])
        return false;
      return true;
    }
    
    /**
     * Translates protected '=' and ';' characters from protectChars above
     * back into regular characters.
     * 
     * @param val       Value possibly containing protected characters.
     * @return          Same value but with unprotected characters.
     */
    private String unprotectChars(String val)
    {
      val = val.replace(semiChar, ';');
      val = val.replace(equalChar, '=');
      return val;
    }
      
    private void addParam(String name, String val)
    {
      ArrayList<String> vals = params.get(name);
      if (vals == null) {
        paramNames.add(name);
        vals = new ArrayList<String>();
        params.put(name, vals);
      }
      vals.add(val);
    }

    @Override
    public Enumeration getParameterNames() 
    {
      init();
      final Iterator iter = paramNames.iterator();
      return new Enumeration() {
        public boolean hasMoreElements() { return iter.hasNext(); } 
        public Object nextElement() { return iter.next(); }
      };
    }

    @Override
    public String getParameter(String name) 
    {
      init();
      ArrayList<String> vals = params.get(name);
      if (vals == null)
        return null;
      return vals.get(0);
    }

    @Override
    public String[] getParameterValues(String name) 
    {
      init();
      ArrayList<String> vals = params.get(name);
      if (vals == null)
        return null;
      return vals.toArray(new String[vals.size()]);
    }

    @Override
    public Map getParameterMap() {
      throw new UnsupportedOperationException();
    }
  } // class RequestWrapepr

  /**
   * Wraps a servlet response, substituting a different output stream
   * 
   * Note: Some deprecated methods are included in HttpServletResponseWrapper.
   * Since there's nothing we can do about that, we simply suppress warnings
   * about that.
   */
  @SuppressWarnings("deprecation")
  private class ResponseWrapper extends HttpServletResponseWrapper 
  {
    private ServletOutputStream substOutStream;

    ResponseWrapper(HttpServletResponse toWrap,
                    ServletOutputStream substOutStream) 
    {
      super(toWrap);
      this.substOutStream = substOutStream;
    }

    public ServletOutputStream getOutputStream()
      throws IOException 
    {
      return substOutStream;
    }
  } // class ResponseWrapper
} // class TextServlet
