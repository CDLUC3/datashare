<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns:session="java:org.cdlib.xtf.xslt.Session"
   xmlns:editURL="http://cdlib.org/xtf/editURL"
   xmlns="http://www.w3.org/1999/xhtml"
   extension-element-prefixes="session"
   exclude-result-prefixes="#all"
   version="2.0">
   
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <!-- Query result formatter stylesheet                                      -->
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   
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
   
   <!-- this stylesheet implements very simple search forms and query results. 
      Alpha and facet browsing are also included. Formatting has been kept to a 
      minimum to make the stylesheets easily adaptable. -->
   
   <!-- ====================================================================== -->
   <!-- Import Common Templates                                                -->
   <!-- ====================================================================== -->
   
   <xsl:import href="../common/resultFormatterCommon.xsl"/>
   <xsl:import href="rss.xsl"/>
   <xsl:include href="searchForms.xsl"/>
   
   <!-- ====================================================================== -->
   <!-- Output                                                                 -->
   <!-- ====================================================================== -->
   
   <xsl:output method="xhtml" indent="no" 
      encoding="UTF-8" media-type="text/html; charset=UTF-8" 
      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
      omit-xml-declaration="yes"
      exclude-result-prefixes="#all"/>
   
   <!-- ====================================================================== -->
   <!-- Local Parameters                                                       -->
   <!-- ====================================================================== -->
   
   <xsl:param name="css.path" select="concat($xtfURL, 'css/default/')"/>
   <xsl:param name="icon.path" select="concat($xtfURL, 'icons/default/')"/>
   <xsl:param name="docHits" select="/crossQueryResult/docHit"/>
   <xsl:param name="email"/>

   <xsl:param name="affiliation" select="document('../../../textIndexer/mapping/affiliation.xml')"/> 
   <xsl:param name="researcher" select="document('../../../textIndexer/mapping/researcher.xml')"/>     
   <xsl:param name="ucsf-cind" select="document('../../../../static/brand/ucsf-cind/ucsf-cind.xml')"/> 
   <xsl:param name="labinfo" select="document('../../../../static/brand/labinfo.xml')"/>   
   <xsl:param name="researcherinfo" select="document('../../../../static/brand/researcherinfo.xml')"/>   
   <xsl:param name="name"/>

   <!-- ====================================================================== -->
   <!-- Root Template                                                          -->
   <!-- ====================================================================== -->
   
   <xsl:template match="/" exclude-result-prefixes="#all">
      <xsl:choose>
		 <xsl:when test="$smode = 'uploadPage'">   	 
		 	<xsl:call-template name="uploadPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'aboutPage'">   	 
		 	<xsl:call-template name="aboutPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'whyShareDataPage'">   	 
		 	<xsl:call-template name="whyShareDataPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'faqPage'">   	 
		 	<xsl:call-template name="faqPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'termsPage'">   	 
		 	<xsl:call-template name="termsPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'metadataBasicsPage'">   	 
		 	<xsl:call-template name="metadataBasicsPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'uploadFaqPage'">   	 
		 	<xsl:call-template name="uploadFaqPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'dataUseAgreement'">   	 
		 	<xsl:call-template name="dataUseAgreement"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'preparePage'">   	 
		 	<xsl:call-template name="preparePage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'stepsPage'">   	 
		 	<xsl:call-template name="stepsPage"/>
		 </xsl:when>
		 <xsl:when test="$smode = 'contactPage'">   	 
		 	<xsl:call-template name="contactPage"/>
		 </xsl:when>
         <!-- robot response -->
         <xsl:when test="matches($http.user-agent,$robots)">
            <xsl:apply-templates select="crossQueryResult" mode="robot"/>
         </xsl:when>
         <xsl:when test="$smode = 'showBag'">
            <xsl:apply-templates select="crossQueryResult" mode="results"/>
         </xsl:when>
         <!-- book bag -->
         <xsl:when test="$smode = 'addToBag'">
            <span>Added</span>
         </xsl:when>
         <xsl:when test="$smode = 'removeFromBag'">
            <!-- no output needed -->
         </xsl:when>
         <xsl:when test="$smode='getAddress'">
            <xsl:call-template name="getAddress"/>
         </xsl:when>
         <xsl:when test="$smode='getLang'">
            <xsl:call-template name="getLang"/>
         </xsl:when>
         <xsl:when test="$smode='setLang'">
            <xsl:call-template name="setLang"/>
         </xsl:when>
         <!-- rss feed -->
         <xsl:when test="$rmode='rss'">
            <xsl:apply-templates select="crossQueryResult" mode="rss"/>
         </xsl:when>
         <xsl:when test="$smode='emailFolder'">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="emailFolder"/>
               </xsl:with-param>
            </xsl:call-template>
		 </xsl:when>
         <!-- similar item -->
         <xsl:when test="$smode = 'moreLike'">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="moreLike"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>
         <!-- modify search -->
         <xsl:when test="contains($smode, '-modify')">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="form"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>
         <!-- browse pages -->
         <xsl:when test="$browse-title or $browse-creator or $browse-contributor or $browse-keyword">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="browse"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>

		<xsl:when test="$browse-lab">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="lab"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>

		<xsl:when test="$browse-labs">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="labs"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>

		<xsl:when test="$browse-researcher">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="researcher"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>

		<xsl:when test="$browse-researchers">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="researchers"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>

		<xsl:when test="$smode = 'affiliation'">        
			<xsl:call-template name="affiliation"/>
		</xsl:when>
		
		<xsl:when test="$smode = 'researcher'">        
			<xsl:call-template name="researcher"/>
		</xsl:when>
		
		<xsl:when test="$smode = 'oru'">
			<xsl:call-template name="oru"/>
		</xsl:when>
		<!-- show results -->
         <xsl:when test="crossQueryResult/query/*/*">
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="results"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:when>
         <!-- show form -->
         <xsl:otherwise>
            <xsl:call-template name="translate">
               <xsl:with-param name="resultTree">
                  <xsl:apply-templates select="crossQueryResult" mode="form"/>
               </xsl:with-param>
            </xsl:call-template>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>



   <xsl:template match="crossQueryResult" mode="results" exclude-result-prefixes="#all">
	<html xmlns="http://www.w3.org/1999/xhtml">
		<xsl:call-template name="header_links"/>
		<body>
			
			<!-- begin page id -->
			<div id="browse-all-page"> 
			<!-- begin outer container -->  
			  <div id="outer-container"> 
			    <!-- begin inner container -->
			    <div id="inner-container"> 
			       <!-- begin header -->
			
			<xsl:call-template name="ucsf_header"/>
		
			<!-- begin content -->
			<div id="content"> 	
				<div id="browse-all-container">
				<h1>Select a Dataset...</h1>
				<div class="search-refine">
					<div class="search-refine-controls">
						<table>
							<tr>
								<td>
									<div class="facet">
										<xsl:apply-templates select="facet[@field='facet-contributor']"/>
			     						<xsl:apply-templates select="facet[@field='facet-creator']"/>
			     						<xsl:apply-templates select="facet[@field='facet-keyword']"/>
										<!--
			     						<xsl:apply-templates select="facet[@field='facet-date']"/>
			     						<xsl:apply-templates select="facet[@field='facet-added']"/>
										-->
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="search-results">
					<xsl:call-template name="search_controls"/>
					<div class="search-result">
						<xsl:apply-templates select="docHit"/>
						<xsl:if test="@totalDocs > $docsPerPage">
			   				<xsl:call-template name="pages"/>
						</xsl:if>           
					</div>
				</div>
			</div>
			
		</div>
		
			<xsl:call-template name="footer"/>
		
		</div></div></div>
		
		</body>
	</html>
	
   </xsl:template>


   <!-- ====================================================================== -->
   <!-- Bookbag Templates                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:template name="getAddress" exclude-result-prefixes="#all">
      <html xml:lang="en" lang="en">
         <head>
            <title>E-mail My Bookbag: Get Address</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:copy-of select="$brand.links"/>
         </head>
         <body>
            <xsl:copy-of select="$brand.header"/>
            <div class="getAddress">
               <h2>E-mail My Bookbag</h2>
               <form action="{$xtfURL}{$crossqueryPath}" method="get">
                  <xsl:text>Address: </xsl:text>
                  <input type="text" name="email"/>
                  <xsl:text>&#160;</xsl:text>
                  <input type="reset" value="CLEAR"/>
                  <xsl:text>&#160;</xsl:text>
                  <input type="submit" value="SUBMIT"/>
                  <input type="hidden" name="smode" value="emailFolder"/>
               </form>
            </div>
         </body>
      </html>
   </xsl:template>
   
   <xsl:template match="crossQueryResult" mode="emailFolder" exclude-result-prefixes="#all">
      
      <xsl:variable name="bookbagContents" select="session:getData('bag')/bag"/>
      
      <!-- Change the values for @smtpHost and @from to those valid for your domain -->
      <mail:send xmlns:mail="java:/org.cdlib.xtf.saxonExt.Mail" 
         xsl:extension-element-prefixes="mail" 
         smtpHost="smtp.yourserver.org" 
         useSSL="no" 
         from="admin@yourserver.org"
         to="{$email}" 
         subject="XTF: My Bookbag">
