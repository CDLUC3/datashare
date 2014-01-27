package org.cdlib.xtf.crossQuery;


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
import org.cdlib.xtf.servletBase.TextConfig;
import org.cdlib.xtf.util.GeneralException;

/** Holds global configuration information for the crossQuery servlet. */
public class CrossQueryConfig extends TextConfig 
{
  /**
   * The stylesheet used route an HTTP request to the appropriate query
   * parser stylesheet.
   */
  public String queryRouterSheet;

  /**
   * The stylesheet used to parse a query from an HTTP request, into an XML
   * format usable by the text engine (only specified if no query router).
   */
  public String queryParserSheet;

  /** Default constructor */
  public CrossQueryConfig(CrossQuery servlet) {
    super(servlet);
  }

  /**
   * Constructor - Reads and parses the global configuration file (XML) for
   * the crossQuery servlet.
   *
   * @param  path               Filesystem path to the config file.
   * @throws GeneralException   If a read or parse error occurs.
   */
  public CrossQueryConfig(CrossQuery servlet, String path)
    throws GeneralException 
  {
    super(servlet);
    super.read("crossQuery-config", path);

    // Make sure required things were specified.
    if (queryRouterSheet == null || queryRouterSheet.length() == 0) {
      if (queryParserSheet == null || queryParserSheet.length() == 0)
        requireOrElse(queryRouterSheet,
                      "Config file error: queryRouter path not specified");
    }
  }

  /**
   * Called by when a property is encountered in the configuration file.
   * If we recognize the property we process it here; otherwise, we pass
   * it on to the base class for recognition there.
   */
  public boolean handleProperty(String tagAttr, String strVal) 
  {
    if (tagAttr.equalsIgnoreCase("queryRouter.path")) {
      queryRouterSheet = servlet.getRealPath(strVal);
      return true;
    }
    else if (tagAttr.equalsIgnoreCase("queryParser.path")) {
      queryParserSheet = servlet.getRealPath(strVal);
      return true;
    }

    // Don't recognize it... see if the base class does.
    return super.handleProperty(tagAttr, strVal);
  } // handleProperty()
} // class CrossQueryConfig
