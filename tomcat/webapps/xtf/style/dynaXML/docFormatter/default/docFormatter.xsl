<xsl:stylesheet version="2.0" 
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns:xtf="http://cdlib.org/xtf"
   xmlns:session="java:org.cdlib.xtf.xslt.Session"
   xmlns:editURL="http://cdlib.org/xtf/editURL"
   xmlns="http://www.w3.org/1999/xhtml"> 
   
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <!-- ERC (Electronic Resource Citations) Stylesheet                         -->
   <!-- See the ERC spec: http://www.cdlib.org/inside/diglib/ark/ercspec.html  -->
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
   
   <!-- ====================================================================== -->
   <!-- Import Common Templates                                                -->
   <!-- ====================================================================== -->
   
   <xsl:import href="../common/docFormatterCommon.xsl"/>

   <!-- ====================================================================== -->
   <!-- Output Format                                                          -->
   <!-- ====================================================================== -->
   
   <xsl:output method="xhtml" indent="no" 
      encoding="UTF-8" media-type="text/html; charset=UTF-8" 
      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
      exclude-result-prefixes="#all"
      omit-xml-declaration="yes"/>

   <xsl:output name="frameset" method="xhtml" indent="no" 
      encoding="UTF-8" media-type="text/html; charset=UTF-8" 
      doctype-public="-//W3C//DTD XHTML 1.0 Frameset//EN" 
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd" 
      omit-xml-declaration="yes"
      exclude-result-prefixes="#all"/>

   
   <!-- ====================================================================== -->
   <!-- Global parameters and variables                                        -->
   <!-- ====================================================================== -->
   
   <xsl:param name="http.URL"/>
   <xsl:variable name="ercPat" select="'^(http://[^?]+)/erc/([^?]+)\?q$'"/>
   <xsl:param name="docId">
      <!-- Normally this is a URL parameter, but in ERC mode it's part of the main URL. -->
      <xsl:value-of select="replace($http.URL, $ercPat, '$2')"/>
   </xsl:param>

   <!-- ====================================================================== -->
   <!-- Define Parameters                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:param name="doc.title" select="/title"/>
   <xsl:param name="css.path" select="'css/default/'"/>

   
   <!-- ====================================================================== -->
   <!-- Root Template                                                          -->
   <!-- ====================================================================== -->
   
   <xsl:template match="/">
      <xsl:choose>
         <!-- robot solution -->
         <xsl:when test="matches($http.user-agent,$robots)">
            <xsl:call-template name="robot"/>
         </xsl:when>
         <!-- Creates the button bar.-->
         <xsl:when test="$doc.view = 'bbar'">
            <xsl:call-template name="bbar"/>
         </xsl:when>
         <!-- Creates the basic table of contents.-->
         <xsl:when test="$doc.view = 'toc'">
            <xsl:call-template name="toc"/>
         </xsl:when>
         <!-- Creates the body of the finding aid.-->
         <xsl:when test="$doc.view = 'content'">
            <xsl:call-template name="body"/>
         </xsl:when>
         <!-- citation -->
         <xsl:when test="$doc.view='citation'">
            <xsl:call-template name="citation"/>
         </xsl:when>
         <!-- Creates the basic frameset.-->
         <xsl:otherwise>
            <xsl:call-template name="frameset"/>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Frameset Template                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:template name="frameset">

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

	      <h1><xsl:apply-templates select="//title"/></h1>

	      <div class="dataset-description">

			<dl>
		       <xsl:if test="//title"> 
				<dt>Title</dt>
			  	<dd><span class="DC-Title"><xsl:apply-templates select="//title"/></span></dd>
		  	    </xsl:if>

		       <xsl:if test="//*/*:meta/*:creator"> 
			  	<dt>By</dt>
			  	<dd class="DC-Creator">
	           		<xsl:apply-templates select="//*/*:meta/*:creator"/>
			  	</dd>
	      	  </xsl:if>


		       <xsl:if test="//*/*:meta/*:contributor"> 
			  <dt>At</dt>
				  <dd>
				    <span class="DC-Contributor"><xsl:apply-templates select="//*/*:meta/*:contributor"/>,&#160;</span>
				    <span class="DC-Publisher"><xsl:apply-templates select="//*/*:meta/*:publisher"/></span>
				  </dd>
			  </xsl:if>

			 <xsl:if test="//*/*:meta/*:description[@descriptionType='SeriesInformation']"> 
				<dt>Papers</dt>

				<xsl:if test="count(//*/*:meta/*:description[@descriptionType='SeriesInformation']) > 1">

				  	<dd>
					    <div class="collapsible">
					      <div class="collapse-control"><span class="indicator"></span> publications associated with data</div>
					      <div class="collapse-content">
					      	<xsl:for-each select="//*/*:meta/*:description[@descriptionType='SeriesInformation']">
						    	<span class="DC-Type">
									<xsl:value-of select="."/>
								</span>
								<p/>
							</xsl:for-each>
					      </div>
					    </div>
				  	</dd>
				</xsl:if>

				<xsl:if test="count(//*/*:meta/*:description[@descriptionType='SeriesInformation']) = 1">
					  <dd>
					    <span class="DC-Type"><xsl:apply-templates select="//*/*:meta/*:description[@descriptionType='SeriesInformation']"/></span>
					  </dd>
				</xsl:if>
			  </xsl:if>

			  <xsl:for-each select="//*/*:meta/*:description[@descriptionType='Abstract']">
				<xsl:if test="//*/*:meta/*:description[@descriptionType='Abstract']">
			  		<dt>Description</dt>
					<dd>
				    	<span class="DC-Type">
							<xsl:value-of select="."/>
						</span>
				</dd>
			   </xsl:if>
			</xsl:for-each>

			  <xsl:for-each select="//*/*:meta/*:description[@descriptionType='Methods']">
			   <xsl:if test="//*/*:meta/*:description[@descriptionType='Methods']">
				<dt>Methods</dt>
			  		<dd>
					    <div class="collapsible">
					      <div class="collapse-control"><span class="indicator"></span> Methods</div>
					      <div class="collapse-content">
							<xsl:value-of select="."/>
						  </div>
					    </div>
				  	</dd>
			    </xsl:if>
			  </xsl:for-each>


	       <xsl:if test="//*/*:meta/*:type"> 
			  <dt>Type</dt>
			  <dd>
			    <span class="DC-Type"><xsl:apply-templates select="//*/*:meta/*:type"/></span>
			  </dd>
			</xsl:if>

			<xsl:if test="//*/*:meta/*:size"> 
			  <dt>Size</dt>
			  <dd>
			    <span class="DC-Type"><xsl:apply-templates select="//*/*:meta/*:size"/></span>
			  </dd>
			</xsl:if>

			<xsl:if test="/*/*:meta/*:date"> 
			  <dt>Date</dt>
			  <dd>
				<xsl:if test="//*/*:meta/*:collected">
			    	Collected <span class="DC-Coverage"><xsl:apply-templates select="//*/*:meta/*:collected"/></span>
				</xsl:if>
				<xsl:if test="//*/*:meta/*:date">
			    	Analyzed <span class="DC-Date-Created"><xsl:apply-templates select="//*/*:meta/*:date"/></span>
				</xsl:if>
				<xsl:if test="//*/*:meta/*:added">
			    	Uploaded <span class="DC-Date"><xsl:apply-templates select="//*/*:meta/*:added"/></span>
				</xsl:if>
			  </dd>
			</xsl:if>

			 <xsl:if test="//*/*:meta/*:subject"> 
			  <dt>Keywords</dt>
			  <dd>
			    <span class="DC-Subject">
		              <xsl:apply-templates select="//*/*:meta/*:subject"/>
			    </span>
			  </dd>
			  </xsl:if>

			 <xsl:if test="//doi"> 
			  <dt>Identifier</dt>
			  <dd><span class="DC-Identifier"><xsl:apply-templates select="//doi"/></span></dd>
			 </xsl:if>
			</dl>
	      </div>
	
		<div class="dataset-actions">
			<div class="dataset-action-buttons">
				<a class="dataset-action-download">
	               <xsl:attribute name="href">
	                    <xsl:value-of select="normalize-space(//target)"/>
	               </xsl:attribute> 
	               <xsl:attribute name="target">
	                    <xsl:value-of select="'_target'"/>
	               </xsl:attribute>
	             <b>
	             Download <xsl:apply-templates select="//objectsize"/> dataset
	             </b></a>

				 <a class="dataset-action-cite" href="{$doc.path}&#038;doc.view=citation" target="_top">Cite this dataset</a>
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
   <!-- Content Template                                                       -->
   <!-- ====================================================================== -->
    <xsl:template name="body">
        <body>
         <table>   
	
			<tr>
               <td>
                  <xsl:text>&#160;</xsl:text>
               </td>
               <td style="text-align:right;vertical-align:top">
                  <b>Title:&#160;&#160;</b>
               </td>
               <td>
                  <xsl:apply-templates select="dc/title"/>
               </td>
               <td>
                  <xsl:text>&#160;</xsl:text>
               </td>
            </tr>
	      
			<tr>
				<td>
					<xsl:text>&#160;</xsl:text>
				</td>
				<td style="text-align:right;vertical-align:top">
					<b>Author:&#160;&#160;</b>
				</td>
				<td class="col3">
                    <xsl:for-each select="dc/creator">
                       <xsl:value-of select="."/>
                       <xsl:if test="not(position() = last())">
                          <xsl:text> | </xsl:text>
                       </xsl:if>
                    </xsl:for-each>
				</td>
				<td>
					<xsl:text>&#160;</xsl:text>
				</td>
			</tr>
			
			 <tr>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	               <td style="text-align:right;vertical-align:top">
	                  <b>Lab:&#160;&#160;</b>
	               </td>
	               <td>
	                  <xsl:apply-templates select="dc/contributor"/>
	               </td>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	            </tr>
			
            	<tr>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	               <td style="text-align:right;vertical-align:top">
	                  <b>Published:&#160;&#160;</b>
	               </td>
	               <td>
	                  <xsl:choose>
	                     <xsl:when test="//year">
	                        <xsl:value-of select="replace(//year[1],'^.+ ','')"/>
	                     </xsl:when>
	                     <xsl:otherwise>
	                        <xsl:apply-templates select="//date"/>
	                     </xsl:otherwise>
	                  </xsl:choose>
	               </td>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	            </tr>
	
	        	<tr>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	               <td style="text-align:right;vertical-align:top">
	                  <b>Submitted:&#160;&#160;</b>
	               </td>
	               <td>
	                  <xsl:choose>
	                     <xsl:when test="//year">
	                        <xsl:value-of select="replace(//year[1],'^.+ ','')"/>
	                     </xsl:when>
	                     <xsl:otherwise>
	                        <xsl:apply-templates select="//submitted"/>
	                     </xsl:otherwise>
	                  </xsl:choose>
	               </td>
	               <td>
	                  <xsl:text>&#160;</xsl:text>
	               </td>
	            </tr>
	
				<xsl:if test="//abstract">
	               <tr>
	                  <td>
	                     <xsl:text>&#160;</xsl:text>
	                  </td>
	                  <td style="text-align:right;vertical-align:top">
	                     <b>Abstract:&#160;&#160;</b>
	                  </td>
	                  <td>
	                         <xsl:apply-templates select="dc/abstract"/> 
	                  </td>
	                  <td>
	                     <xsl:text>&#160;</xsl:text>
	                  </td>
	               </tr>
	            </xsl:if>
	
            <xsl:if test="dc/contributor">
           
            </xsl:if>
            <xsl:if test="//subject">
               <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>Subjects:&#160;&#160;</b>
                  </td>
                  <td>
                    <xsl:for-each select="dc/subject">
						<xsl:value-of select="."/>
                          <xsl:if test="not(position() = last())">
                             <xsl:text> | </xsl:text>
                          </xsl:if>
                    </xsl:for-each> 
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>
            
			<xsl:if test="//type">
               <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>Type:&#160;&#160;</b>
                  </td>
                  <td>
                         <xsl:apply-templates select="dc/type"/> 
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>

			<xsl:if test="//size">
               <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>Size:&#160;&#160;</b>
                  </td>
                  <td>
                         <xsl:apply-templates select="dc/size"/> 
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>

			<xsl:if test="//format">
               <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>Format:&#160;&#160;</b>
                  </td>
                  <td>
                         <xsl:apply-templates select="dc/format"/> 
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>

			 <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>&#160;&#160;</b>
                  </td>
                  <td>
                     <b><a href="terms.html">Terms Of Use</a></b>
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>

            <xsl:if test="//identifier"> 
               <tr>
                  <td>
                    <xsl:text>&#160;</xsl:text>
                  </td>
					<xsl:text>&#160;</xsl:text>
				  <td>
                  </td>
                  <td>
                  <a>
                     <xsl:attribute name="href">
                          <xsl:value-of select="normalize-space(//target)"/>
                     </xsl:attribute> 
                     <xsl:attribute name="target">
                          <xsl:value-of select="'_target'"/>
                     </xsl:attribute>
                   <b>
                   <xsl:text>Get dataset</xsl:text>
                   </b></a>
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>

			<xsl:if test="//identifier"> 
               <tr>
                  <td>
                    <xsl:text>&#160;</xsl:text>
                  </td>
					<xsl:text>&#160;</xsl:text>
				  <td>
                  </td>
                  <td>
                  <a>
                     <xsl:attribute name="href">
                          <xsl:value-of select="normalize-space(//target)"/>
                     </xsl:attribute> 
                     <xsl:attribute name="target">
                          <xsl:value-of select="'_target'"/>
                     </xsl:attribute>
                   <b>
                   <xsl:text>Cite This</xsl:text>
                   </b></a>
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>
            </xsl:if>

               <tr>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
                  <td style="text-align:right;vertical-align:top">
                     <b>&#160;&#160;</b>
                  </td>
                  <td>
                     <b><a href="questions.html">Questions</a></b>
                  </td>
                  <td>
                     <xsl:text>&#160;</xsl:text>
                  </td>
               </tr>

         </table>
         </body>
	</xsl:template>            

   <!-- ====================================================================== -->
   <!-- TOC Template                                                       -->
   <!-- ====================================================================== -->
   
   <xsl:template name="toc">
      
         <body>
         <h2>Laboratories</h2>
		 <ul>
		 <li>UC Davis Center for Biodemographics</li>
		 <li>UCSF Center for the Imaging of Neurodegenerative Diseases (CIND)</li>
		 </ul>
         </body>
   </xsl:template>      


      

</xsl:stylesheet>