Your XTF Bookbag:
<xsl:apply-templates select="$bookbagContents/savedDoc" mode="emailFolder"/>
      </mail:send>
      
      <html xml:lang="en" lang="en">
         <head>
            <title>E-mail My Citations: Success</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:copy-of select="$brand.links"/>
         </head>
         <body onload="autoCloseTimer = setTimeout('window.close()', 1000)">
            <xsl:copy-of select="$brand.header"/>
            <h1>E-mail My Citations</h1>
            <b>Your citations have been sent.</b>
         </body>
      </html>
      
   </xsl:template>
   
   <xsl:template match="savedDoc" mode="emailFolder" exclude-result-prefixes="#all">
      <xsl:variable name="num" select="position()"/>
      <xsl:variable name="id" select="@id"/>
	  
   <xsl:for-each select="$docHits[string(meta/identifier[1]) = $id][1]">
         <xsl:variable name="path" select="@path"/>
         <xsl:variable name="url">
            <xsl:value-of select="$xtfURL"/>
            <xsl:choose>
			<xsl:when test="matches(meta/display, 'dynaxml')">
                  <xsl:call-template name="dynaxml.url">
                     <xsl:with-param name="path" select="$path"/>
                  </xsl:call-template>
               </xsl:when>
               <xsl:otherwise>
                  <xsl:call-template name="rawDisplay.url">
                     <xsl:with-param name="path" select="$path"/>
                  </xsl:call-template>
               </xsl:otherwise>
            </xsl:choose>
         </xsl:variable>
Item number <xsl:value-of select="$num"/>: 
<xsl:value-of select="meta/creator"/>. <xsl:value-of select="meta/title"/>. <xsl:value-of select="meta/year"/>. 
[<xsl:value-of select="$url"/>]
         
      </xsl:for-each>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Browse Template                                                        -->
   <!-- ====================================================================== -->
   
   <xsl:template match="crossQueryResult" mode="browse" exclude-result-prefixes="#all">
      
      <xsl:variable name="alphaList" select="'A B C D E F G H I J K L M N O P Q R S T U V W Y Z OTHER'"/>
      
      <html xml:lang="en" lang="en">
         <head>
            <title>XTF: Search Results</title>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:copy-of select="$brand.links"/>
            <!-- AJAX support -->
            <script src="script/yui/yahoo-dom-event.js" type="text/javascript"/> 
            <script src="script/yui/connection-min.js" type="text/javascript"/> 
         </head>
         <body>
            
            <!-- header -->
            <xsl:copy-of select="$brand.header"/>
            
            <!-- result header -->
            <div class="resultsHeader">
               <table>
 <!--                 <tr>
                     <td colspan="2" class="right">
                        <xsl:variable name="bag" select="session:getData('bag')"/>
                        <a href="{$xtfURL}{$crossqueryPath}?smode=showBag">Bookbag</a>
                        (<span id="bagCount"><xsl:value-of select="count($bag/bag/savedDoc)"/></span>)
                     </td>
                  </tr>
