<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xtf="http://cdlib.org/xtf"
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:session="java:org.cdlib.xtf.xslt.Session"
   xmlns:editURL="http://cdlib.org/xtf/editURL"
   extension-element-prefixes="session"
   exclude-result-prefixes="#all">
   
   <!-- ====================================================================== -->
   <!-- Common DynaXML Stylesheet                                              -->
   <!-- ====================================================================== -->
   
   <!--
      Copyright (c) 2008, Regents of the University of California
      All rights reserved.
      
      Redistribution and use in source and binary forms, with or without 
      modification, are permitted provided that the following conditions are 
      met:
      
      - Redistributions of source code must retain the above copyright notice, 
      this list of conditions and the following disclaimer.
      - Redistributions in binary form must reproduce the above copyright 
      notice, this list of conditions and the following disclaimer in the 
      documentation and/or other materials provided with the distribution.
      - Neither the name of the University of California nor the names of its
      contributors may be used to endorse or promote products derived from 
      this software without specific prior written permission.
      
      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
      AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
      IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
      ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
      LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
      CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
      SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
      INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
      CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
      ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
      POSSIBILITY OF SUCH DAMAGE.
   -->
   
   <!-- ====================================================================== -->
   <!-- Import Stylesheets                                                     -->
   <!-- ====================================================================== -->
   
   <xsl:import href="../../../xtfCommon/xtfCommon.xsl"/>
   
   <!-- ====================================================================== -->
   <!-- Global Keys                                                            -->
   <!-- ====================================================================== -->
   
   <xsl:key name="hit-num-dynamic" match="xtf:hit" use="@hitNum"/>
   <xsl:key name="hit-rank-dynamic" match="xtf:hit" use="@rank"/>
   
   <!-- ====================================================================== -->
   <!-- Global Parameters                                                      -->
   <!-- ====================================================================== -->
   
   <!-- Path Parameters -->
   
   <xsl:param name="servlet.path"/>
   <xsl:param name="root.path"/>
   <xsl:param name="xtfURL" select="$root.path"/>
   <xsl:param name="dynaxmlPath" select="if (matches($servlet.path, 'org.cdlib.xtf.crossQuery.CrossQuery')) then 'org.cdlib.xtf.dynaXML.DynaXML' else 'view'"/>
   
   <xsl:param name="docId"/>
   <xsl:param name="docPath" select="replace($docId, '[^/]+\.xml$', '')"/>
   <xsl:param name="n2t" select="'http://n2t.net/'"/>
   <!-- If an external 'source' document was specified, include it in the
      query string of links we generate. -->
   <xsl:param name="source" select="''"/>
   
   <xsl:variable name="sourceStr">
      <xsl:if test="$source">;source=<xsl:value-of select="$source"/></xsl:if>
   </xsl:variable>
   
   <xsl:param name="query.string" select="concat('docId=', editURL:protectValue($docId), $sourceStr)"/>
   
   <xsl:param name="doc.path"><xsl:value-of select="$xtfURL"/><xsl:value-of select="$dynaxmlPath"/>?<xsl:value-of select="$query.string"/></xsl:param>
   
   <xsl:variable name="systemId" select="saxon:systemId()" xmlns:saxon="http://saxon.sf.net/"/>
   
   <xsl:param name="doc.dir">
      <xsl:choose>
         <xsl:when test="starts-with($systemId, 'http://')">
            <xsl:value-of select="replace($systemId, '/[^/]*$', '')"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:value-of select="concat($xtfURL, 'data/', $docPath)"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:param>
   
   <xsl:param name="figure.path" select="concat($doc.dir, '/figures/')"/>
   
   <xsl:param name="pdf.path" select="concat($doc.dir, '/pdfs/')"/>
   
   <!-- navigation parameters -->
   
   <xsl:param name="doc.view" select="'0'"/>
   
   <xsl:param name="toc.depth" select="1"/>
   
   <xsl:param name="anchor.id" select="'0'"/>
   
   <xsl:param name="set.anchor" select="'0'"/>
   
   <xsl:param name="chunk.id"/>
      
   <xsl:param name="toc.id"/>
   
   <!-- search parameters -->
   
   <xsl:param name="query"/>
   <xsl:param name="query-join"/>
   <xsl:param name="query-exclude"/>
   <xsl:param name="sectionType"/>
   
   <xsl:param name="search">
      <xsl:if test="$query">
         <xsl:value-of select="concat(';query=', replace($query, ';', '%26'))"/>
      </xsl:if>
      <xsl:if test="$query-join">
         <xsl:value-of select="concat(';query-join=', $query-join)"/>
      </xsl:if>
      <xsl:if test="$query-exclude">
         <xsl:value-of select="concat(';query-exclude=', $query-exclude)"/>
      </xsl:if>
      <xsl:if test="$sectionType">
         <xsl:value-of select="concat(';sectionType=', $sectionType)"/>
      </xsl:if>
   </xsl:param>  
   
   <xsl:param name="hit.rank" select="'0'"/>
   
   <!-- Branding Parameters -->
   
   <xsl:param name="brand" select="'default'"/>
   
   <xsl:variable name="brand.file">
      <xsl:choose>
         <xsl:when test="$brand != ''">
            <xsl:copy-of select="document(concat('../../../../brand/',$brand,'.xml'))"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:copy-of select="document('../../../../brand/default.xml')"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:variable>
   
   <xsl:param name="brand.links" select="$brand.file/brand/dynaxml.links/*" xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
   <xsl:param name="brand.header" select="$brand.file/brand/dynaxml.header/*" xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
   <xsl:param name="brand.footer" select="$brand.file/brand/footer/*" xpath-default-namespace="http://www.w3.org/1999/xhtml"/>
   
   <!-- Special Robot Parameters -->
   
   <xsl:param name="http.user-agent"/>
   <!-- WARNING: Inclusion of 'Wget' is for testing only, please remove before going into production -->
   <xsl:param name="robots" select="'Googlebot|Slurp|msnbot|Teoma|Wget'"/>
   
   <!-- ====================================================================== -->
   <!-- Button Bar Templates                                                   -->
   <!-- ====================================================================== -->
   
   <xsl:template name="bbar">
      <xsl:call-template name="translate">
         <xsl:with-param name="resultTree">
            <html xml:lang="en" lang="en">
               <head>
                  <title>
                     <xsl:value-of select="$doc.title"/>
                  </title>
                  <link rel="stylesheet" type="text/css" href="{$css.path}bbar.css"/>
                  <link rel="shortcut icon" href="icons/default/favicon.ico" />
               </head>
               <body>
                  <div class="bbar">
                     <table border="0" cellpadding="0" cellspacing="0">
                        <tr>
                           <td colspan="3" align="center">
                              <xsl:copy-of select="$brand.header"/>
                           </td>
                        </tr>
                        <tr>
							<td class="left">
                              <a href="{$xtfURL}search?browse-all=yes" target="_top">Home</a>
							</td>
							<td width="34%" class="center">
                              <form action="{$xtfURL}{$dynaxmlPath}" target="_top" method="get">
                                 <input name="query" type="text" size="15"/>
                                 <input type="hidden" name="docId" value="{$docId}"/>
                                 <input type="hidden" name="chunk.id" value="{$chunk.id}"/>
                                 <input type="submit" value="Search this Item"/>
                              </form>
							</td>
							<td class="right">
                              <a>
                                 <xsl:attribute name="href">javascript://</xsl:attribute>
                                 <xsl:attribute name="onclick">
                                    <xsl:text>javascript:window.open('</xsl:text><xsl:value-of select="$xtfURL"/><xsl:value-of select="$dynaxmlPath"/><xsl:text>?docId=</xsl:text><xsl:value-of
                                       select="editURL:protectValue($docId)"/><xsl:text>;doc.view=citation</xsl:text><xsl:text>','popup','width=800,height=400,resizable=yes,scrollbars=no')</xsl:text>
                                 </xsl:attribute>
                                 <xsl:text>Citation</xsl:text>
                              </a>
                              <xsl:text> | </xsl:text>
                              <a href="{$doc.path}&#038;doc.view=print;chunk.id={$chunk.id}" target="_top">Print View</a>
                              <xsl:text> | </xsl:text>
                              <a href="javascript://" onclick="javascript:window.open('/xtf/search?smode=getLang','popup','width=500,height=200,resizable=no,scrollbars=no')">Choose Language</a>
							</td>
                        </tr>
                     </table>
                  </div>
               </body>
            </html>
         </xsl:with-param>
      </xsl:call-template>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Keyword Links                                                          -->
   <!-- ====================================================================== -->
   <xsl:template match="*:subject">
      <a href="/xtf/search?keyword={editURL:protectValue(.)}">
         <xsl:choose>
         <xsl:when test="contains(string(.),'::')">
            <xsl:value-of select="tokenize(string(.),'::')[last()]"/>
         </xsl:when>
         <xsl:otherwise>
				<xsl:if test="position() = last()">
            		<xsl:apply-templates/> 
				</xsl:if>
				<xsl:if test="position() != last()">
            		<xsl:apply-templates/> |
				</xsl:if>
         </xsl:otherwise>
         </xsl:choose>
      </a>
   </xsl:template>

   <!-- ====================================================================== -->
   <!-- Citations                                                              -->
   <!-- ====================================================================== -->
   <xsl:template match="*:relation">
         <xsl:choose>
         <xsl:when test="contains(string(.),'::')">
            <xsl:value-of select="tokenize(string(.),'::')[last()]"/>
         </xsl:when>
         <xsl:otherwise>
            <xsl:apply-templates/> 
         </xsl:otherwise>
         </xsl:choose>
      	 <p/>
   </xsl:template>

   <!-- ====================================================================== -->
   <!-- Contributor                                                            -->
   <!-- ====================================================================== -->
   <xsl:template match="*:contributor">
	  <a href="/xtf/search?f1-contributor={normalize-space(editURL:protectValue(.))}">
         <xsl:choose>
         <xsl:when test="contains(string(.),'::')">
            <xsl:value-of select="replace(string(.),'::', '-')"/> |
         </xsl:when>
         <xsl:otherwise>
              <xsl:value-of select="normalize-space(string(.))"/>
         </xsl:otherwise>
         </xsl:choose>
		</a>
   </xsl:template>


   <!-- ====================================================================== -->
   <!-- author Links                                                          -->
   <!-- ====================================================================== -->
   <xsl:template match="*:creator">
      <a href="/xtf/search?f1-creator={normalize-space(editURL:protectValue(.))}">
         <xsl:choose>
         <xsl:when test="contains(string(.),'::')">
            <xsl:value-of select="tokenize(string(.),'::')[last()]"/>
         </xsl:when>
         <xsl:otherwise>
				<xsl:if test="position() = last()">
            		<xsl:apply-templates/> 
				</xsl:if>
				<xsl:if test="position() != last()">
            		<xsl:apply-templates/> |
				</xsl:if>
         </xsl:otherwise>
         </xsl:choose>
      </a>
   </xsl:template>

   <xsl:template match="*:date">
		 <xsl:choose>
        <xsl:when test="contains(string(.),'::')">
			<xsl:value-of select="tokenize(string(.),'::')[1]"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:apply-templates/> 
        </xsl:otherwise>
        </xsl:choose>   
	</xsl:template>
	
	<xsl:template match="*:added">
		 <xsl:choose>
        <xsl:when test="contains(string(.),'::')">
	       <xsl:value-of select="tokenize(string(.),'::')[2]"/>&#47;<xsl:value-of select="tokenize(string(.),'::')[3]"/>&#47;<xsl:value-of select="tokenize(string(.),'::')[1]"/>
        </xsl:when>
        <xsl:otherwise>
           <xsl:apply-templates/> 
        </xsl:otherwise>
        </xsl:choose>   
	</xsl:template>


   <!-- ====================================================================== -->
   <!-- Citation Template                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:template name="citation">
      
      <html xmlns="http://www.w3.org/1999/xhtml">
			<title>DataShare: <xsl:apply-templates select="//title"/></title>
			<xsl:call-template name="header_links"/>
	  <body>

			<div id="dataset-description-page"> 
			<!-- begin outer container -->  
			  <div id="outer-container"> 
			    <!-- begin inner container -->
			    <div id="inner-container"> 
			       <!-- begin header -->

			 <xsl:call-template name="ucsf_header"/>

		    <div class="content content-dataset" id="content">

				<div class="single-column">
               <h1>Citation</h1>

               <div class="citation">
                  <p>	
					<xsl:for-each select="/*/*:meta/*:creator">
                       <xsl:value-of select="normalize-space(.)"/>
                       <xsl:if test="not(position() = last())">
                          <xsl:text>; </xsl:text>
                       </xsl:if>
                    </xsl:for-each>

					<xsl:choose>
					  <xsl:when test="/*/*:meta/*:publicationYear">
						(<xsl:apply-templates select="/*/*:meta/*:publicationYear"/>):
					  </xsl:when>
					  <xsl:otherwise>. </xsl:otherwise>
					</xsl:choose>

 					<xsl:value-of select="normalize-space(/*/*:meta/*:title)"/>.
                    <xsl:value-of select="/*/*:meta/*:publisher"/>.
                    <xsl:value-of select="/*/*:meta/*:resourceType"/>.
 					http://dx.doi.org/<xsl:value-of select="/*/*:meta/*:doi"/>
                     </p>
               </div>
            </div>

	     	
			    </div>
			    <xsl:call-template name="footer"/>

			</div></div></div>
        </body>


      </html>
     
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Robot Template                                                         -->
   <!-- ====================================================================== -->
   
   <xsl:template name="robot">
      <html>
         <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title><xsl:value-of select="//xtf:meta/title[1]"/></title>
            <link rel="shortcut icon" href="icons/default/favicon.ico" />

         </head>
         <body>
            <div>
               <xsl:apply-templates select="//text()" mode="robot"/>
            </div>
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="text()" mode="robot">
      <xsl:value-of select="."/><xsl:text> </xsl:text>
   </xsl:template>

	<xsl:template name="header_links">
			<head>
				<title>Search: DataShare - Open data for the global research community</title>
			    <meta http-equiv="Content-Type" content="text/html; charset=utf-8; charset=UTF-8" />

				<link rel="stylesheet" href="assets/css/styles.css" type="text/css" />
				<link rel="icon" href="assets/img/favicon.ico" type="image/x-icon" />
				<link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon" />
				<meta name="description" content="" />
				<meta name="keywords" content="" />
				
				<script>var less = {env: "development"};</script>

			    <script src="assets/js/jquery-1.7.2.min.js" type="text/javascript"></script>
			    <script src="assets/js/datashare.js" type="text/javascript"></script>
				<script type="text/javascript">

				  var _gaq = _gaq || [];
				  _gaq.push(['_setAccount', 'UA-34221926-1']);
				  _gaq.push(['_trackPageview']);

				  (function() {
				    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
				    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
				  })();

				</script>
			  </head>
	</xsl:template>
	
	<!-- duplicate header and footer from searchforms, unfortunately hard avoid because of conflicting names -->
	<xsl:template name="ucsf_header">
	   	<div id="header">
			<div id="logo"> <a href="/"> <img src="assets/img/datashare-logo3.gif" width="320" height="63" alt="DataShare: Open data for the global research community" title="DataShare: Open data for the global research community" /> </a> </div>
			<!--<div id="login"> <a href="login.html"> <img src="assets/img/login2.gif" width="92" height="21" alt="Login"/></a> </div>-->
		</div> 
			  <!-- end header -->
				<!-- begin navigation-->
		<div id="nav-home-menu">
		  <div id="about-nav" class="menu"><a href="/xtf/search?smode=aboutPage">About</a></div>
		  <div id="search-nav" class="menu"><a href="/xtf/search">Search Data</a></div>
		  <div id="publish-nav" class="menu"><a href="/xtf/search?smode=stepsPage">Share Data (Beta)</a></div>
		  <div id="my-datasets-nav" class="menu"><a href="http://datashare-ingest.ucsf.edu">My Datasets</a></div>
		</div>
	</xsl:template>


	<xsl:template name="footer">
			<div id="footer">
				<div id="footer-container" class="shading">
					<div id="terms"><a href="/xtf/search?smode=termsPage">Terms of Use</a></div>
					<div id="faq-footer" ><a href="/xtf/search?smode=faqPage">FAQ</a></div>
					<div id="contact-us" ><a href="/xtf/search?smode=contactPage">Contact Us</a></div>
					<div id="copyrights">
						<p>DataShare was made possible through a partnership between the California Digital Library, </p>
						<p>UCSF Clinical &amp; Translational Science Institute, and UCSF Library.  &#169; 2013 The Regents of the University of California</p>
					</div>
				</div>
			</div>

			<!-- end footer -->
			<!-- begin footer logos -->    
			<div id="footer-logos">
				<div id="cdl-logo-sm"><a href="http://www.cdlib.org/"><img src="assets/img/cdl-logo.jpg" width="72" height="26" alt="California Digital Library" title="California Digital Library" /></a></div>
				<div id="ucsf-lib"><a href="http://www.library.ucsf.edu/"><img src="assets/img/ucsflib-logo.jpg" width="111" height="27" alt="UCSF library" title="UCSF library" /></a></div>
				<div id="ctsi"><a href="http://ctsi.ucsf.edu/"><img src="assets/img/CTSI_logo.png" width="143" height="27" alt="CTSI" title="CTSI" /></a></div>
			</div>
	</xsl:template>
   
</xsl:stylesheet>