-->
                  <tr>
                     <td>
                        <b>Browse by:&#160;</b>
                        <xsl:choose>
                           <xsl:when test="$browse-title">Title</xsl:when>
                           <xsl:when test="$browse-creator">Author</xsl:when>
						   <xsl:when test="$browse-contributor">Contributor</xsl:when>
                           <xsl:otherwise>All Items</xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td class="right">
                        <a href="{$xtfURL}{$crossqueryPath}">
                           <xsl:text>New Search</xsl:text>
                        </a>
                        <xsl:if test="$smode = 'showBag'">
                           <xsl:text>&#160;|&#160;</xsl:text>
                           <a href="{session:getData('queryURL')}">
                              <xsl:text>Return to Search Results</xsl:text>
                           </a>
                        </xsl:if>
                     </td>
                  </tr>
                  <tr>
                     <td>
                        <b>Results:&#160;</b>
                        <xsl:variable name="items" select="facet/group[docHit]/@totalDocs"/>
                        <xsl:choose>
                           <xsl:when test="$items &gt; 1">
                              <xsl:value-of select="$items"/>
                              <xsl:text> Items</xsl:text>
                           </xsl:when>
                           <xsl:otherwise>
                              <xsl:value-of select="$items"/>
                              <xsl:text> Item</xsl:text>
                           </xsl:otherwise>
                        </xsl:choose>
                     </td>
                     <td class="right">
                        <xsl:text>Browse by </xsl:text>
                        <xsl:call-template name="browseLinks"/>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2" class="center">
                        <xsl:call-template name="alphaList">
                           <xsl:with-param name="alphaList" select="$alphaList"/>
                        </xsl:call-template>
                     </td>
                  </tr>
                  
               </table>
            </div>
            
            <!-- results -->
            <div class="results">
               <table>
                  <tr>
                     <td>
                        <xsl:choose>
                           <xsl:when test="$browse-title">
                              <xsl:apply-templates select="facet[@field='browse-title']/group/docHit"/>
                           </xsl:when>
                           <xsl:when test="$browse-creator">
                              <xsl:apply-templates select="facet[@field='browse-creator']/group/docHit"/>
                           </xsl:when>
                           <xsl:when test="$browse-contributor">
                              <xsl:apply-templates select="facet[@field='browse-contributor']/group/docHit"/>
                           </xsl:when>
						   </xsl:choose>
                     </td>
                  </tr>
               </table>
            </div>
            
            <!-- footer -->
            <xsl:copy-of select="$brand.footer"/>
            
         </body>
      </html>
   </xsl:template>


   <!-- ====================================================================== -->
   <!-- Lab Template		                                                   -->
   <!-- ====================================================================== -->

   <xsl:template match="crossQueryResult" mode="lab" exclude-result-prefixes="#all">
     
	<html xmlns="http://www.w3.org/1999/xhtml">
	  		<head>
				<title>Datasets from 		<xsl:value-of select="replace($f1-contributor, '::', '-')"/> (DataShare)</title>
				<xsl:call-template name="header_links"/>

			</head>

	  <body>

	    <div class="header">
	     	<xsl:call-template name="ucsf_header"/>
	    </div>
	    <div class="content content-researchgroup">
	
	      <h2>Datasets from 
		
		<xsl:value-of select="replace($f1-contributor, '::', '-')"/>
				
		</h2>

	      <div class="researchgroup-datasets">

		<div class="search-result">


			<xsl:apply-templates select="docHit"/>
			<xsl:if test="@totalDocs > $docsPerPage">

	                 <xsl:call-template name="pages"/>

	        </xsl:if>

		</div>

	      </div>

		
	     <xsl:if test="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$f1-contributor]/contributor"> 
	    <div class="researchgroup-about">
		<div class="promo-box">
		  <h3>About <xsl:value-of select="replace(document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$f1-contributor]/contributor, '::', '-')"/></h3>
		  <xsl:value-of select="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$f1-contributor]/description"/>
		</div>
	      </div>
		</xsl:if>

	    </div>

	  
	     <xsl:call-template name="footer"/>

	  </body>
	</html>
   </xsl:template>


   <!-- ====================================================================== -->
   <!-- List Lab Template		                                                   -->
   <!-- ====================================================================== -->

   <xsl:template match="crossQueryResult" mode="labs" exclude-result-prefixes="#all">
     
	<html xmlns="http://www.w3.org/1999/xhtml">
	  		<head>
				<title>DataShare: Browse by Lab</title>
				<xsl:call-template name="header_links"/>

			</head>

	  <body>

	    <div class="header">
	     	<xsl:call-template name="ucsf_header"/>
	    </div>
	    <div class="content content-researchgroup">
	
	<h2>Labs on DataShare:</h2>		
	
	     <div class="researchgroup-datasets">

		<div class="search-result">
			
			
			  <xsl:for-each select="distinct-values(docHit/meta/*:contributor)">
					<xsl:sort order="ascending"/>
				
				     <xsl:variable name="temp" select="."/>
				
				
				<li>
				<a href="/xtf/search?browse-lab=all;f1-contributor={.}">
					<xsl:choose>		
						<xsl:when test="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$temp]/contributor"> 
				     		<xsl:value-of select="replace(., '::', '-')"/>,		
							 <xsl:value-of select="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$temp]/name"/>
						</xsl:when>
						<xsl:otherwise>
					      <xsl:value-of select="replace(., '::', '-')"/>
						</xsl:otherwise>
					</xsl:choose>
					</a>			
			    </li>
			  </xsl:for-each>
			
			<xsl:if test="@totalDocs > $docsPerPage">
	                 <xsl:call-template name="pages"/>
	        </xsl:if>

		</div>
	      </div>

	    

	    </div>

	  
	     <xsl:call-template name="footer"/>

	  </body>
	</html>
   </xsl:template>


   <!-- ====================================================================== -->
   <!-- Researcher Template		                                               -->
   <!-- ====================================================================== -->

   <xsl:template match="crossQueryResult" mode="researcher" exclude-result-prefixes="#all">
     
	<html xmlns="http://www.w3.org/1999/xhtml">
	  	<head>
			<title>Datasets from 	<xsl:value-of select="$f1-creator"/> (DataShare)</title>
			
			<xsl:call-template name="header_links"/>
		 
		</head>
	  <body>

	    <div class="header">
	     	<xsl:call-template name="ucsf_header"/>
	    </div>
	    <div class="content content-researchgroup">
	
	      <h2>Datasets from 
		
		<xsl:value-of select="$f1-creator"/>
				
		</h2>

	      <div class="researchgroup-datasets">

		<div class="search-result">
			<xsl:apply-templates select="docHit"/>
			<xsl:if test="@totalDocs > $docsPerPage">

	                 <xsl:call-template name="pages"/>

	        </xsl:if>
		</div>

	      </div>


		<xsl:if test="document('../../../../static/brand/researcherinfo.xml')//researchers/researcher[@id=$f1-creator]/creator"> 
	    <div class="researchgroup-about">
		<div class="promo-box">
		  <h3>About <xsl:value-of select="document('../../../../static/brand/researcherinfo.xml')//researchers/researcher[@id=$f1-creator]/creator"/></h3>
		  <xsl:value-of select="document('../../../../static/brand/researcherinfo.xml')//researchers/researcher[@id=$f1-creator]/description"/>
		</div>
	      </div>
		</xsl:if>
		
		
	    </div>

	  
	     <xsl:call-template name="footer"/>

	  </body>
	</html>
   </xsl:template>

   <!-- ====================================================================== -->
   <!-- Researchers Template (list all researchers)                            -->
   <!-- ====================================================================== -->

   <xsl:template match="crossQueryResult" mode="researchers" exclude-result-prefixes="#all">
	<html xmlns="http://www.w3.org/1999/xhtml">
	  		<head>
				<title>DataShare: Browse by Researcher</title>
				<xsl:call-template name="header_links"/>

			</head>

	  <body>

	    <div class="header">
	     	<xsl:call-template name="ucsf_header"/>
	    </div>
	    <div class="content content-researchgroup">

	<h2>Researchers on DataShare:</h2>		

	    <div class="researchgroup-datasets">

		<div class="search-result">

			  <xsl:for-each select="distinct-values(docHit/meta/*:creator)">
				<xsl:sort  order="ascending" data-type="text" />
			    <li>
				<a href="/xtf/search?browse-researcher=all;f1-creator={.}">
			      <xsl:value-of select="."/></a>			
			    </li>
			  </xsl:for-each>

			<xsl:if test="@totalDocs > $docsPerPage">
	                 <xsl:call-template name="pages"/>
	        </xsl:if>

		</div>
	      </div>



	    </div>


	     <xsl:call-template name="footer"/>

	  </body>
	</html>
	  
   </xsl:template>


   <xsl:template name="browseLinks">
      <xsl:choose>
         <xsl:when test="$browse-all">
            <xsl:text>Facet | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-title=first;sort=title">Title</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-creator=first;sort=creator">Author</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-contributor=first;sort=contributor">Contributor</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?smode=affiliation">Affiliation</a>
			</xsl:when>
         <xsl:when test="$browse-title">
            <a href="{$xtfURL}{$crossqueryPath}?browse-all=yes">Facet</a>
            <xsl:text> | </xsl:text>
            <xsl:text>Title | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-creator=first;sort=creator">Author</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-contributor=first;sort=contributor">Contributor</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?smode=affiliation">Affiliation</a>
			</xsl:when>
         <xsl:when test="$browse-creator">
            <a href="{$xtfURL}{$crossqueryPath}?browse-all=yes">Facet</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-title=first;sort=title">Title</a>
            <xsl:text> | </xsl:text>
            <xsl:text>Author | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-contributor=first;sort=contributor">Contributor</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?smode=affiliation">Affiliation</a>
			</xsl:when>
		<xsl:when test="$browse-contributor">
            <a href="{$xtfURL}{$crossqueryPath}?browse-all=yes">Facet</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-title=first;sort=title">Title</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-creator=first;sort=creator">Author</a>
            <xsl:text> | </xsl:text>
            <xsl:text>Contributor | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?smode=affiliation">Affiliation</a>
			</xsl:when>
         <xsl:when test="$browse-contributor">
            <a href="{$xtfURL}{$crossqueryPath}?browse-all=yes">Facet</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-title=first;sort=title">Title</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-creator=first;sort=creator">Author</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-contributor=first;sort=contributor">Contributor</a>
            <xsl:text> | </xsl:text>
            <xsl:text>Affiliation</xsl:text>
			</xsl:when>

			<xsl:otherwise>
            <a href="{$xtfURL}{$crossqueryPath}?browse-all=yes">Facet</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-title=first;sort=title">Title</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-creator=first;sort=creator">Author</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?browse-contributor=first;sort=contributor">Contributor</a>
            <xsl:text> | </xsl:text>
            <a href="{$xtfURL}{$crossqueryPath}?smode=affiliation">Affiliation</a>
			</xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Document Hit Template                                                  -->
   <!-- ====================================================================== -->
   
   <xsl:template match="docHit" exclude-result-prefixes="#all">
      
      <xsl:variable name="path" select="@path"/>
      <xsl:variable name="identifier" select="meta/identifier[1]"/>
      <xsl:variable name="quotedID" select="concat('&quot;', $identifier, '&quot;')"/>
      <xsl:variable name="indexId" select="replace($identifier, '.*/', '')"/>
      <!-- scrolling anchor -->
      <xsl:variable name="anchor">
         <xsl:choose>
	        <xsl:when test="$sort = 'contributor'">
               <xsl:value-of select="substring(string(meta/contributor[1]), 1, 1)"/>
            </xsl:when>
            <xsl:when test="$sort = 'creator'">
               <xsl:value-of select="substring(string(meta/creator[1]), 1, 1)"/>
            </xsl:when>
            <xsl:when test="$sort = 'title'">
               <xsl:value-of select="substring(string(meta/title[1]), 1, 1)"/> 
		   </xsl:when>
         </xsl:choose>
      </xsl:variable>
      
      <div id="main_{@rank}" class="docHit">     
	
		<h3><span class="DC-Title">
			 <a>
                  <xsl:attribute name="href">
					<xsl:call-template name="dynaxml.url">
                        <xsl:with-param name="path" select="$path"/>
					</xsl:call-template>
                  </xsl:attribute>
                <b>
                  <xsl:apply-templates select="meta/title"/>
                </b></a>
		</span></h3>
			  <ul>
			    <li>
			      by <span class="DC-Creator">
			      <xsl:choose>
            
			      	<xsl:when test="meta/creator">
                    
						<xsl:apply-templates select="meta/creator"/>
					</xsl:when>
				  </xsl:choose>
                  
			
			      </span>
			    </li>
			    <li>
			      at <span class="DC-Contributor">
			      	
			      <xsl:choose>
            
			      	<xsl:when test="meta/contributor">
                    
						<xsl:apply-templates select="meta/contributor"/>
					</xsl:when>
				  </xsl:choose>
			
			      </span>, <span class="DC-Publisher">
			      	
					<xsl:apply-templates select="meta/publisher"/>
		
			      </span>
			    </li>
			    <li>
				
					 <xsl:choose>

				      	<xsl:when test="meta/date">

							uploaded <span class="DC-Date">	
								<xsl:apply-templates select="meta/date"/>
							</span>,						
						</xsl:when>
					  </xsl:choose>
					
					 <xsl:choose>
				      	<xsl:when test="meta/collected">

							collected <span class="DC-Date">	
								<xsl:apply-templates select="meta/collected"/>
							</span>						
						</xsl:when>
					  </xsl:choose>

			    </li>

			    <li class="collapsible">
			      <div class="collapse-control"><span class="indicator"></span> abstract</div>
			      <div class="collapse-content"><span class="DC-Description">
				
				<xsl:apply-templates select="meta/description[@descriptionType='Abstract']"/>
				
				</span></div>
			    </li>

			  </ul>

			</div>
			<p/>      
   </xsl:template>
 




   <!-- ====================================================================== -->
   <!-- Snippet Template (for snippets in the full text)                       -->
   <!-- ====================================================================== -->
   
   <xsl:template match="snippet" mode="text" exclude-result-prefixes="#all">
      <xsl:text>...</xsl:text>
      <xsl:apply-templates mode="text"/>
      <xsl:text>...</xsl:text>
      <br/>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Term Template (for snippets in the full text)                          -->
   <!-- ====================================================================== -->
   
   <xsl:template match="term" mode="text" exclude-result-prefixes="#all">
      <xsl:variable name="path" select="ancestor::docHit/@path"/>
      <xsl:variable name="display" select="ancestor::docHit/meta/display"/>
      <xsl:variable name="hit.rank"><xsl:value-of select="ancestor::snippet/@rank"/></xsl:variable>
      <xsl:variable name="snippet.link">    
         <xsl:call-template name="dynaxml.url">
            <xsl:with-param name="path" select="$path"/>
         </xsl:call-template>
         <xsl:value-of select="concat(';hit.rank=', $hit.rank)"/>
      </xsl:variable>
      
      <xsl:choose>
         <xsl:when test="ancestor::query"/>
         <xsl:when test="not(ancestor::snippet) or not(matches($display, 'dynaxml'))">
            <span class="hit"><xsl:apply-templates/></span>
         </xsl:when>
         <xsl:otherwise>
            <a href="{$snippet.link}" class="hit"><xsl:apply-templates/></a>
         </xsl:otherwise>
      </xsl:choose> 
      
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Term Template (for snippets in meta-data fields)                       -->
   <!-- ====================================================================== -->
   
   <xsl:template match="term" exclude-result-prefixes="#all">
      <xsl:choose>
         <xsl:when test="ancestor::query"/>
         <xsl:otherwise>
            <span class="hit"><xsl:apply-templates/></span>
         </xsl:otherwise>
      </xsl:choose> 
      
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- More Like This Template                                                -->
   <!-- ====================================================================== -->
   
   <!-- results -->
   <xsl:template match="crossQueryResult" mode="moreLike" exclude-result-prefixes="#all">
      <xsl:choose>
         <xsl:when test="docHit">
            <div class="moreLike">
               <ol>
                  <xsl:apply-templates select="docHit" mode="moreLike"/>
               </ol>
            </div>
         </xsl:when>
         <xsl:otherwise>
            <div class="moreLike">
               <b>No similar documents found.</b>
            </div>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <!-- docHit -->
   <xsl:template match="docHit" mode="moreLike" exclude-result-prefixes="#all">
      
      <xsl:variable name="path" select="@path"/>
      
      <li>
         <xsl:apply-templates select="meta/creator[1]"/>
         <xsl:text>. </xsl:text>
         <a>
            <xsl:attribute name="href">
               <xsl:choose>
                  <xsl:when test="matches(meta/display, 'dynaxml')">
                     <xsl:call-template name="dynaxml.url">
                        <xsl:with-param name="path" select="$path"/>
                     </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                     <xsl:call-template name="rawDisplay.url">
                        <xsl:with-param name="path" select="$path"/>
                     </xsl:call-template>
                  </xsl:otherwise>
               </xsl:choose>
            </xsl:attribute>
            <xsl:apply-templates select="meta/title[1]"/>
         </a>
         <xsl:text>. </xsl:text>
         <xsl:apply-templates select="meta/year[1]"/>
         <xsl:text>. </xsl:text>
      </li>
      
   </xsl:template>
	
   <!-- docHit -->
   <xsl:template match="docHit" mode="labForm" exclude-result-prefixes="#all">
      <xsl:variable name="path" select="@path"/>
			<li>
			    <xsl:apply-templates select="meta/contributor"/>
			</li>
   </xsl:template>


	<xsl:template name="search_controls">

	<div class="search-controls">
		<div class="search-control-sort">
		  <form method="get" action="{$xtfURL}{$crossqueryPath}">
              <b>Sorted by:&#160;</b>
              <xsl:call-template name="sort.options"/>
              <xsl:call-template name="hidden.query">
                 <xsl:with-param name="queryString" select="editURL:remove($queryString, 'sort')"/>
              </xsl:call-template>
              <xsl:text>&#160;</xsl:text>
              <input type="submit" value="Go!"/>
           </form>
</div>
</div>
	<!--	
	  <div class="search-control-sort">Sort by: <a href="./sort=title">Title</a> <a href="#">Researcher</a> <a href="#">Lab/Department</a> <a href="#">Date</a></div>
	</div>
	-->
</xsl:template>



	<xsl:template name="oru">
		<xsl:param name="orgName"/>
		<html>
		<head><title>Datashare Organizations</title>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <xsl:copy-of select="$brand.header"/>
            <!-- AJAX support -->
            <script src="script/yui/yahoo-dom-event.js" type="text/javascript"/> 
            <script src="script/yui/connection-min.js" type="text/javascript"/> 
		</head>
		<body>
			<p>	
	         <img src="static/brand/{$name}/{$name}.png" alt="Datashare logo" class="xtf-logo"/>
			</p>
			<p>	
			<xsl:value-of select="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$name]/campus"/>
			</p>
			<p>
			<xsl:value-of select="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$name]/name"/>
			</p>
			<p>
			<xsl:value-of select="document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$name]/description"/>
			</p>
			<a href="search?contributor={document('../../../../static/brand/labinfo.xml')//labs/lab[@id=$name]/contributor}">
			<xsl:value-of select="string(./name)" />Publications</a>
		</body>
		</html>
	</xsl:template>
	
	<xsl:template name="contactPage">
		
		<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
				<head>
					<title>Contact Us: DataShare - Open data for the global research community</title>
					<script type='text/javascript'>
						function resetMe(){
							document.getElementByName("afm_form_e71bf67c").reset();
						};
					</script>
					<xsl:call-template name="header_links"/>
				</head>

				<body>
				<!-- begin page id -->
				<div id="contact-us-page"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
      					<div class="header">
				     		<xsl:call-template name="ucsf_header"/>
				    	</div>
						<!-- begin content -->
						<div id="content"> 	
							<div class="single-column">

						
					<xsl:choose>
					<xsl:when test="$type='confirmation'">
						  <h1>Confirmation</h1>
						<p>
							Thanks for contacting the DataShare team. We'll get back to you shortly. 
						</p>
					</xsl:when>
					<xsl:otherwise>

	
						  <h1>Contact us</h1>
					    
						<div class="contact-us-form">

							<form name="afm_form_e71bf67c" id="afm_form_e71bf67c" action="http://free.allforms.mailjol.net/u/e71bf67c.php" method="post" >
								<label for="name">Name:</label>
								 <input class="input-text" type="text" name="Name:" id="name" /> 
								<label for="affiliation">Affiliation:</label>
								 <input class="input-text" type="text" name="Lab/Department" id="affiliation" /> 
								<label for="email">Email:</label>
								 <input class="input-text" type="text" name="Email:" id="email" /> 
								<label for="message">Message:</label>
								 <textarea rows="10" cols="50" name="Message:" id="message"></textarea> 
								<input type="hidden" name="feedback-type" value="contact" />
								<div class="button-container">
								<input class="input-button" type="image" src="assets/img/submit-button.png" name="submit" value="Submit" alt="Submit"/>  
								<input class="input-button" type="image" src="assets/img/reset-button.png" name="reset" value="Reset" onclick='document.afm_form_e71bf67c.reset();return false;' alt="Reset"/>
								</div>
							</form>
					</div>

					</xsl:otherwise>
				</xsl:choose>

						</div>
					</div> <!-- end content-->
					<div id="triangle-container">
						<div id="triangle"></div>
					</div>
				<!-- begin footer-->
				<xsl:call-template name="footer"/>
			    
				<!-- end footer-->
				</div> <!-- end inner container -->
			  </div> <!-- end outer container -->
			</div>
				</body>
			</html>
		
	</xsl:template>
	
	
	<xsl:template name="faqPage">
		<html>
		
			<head>
				<title>FAQ: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="faq"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content">
						<div class="single-column">
						<h1>Frequently Asked Questions</h1>
						<div class="text-container">
						<p class="title">Who can deposit data here?</p>
						<p class="para">Any UCSF-affiliated researcher (faculty, postdoc, student, or staff) can use this resource to archive and share research data sets, provided they have appropriate permission. Data that is collected at research sites is under the stewardship of the Principal Investigator (PI) named on the resource provided to collect the data, and this PI may grant permission to deposit data. 
						</p>
						<p class="title">Why only UCSF?</p>
						<p class="para">The DataShare system is being piloted at UCSF and therefore currently it is only configured to accept data submissions authenticated through UCSF's secure sign-on, MyAccess. We hope this system will be used by other institutions in future phases of the project.
						</p>
						<p class="title">Who can access these data?</p>
						<p class="para">The descriptive metadata associated with each data set is publicly available. Any member of the public may discover these data and request access to them. Access to the data will be granted in accordance with the terms specified by the data depositor.
						</p>
						<p class="title">Will I have control of the data?</p>
						<p class="para">You will have the ability to control access to your data (see below). Once data is deposited, you will have control over the versioning of the data set as well as the metadata indexing fields.
						</p>
						<p class="title">How can I control who sees/accesses the data?</p>
						<p class="para">Anyone will be able to view the descriptive metadata used to index your data set, this information is publicly available to allow for maximum discoverability. You will have the ability to specify terms of use for your data set via a 'Data Use Agreement' (DUA) prior to allowing access. Default DUAs are set at the collection level (e.g. all of the data sets entered under the Lab X collection will be assigned the default DUA specified by Lab X), however this DUA may be over-written if a different set of terms is required for a specific data set.
						</p>
						<p class="title">What do I need to submit the data?</p>
						<ul>
							<li>Permission from the appropriate PI(s)</li>
							<li>Information about the data set (this descriptive metadata will be used to index your data set, so the more information you can provide - the better)</li>
							<li>Access to files comprising the data set</li>
						</ul>
						<!--</p>-->
						<p class="title">Are there any file format requirements?</p>
						<p class="para">No. Files of any type are acceptable for deposit. However, please ensure that any files of a specialized or proprietary nature are accompanied by any pertinent information that would allow the proper viewing and/or usage of the file. This information could be stored in a separate 'Readme' document within the data set files, or could be entered in the 'Technical Description' section of the metadata.
						</p>
						<p class="title">What best practices can I follow for data preparation?</p>
						<p class="para">There are a variety of best practices depending on your field of research, but generally:</p>
						<ul>
							<li>Ensure data files are the most up-to-date and complete versions</li>
							<li>Ensure the integrity of data files (check if corrupted)</li>
							<li>Ensure that all data relating to human subjects has been properly <a href="http://www.hhs.gov/ocr/privacy/hipaa/understanding/coveredentities/De-identification/guidance.html">de-identified</a></li>
							<li>Double-check the accuracy of the descriptive metadata</li>
							<li>Enter as much descriptive metadata as possible in the indexing fields</li>
							<li>Ensure that any information critical to the proper viewing and/or usage of the data is included in the submission (either as a separate 'Readme' file or within the 'Technical Description' metadata field)</li>
						</ul>

						<p class="title">For how long will the data be available?</p>
						<p class="para">Once you have deposited data, it is permanently archived and available through the California Digital Library; however the DataShare website is currently supported as a pilot project and therefore we cannot guarantee availability through DataShare for any length of time.
						</p>
						<p class="title">Will I know if someone uses/views the data?</p>
						<p class="para">Yes, DataShare provides tools to access the metrics associated with each data set. This includes number of page views and data set downloads. We request notification from data re-users when analysis of data made available through DataShare leads to publications or conference presentations, however we cannot guarantee this.
						</p>
						<p class="title">How do I get credit for the data if someone uses it?</p>
						<p class="para">Data re-users are provided with a simple 'Cite this data set' button which provides the proper data citation (including persistent identifier) and can be exported to a reference manager. Your data use agreement contains a term requiring data re-users to provide proper attribution, thus, they must cite your data when and where it is appropriate.
						</p>
						<p class="title">What if I never published anything using these data?</p>
						<p class="para">It is not required that the data deposited in DataShare be associated with a publication. It is only required that these data are collected in a manner that adheres to the standards set forth by the affiliated institution and institutional review board.
						</p>
						<p class="title">Who created these data?</p>
						<p class="para">The data are collected and/or processed by the individuals specified as 'Data creators' in association with the individual(s) designated as 'Principal Investigator'.
						</p>
						<p class="title">How can the data on this site be used?</p>
						<p class="para">The data made available through DataShare can be used in any manner consistent with the general goal of advancing scientific knowledge; either by serving as training materials or testing materials.
						</p>
						<p class="title">Is there anything I can't use the data for?</p>
						<p class="para">The data cannot be used for disreputable purposes, and no attempts must ever be made to re-identify human subjects based on their data. Any additional constraints on data use will be outlined in a 'Data Use Agreement' (DUA) specified by the data provider. You will need to view and agree to the DUA terms prior to being granted access to the data.
						</p>
						<p class="title">Are there requirements if I use data?</p>
						<p class="para">We require only that the data set be cited appropriately when used, this ensures that data providers receive proper credit for their contribution to any works derived from the data. Any additional requirements for data use will be outlined in a 'Data Use Agreement' (DUA) specified by the data provider. You will need to view and agree to the DUA terms prior to being granted access to the data.
						</p>
						<p class="title">Do I need to sign-in to get data?</p>
						<p class="para">Persons requesting data are not required to sign-in in order to do so. Most data sets will be made available immediately following acceptance of the Data Use Agreement terms (requiring entry of name and a valid email address). However, data providers reserve the right to enforce additional controls on access to the data.
						</p>
						<p class="title">Do I have to pay for data?</p>
						<p class="para">No, these data are made publicly available free of charge.
						</p>
						<p class="title">What if I have questions about the data?</p>
						<p class="para">Please contact us with any questions about the data. Your message will be directed to an appropriate source to answer any questions about the data. We cannot guarantee that the source will be able to obtain an answer to your specific question.</p>
						</div>
						</div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	<xsl:template name="termsPage">
		<html>
		
			<head>
				<title>FAQ: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="terms-of-use"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content"> 	
							<div id="terms-content">
								<h1>Terms of Use</h1>
								<div class="text-container">
								<p>
									DataShare encourages the use of this site, regardless of domain address, as a way to share information and knowledge in support of the University's three-part mission of education, research and public service. This site is owned by The Regents of the University of California and operated by the DataShare project group. Site content is subject to change without notice. While most parts of this site are publicly accessible, certain services and information offered online may be restricted to specific users or segments of the University of California population.
								</p>
								<p class="secondary-para">
									DataShare collects information to improve functionality and content and to monitor performance. Data is used to help answer specific questions about the usage and performance of the web site or individual web pages. At no time is site usage associated with individual IP addresses.
								</p>
								</div>
							</div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	<xsl:template name="preparePage">
		<html>
		
			<head>
				<title>Preparing to submit: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="prepare-to-submit-page"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content"> 	
							<div class="single-column">
								<h1>Preparing to submit</h1>
								<div class="text-container">
									<ul>
										<li>Ensure permission is granted from the appropriate PI(s)</li>
										<li>Ensure data files are the most up-to-date and complete versions</li>
										<li>Ensure that all data relating to human subjects has been properly de-identified</li>
										<li>Collect as much descriptive metadata as possible (more info here)</li>
										<li>Ensure that any information critical to the proper viewing and/or usage of the data is included in the submission (either as a separate 'Readme' file or within the 'Technical Description' metadata field)</li>
									</ul>
								</div>
							</div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	<xsl:template name="uploadFaqPage">
		<html>
		
			<head>
				<title>Upload FAQ: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="prepare-to-submit-page"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content"> 	
							<div class="single-column">
								<h1>Upload FAQ</h1>
								<div class="text-container">
										<ul>
											<li>Be sure you have read through and are comfortable with the terms of the <a href="/xtf/search?smode=dataUseAgreement">DataShare Data Use Agreement</a></li>
											<li>Ensure that all data relating to human subjects has been properly de-identified</li>
											<li>Ensure data files are the most up-to-date and complete versions</li>
											<li>DataShare accepts all file formats.</li>
											<li>Generally speaking, the data files you upload into DataShare should fall into one of the following types:
												<ul> 
													<li>text</li> 
													<li>spreadsheet (csv, tab-delimited, Excel)</li>
													<li>video</li>
													<li>image</li>
													<li>software code</li>
													<li>pdf</li>
												</ul>
											</li>
											<li>If the data files are of a specialized or proprietary nature, be sure to include any pertinent information that would allow the proper viewing and/or usage of the file(s) either as a separate 'Readme' document within the data set folder, or in the 'Technical Description'.</li>
										</ul>
								</div>
							</div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	<xsl:template name="dataUseAgreement">
		<html>
		
			<head>
				<title>Data Use Agreement: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="prepare-to-submit-page"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content"> 	
							<div class="single-column">
								<div class="single-column">
									<h1>DataShare Data Use Agreement</h1>
									<div class="text-container">
										As part of this agreement, Consumer submits to the following statements: 1) I will receive access to de-identified data and will not attempt to establish the identity of any of the study subjects. 2) I will share these data only with my immediate co-workers, and I will not transfer these data to other research groups. I understand that these data are available to other research groups through the process by which I obtain them. 3) I will require anyone in my group who utilizes these data, or anyone with whom I share these data to comply with this data use agreement. 4) I will accurately provide the requested information for persons who will use these data and the analyses that are planned using these data. 5) I will comply with any rules and regulations imposed by my institution and its institutional review board in requesting these data. 6) I understand that approved usage of these data does not entitle Consumer to any rights, title, or interest in the shared data. 7) I understand that Provider has the right to terminate this Agreement at any time for any reason. 8) I will ensure that Investigators who utilize these data will use appropriate administrative, physical and technical safeguards to prevent use or disclosure of the data other than as provided for by this Agreement. 9) I will report any use or disclosure of the data not provided for by this Agreement of which I become aware within 15 days of becoming aware of such use or disclosure. 10) I will, upon completion of my usage of these data, submit a brief usage report describing how the data were used and citing any abstracts, talks, or publications that resulted. This will be done within one year of data usage completion, or within 6 months of acceptance of any resulting abstracts, talks, or publications. I understand that failure to abide by these guidelines will result in termination of my privileges to access any further data.
									</div>
								</div>
							</div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	<xsl:template name="metadataBasicsPage">
		<html>
		
			<head>
				<title>Metadata basics: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="metadata-basics-page"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
							<!-- begin content -->
							<div id="content"> 	
								<div class="single-column">
									<h1>Metadata basics</h1>
									<div class="text-container">
										<p>
										Metadata, simply put, is data about data. Any descriptive information that helps people understand the data resource can be considered metadata. Metadata is important not only to help people understand and make proper use of a data resource, but metadata also makes the resource discoverable (for example through internet searches or data indexing services). DataShare requires only a few key pieces of metadata, however the more metadata available, the more useful and discoverable the resource becomes.
										</p>
										<p class="secondary-para">
											DataShare employs a metadata schema developed by DataCite, an international organization devoted to promoting best practices around data re-use. Each metadata field on the 'Describe your Data' page serves a purpose, and therefore some of these fields have specifications for acceptable entries. See below for a full list of metadata accepted by DataShare.
										</p>
										<table width="641">
										  <tr>
										    <td width="157" valign="top"><p align="center"><strong>Metadata Fieldname</strong></p></td>
										    <td width="484" valign="top"><p align="center"><strong>Description</strong></p></td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Title*</td>
										    <td width="484" valign="top">Title of the data resource</td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Data Creator(s)*</td>
										    <td width="484" valign="top">Main researcher(s) involved in producing the data,    or the authors of the publication, in priority order. (Last Name, First Name)</td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Description*</td>
										    <td width="484" valign="top">An abstract or general description of the data    resource </td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Institution</td>
										    <td width="484" valign="top">Name of the institution that supported creation of    the resource (DataShare currently pre-populates this field)</td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Date</td>
										    <td width="484" valign="top">Date the data resource was    shared <br />
										      (DataShare currently    pre-populates this field)</td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Methods</td>
										    <td width="484" valign="top">Any technical or methodological info that helps to    understand how the data were generated and/or how they may be properly    re-used</td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Keywords</td>
										    <td width="484" valign="top">Any keywords that help identify data domain(s)    (DataShare <strong>highly recommends </strong>using    a controlled vocabulary, such as <a href="http://www.ncbi.nlm.nih.gov/mesh">MeSH</a>) </td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Lab / Department</td>
										    <td width="484" valign="top">Lab or department responsible for collecting,    creating, or otherwise contributing to the development of the dataset </td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Funder</td>
										    <td width="484" valign="top">Agency responsible for funding the data generation </td>
									      </tr>
										  <tr>
										    <td width="157" valign="top">Related Resources</td>
										    <td width="484" valign="top">This field may be used to indicate the existence of    any other resources that are associated with the data, for example    publications or grant numbers (All formats are acceptable, however for    publications an identifier is preferred e.g. PMID or DOI)</td>
									      </tr>
									  </table>
										<p class="secondary-para">* Required for submission</p>

									</div>
								</div>
							</div><!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>
					<!-- begin footer-->
						<!--#include virtual="includes/footer.html" --> 
					<!-- end footer-->
				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	<xsl:template name="stepsPage">
		<html>
		
			<head>
				<title>Steps to publish your data: DataShare - Open data for the global research community</title>
				<xsl:call-template name="header_links"/>
			</head>

	 		<body>
		    
				<!-- begin page id -->
				<div id="steps-to-publish"> 
				<!-- begin outer container -->  
				  <div id="outer-container"> 
				    <!-- begin inner container -->
				    <div id="inner-container"> 
					
							<div class="header">
					     		<xsl:call-template name="ucsf_header"/>
					    	</div>
				       <!-- begin header -->
						<!--#include virtual="includes/header.html" --> 
					  <!-- end header -->
						<!-- begin navigation-->
							<!--#include virtual="includes/navigation.html" --> 
						<!--end navigation-->
						<!-- begin content -->
						<div id="content"> 	
						  <div id="steps-content">	
							<div id="left-container">
							<h1>Steps to Share Your Data</h1>
							<div class="steps">
							<ul>
								<li><span class="title">1. Prepare </span><br />
								Gather your data and information before starting. [<a href="/xtf/search?smode=preparePage">Read More</a>]</li>
								<li><span class="title">2. Describe Data </span> <br />
								Create your metadata. [<a href="/xtf/search?smode=metadataBasicsPage">Read More</a>]</li>
								<li><span class="title">3. Upload data </span><br />
								Add your data and metadata to DataShare. [<a href="/xtf/search?smode=uploadFaqPage">Read More</a>]</li>
								<li><span class="title">4. Get confirmation </span><br/>
								Receive your data citation.</li>
							</ul>
							</div>
							<div class="begin">
								<a href="http://datashare-ingest.ucsf.edu"><img src="assets/img/begin2.gif" width="149" height="42" alt="Begin"/></a>
							</div>
							</div>
							<div id="right-container">
								<div class="why-share">Why Share?</div>
								<div class="bullet-points">
									<ul>
										<li>Facilitates quality science </li>
										<li>Increases the visibility of underlying research (<a href="http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0000308">69% increase in citations for articles associated with shared datasets</a>)</li>
										<li>Allows credit for all research outputs, including unpublished work</li>
										<li>Enables validation and reproducibility (<a href="http://www-stat.stanford.edu/~wavelab/Wavelab_850/wavelab.pdf">"An article ... in a scientific publication is not the scholarship itself, it is merely advertising of the scholarship." - D. Donoho</a>)</li>
										<li>Enhances global collaborative opportunities</li>
										<li>Data re-use maximizes efficiency of available resources</li>
										<li>View the DataShare <a href="/xtf/search?smode=dataUseAgreement">Data Use Agreement</a></li>
									</ul>
								</div>
							</div>
						  </div>
						</div> <!-- end content-->
						<div id="triangle-container">
							<div id="triangle"></div>
						</div>

				
				<xsl:call-template name="footer"/>
					</div> <!-- end inner container -->
				  </div> <!-- end outer container -->
				</div>
				</body>
		</html>
		
	</xsl:template>
	
	
	
	<xsl:template name="aboutPage">
			<html>

				<head>
					<title>FAQ: DataShare - Open data for the global research community</title>
					<xsl:call-template name="header_links"/>
				</head>

		 		<body>

					<!-- begin page id -->
					<div id="terms-of-use"> 
					<!-- begin outer container -->  
					  <div id="outer-container"> 
					    <!-- begin inner container -->
					    <div id="inner-container"> 

								<div class="header">
						     		<xsl:call-template name="ucsf_header"/>
						    	</div>
					       <!-- begin header -->
							<!--#include virtual="includes/header.html" --> 
						  <!-- end header -->
							<!-- begin navigation-->
								<!--#include virtual="includes/navigation.html" --> 
							<!--end navigation-->
							<!-- begin content -->
							<div id="content"> 	
								<div id="terms-content">
						<h1>About</h1>
						<div class="text-container">

			      <p>DataShare enables individual researchers to share research data sets with the global community.</p>

			      <h3>Our vision</h3>
			      <p>Data sharing is critical for the advancement of scientific knowledge. Researchers benefit from increased collaborations, validation, and recognition of their work; institutions and funders benefit from the measurable increase in the impact of their resources; and society benefits from the faster pace at which science can progress. There are several barriers to providing access to data, and currently data sharing is mostly done by large, well funded multi-investigator projects. If these barriers were addressed, allowing individual investigators to easily and quickly share their primary research data, we could create a new culture of transparency and efficiency - likely resulting in major impacts on scientific advancement.</p>
				<p>The goal of the DataShare project is to catalyze widespread sharing of scientific research data. To this end, we have created tools, such as the DataShare repository and website, to reduce the barriers to data sharing. These tools can be used by individual investigators to provide the global research community with access to research data sets generated in their research environment. We hope these open-source tools will be adopted by any and all investigators interested in supporting Open Data.</p>
				<p>DataShare will not only provide storage, security, and replication services for data, but will also provide links to tools and information that will help scientists properly organize, manage, and document their datasets.</p>

			      <h3>Who we are</h3>
			      <p>The DataShare project is a collaboration between University of California San Francisco’s Clinical and Translational Science Institute (CTSI), the UCSF Library, and the UC Curation Center (UC3) at the California Digital Library.</p>
			      <p>UCSF's <strong><a href="http://ctsi.ucsf.edu/">Clinical &amp; Translational Science Institute</a></strong> facilitates the rapid translation of research to improvements in patient and community health. It is a cross-school, campus-wide institute with scientist leaders at its helm. To achieve its goal of accelerating research to advance health, CTSI provides infrastructure, services, and training to support clinical and translational research. To advance its mission, it also develops broad coalitions and partnerships at the local and national levels to enable a transformation of the research environment. Established in 2006, the Institute was among the first of the now 60-member, National Institutes of Health-funded, Clinical and Translational Science Awards (CTSA) consortium.</p>
			      <p>The mission of the <strong><a href="http://www.library.ucsf.edu/">UCSF Library</a> and <a href="http://www.library.ucsf.edu/about/ckm">Center for Knowledge Management</a></strong> is to advance science, foster excellence in teaching and learning, and promote health through the collection, development, organization, and dissemination of the world's health sciences knowledge base. It delivers services to the UCSF community and works with faculty on a number of collaborative projects in both education and research. On May 21, 2012 the UCSF faculty approved an Open Access policy for journal articles and the Library is developing systems and strategies to comply with the policy.</p>
			      <p><strong><a href="http://www.cdlib.org/services/uc3/">UC3</a> at the <a href="http://www.cdlib.org/">California Digital Library</a></strong> is a creative partnership bringing together the expertise and resources of the CDL, the ten UC campuses, and the broader international curation community. The group fosters collaborative analysis, projects, and solutions to ensure the long-term viability and usability of curated digital content. Examples of tools and services include the Merritt Data Repository, the EZID persistent identifier service, the Web Archiving Service (WAS), and Data Management Plan Tool (DMPTool).</p>
			      <p>This project was originally envisioned by <strong>Michael Weiner M.D.</strong>, the director for the <a href="http://www.radiology.ucsf.edu/cind">Center for Imaging of Neurodegenerative Diseases</a> at UCSF. Weiner’s experience as the Principal Investigator of the <a href="http://adni.loni.ucla.edu/">Alzheimer’s Disease Neuroimaging Initiative (ADNI)</a> led him to conclude that widespread data sharing can be achieved now, with great scientific and economic benefits. All ADNI raw data is immediately shared, without embargo, with all scientists in the world. The project is very successful: more than 300 publications have resulted from use of the ADNI data resource. This success demonstrates the feasibility and benefits of sharing data.</p>

				</div>
			</div>
			    </div>

		<xsl:call-template name="footer"/>
		
			</div></div></div>
		</body>
	</html>
		
	</xsl:template>
	
	
	<xsl:template name="whyShareDataPage">
	<html>
		<head>
			<title>DataShare: Why Share Data?</title>
			<xsl:call-template name="header_links"/>
		</head>

 		<body>
	    	<div class="header">
	     		<xsl:call-template name="ucsf_header"/>
	    	</div>
	
			<div class="content content-longtext">
				<h3>Why Share Data?</h3>
			    <p>Sharing research data helps to advance science and is beneficial to data sharers, data re-users, and the general public.</p>
				<p><i>Sharing research data allows:</i>
				<ul>
				<li>Enhanced visibility of a researcher’s work: Sharing data is associated with a significant increase in citation rate for related publications (Piwowar, H A, et al., 2007); additionally the re-use of a dataset results in citation of the dataset itself</li>
				<li>Improved understanding of original analyses</li>
				<li>Exploration of related or new hypotheses with data re-use (particularly with combined datasets)</li>
				<li>Investigation and development of new study methods, analysis techniques, and software implementations with data re-use</li>
				<li>Encouragement of multiple perspectives</li>
				<li>Establishment of new collaborations</li>
				<li>Discouragement of fraud</li>
				<li>Provision of training materials for new researchers</li>
				<li>Identification of errors</li>
				<li>Efficient use of funding and patient population resources by avoiding duplicate data collection</li>
				<li>Encouragement of improved data management</li>
				<li>Long-term preservation (and provenance) of data with improved accessibility</li>
				</ul>
				</p>
				<i>Related Policies</i>
				<p>
					<ul>
						<li>NIH Open Access policy</li>
						<li>NIH Statement on Sharing Research Data (NIH-OD-03-032) : All projects whose funds total more than $500K must share the resulting acquired data</li>
						<li>NSF general grant conditions:  “Investigators are expected to share with other researchers, at no more than incremental cost and within a reasonable time, the primary data, samples, physical collections and other supporting materials created or gathered in the course of work under NSF grants. Grantees are expected to encourage and facilitate such sharing.”</li>
						<li>Wellcome Trust  “expects all of its funded researchers to maximise the availability of research data with as few restrictions as possible”</li>
						<li>Journal requirements to make data available as a condition of publication (Nature journals, PLoS journals, Royal Society journals)</li>
					</ul>
				</p>

				<p><b>DataShare</b> provides a unique infrastructure to support sharing of scientific datasets. We have developed a set of user-driven features that enhance the utility of the data resource while also providing an intuitive user interface. Our site allows for enrichment of data resources by associating descriptive metadata, but only requires entry of minimal metadata information. Data deposited into DataShare will benefit from the outstanding archival services offered by the California Digital Library, and will be indexed for discovery in the Web of Science. DataShare datasets will also be assigned a unique persistent identifier (doi), allowing the data to be properly cited upon re-use.</p>

				<p><b>References:</b></p>
				<p>
					Piwowar, H A, et al. (2007) Sharing detailed research data is associated with increased citation rate.  PLoS ONE 2(3): e308. doi:10.1371/journal.pone.0000308
					<br/><a href="http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0000308">http://www.plosone.org/article/info:doi%2F10.1371%2Fjournal.pone.0000308</a>
				</p>
				<p>
					Finkbeiner (2001). “Invisible Astronomers Give Their All to the Sloan”. Science 292: 1472-1475. 				   		
					<br/><a href="http://dx.doi.org/10.1126/science.292.5521.1472">http://dx.doi.org/10.1126/science.292.5521.1472</a>
				</p>

				<p>Sinnott et al. (2005). Large-scale data sharing in the life sciences: Data standards, incentives, barriers and funding models (The Joint Data Standards Study). 
				<br/><a href="http://www.dcs.gla.ac.uk/publications/paperdetails.cfm?id=8109">http://www.dcs.gla.ac.uk/publications/paperdetails.cfm?id=8109</a>
				</p>

				<p>Nelson (2009). Data sharing: Empty archives. Nature 461: 160-163. 
					<br/>http://www.nature.com/news/2009/090909/full/461160a.html
					<br/>Pienta, Alter and Lyle (2010). The enduring value of social science research: The use and reuse of primary research data. ICPSR book. 
					<br/><a href="http://hdl.handle.net/2027.42/78307">http://hdl.handle.net/2027.42/78307</a>
				</p>
				
				<p>From UK Data Archive: Why share data?
					<br/><a href="http://www.data-archive.ac.uk/create-manage/planning-for-sharing/why-share-data">http://www.data-archive.ac.uk/create-manage/planning-for-sharing/why-share-data</a>
					<br/><a href="http://www.kevinmd.com/blog/2011/10/medical-scientists-share-data.html">http://www.kevinmd.com/blog/2011/10/medical-scientists-share-data.html</a>
				</p>

			    </div>

		<xsl:call-template name="footer"/>
		</body>
	</html>
		
	</xsl:template>
	
	<xsl:template name="uploadPage">
		<html>
		 		<head>
					<title>DataShare: Upload</title>
					<xsl:call-template name="header_links"/>
				</head>
				
		  <body>

		    <div class="header">
		     	<xsl:call-template name="ucsf_header"/>
		    </div>
		
			<div class="content content-upload">
			      <h2>Upload research datasets to DataShare</h2>

			      <div class="upload-apply">

				<p>While our automated upload mechanism is under construction, we are providing curator-assisted data submission. Please send a request to get started and you will receive a response the very next business day.</p>
				
				<form name="afm_form_e71bf67c" id="afm_form_e71bf67c" action="http://free.allforms.mailjol.net/u/e71bf67c.php" method="POST" style="margin: 0px">
 				<dt>Name</dt>				
				<dd><input type="Text" name="Name:"/></dd>
				<dt>Lab/Department</dt>
				<dd><input type="Text" name="Lab/Department"/></dd>
				<dt>Email</dt>
				<dd><input type="Text" name="Email:"/></dd>
				<dt>Message</dt>
				<dd><textarea rows="4" cols="19" name="Message:"></textarea></dd>
				<dt>Apply</dt>
				<input type="hidden" name="feedback-type" value="upload"/>
				<dd><input type="submit" name="submit" value="Submit"/> &#160;<input type="reset" name="reset" value="Reset"/></dd>
				</form>
				
			      </div>

			      <div class="upload-promo">
				<div class="promo-box">
				  <h3>Why share data?</h3>

				  <p>"We believe that data sharing is essential for expedited
				    translation of research results into knowledge, products,
				    and procedures to improve human health. The NIH endorses the
				    sharing of final research data to serve these and other
				    important scientific goals. The NIH expects and supports the
				    timely release and sharing of final research data from
				    NIH-supported studies for use by other
				    researchers."<br/>- NIH Statement on Sharing Research
				    Data</p>

				  <p>"Science is based on building on, reusing and openly
				    criticising the published body of scientific knowledge.
				    For science to effectively function, and for society to
				    reap the full benefits from scientific endeavours, science
				    must be made open."<br />- Open Science
				    Manifesto</p>
				</div>
			      </div>

			    </div>
		
		  </body>
		
		  <xsl:call-template name="footer"/>
	    
		</html>
	</xsl:template>
	
</xsl:stylesheet>


