<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:editURL="http://cdlib.org/xtf/editURL"
   version="2.0">
   
   
   
   <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
   <!-- Search forms stylesheet                                                -->
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
   <!-- Global parameters                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:param name="freeformQuery"/>
   
   <!-- ====================================================================== -->
   <!-- Form Templates                                                         -->
   <!-- ====================================================================== -->
   
   <!-- main form page -->
   <xsl:template match="crossQueryResult" mode="form" exclude-result-prefixes="#all">
      <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
		
			<xsl:call-template name="header_links"/>

		     	
		
            <div class="searchPage">
               <div class="forms">
                  
					<!--
                     <tr>
                        <td class="{if(matches($smode,'simple')) then 'tab-select' else 'tab'}"><a href="search?smode=simple">Keyword</a></td>
                        <td class="{if(matches($smode,'advanced')) then 'tab-select' else 'tab'}"><a href="search?smode=advanced">Advanced</a></td>
                        <td class="{if(matches($smode,'freeform')) then 'tab-select' else 'tab'}"><a href="search?smode=freeform">Freeform</a></td>
                        <td class="{if(matches($smode,'browse')) then 'tab-select' else 'tab'}"><a href="search?smode=browse">Browse</a></td>
                     </tr>
					-->
                           <div class="form">
                              <xsl:choose>
                                 <xsl:when test="matches($smode,'simple')">
                                    <xsl:call-template name="simpleForm"/>
                                 </xsl:when>
								<!-- advanced and free form searches not in v1 -->
								<!--
                                 <xsl:when test="matches($smode,'advanced')">
                                    <xsl:call-template name="advancedForm"/>
                                 </xsl:when>
                                 <xsl:when test="matches($smode,'freeform')">
                                    <xsl:call-template name="freeformForm"/>
                                 </xsl:when>
                                 <xsl:when test="matches($smode,'browse')">
                                             <p>Browse all documents by the available facets, or alphanumerically by author or title:</p>
                                             <xsl:call-template name="browseLinks"/>
                                 </xsl:when>
								-->
                              </xsl:choose>
                           </div>
               </div>
            </div>
      </html>
   </xsl:template>

	<xsl:template name="simpleFormBkp" exclude-result-prefixes="#all">
		<div class="content content-home">
			
		<div class="main-row">
	   		<div class="find-data">
			  <h2><img src="assets/img/search.png" alt=""/> Find data</h2>

			    <div class="home-search-block">
					
					<form method="get" action="/xtf/search">
							<input type="text" placeholder="e.g. HIV, radiology" name="keyword"/>
				            <xsl:text>&#160;</xsl:text>
				            <input type="submit" value="Search"/>
					  </form>
			    </div>

			    <div class="browse-options">
			      <h3>Browse by:</h3>
			      <h4><a href="/xtf/search?browse-all=yes">All Records</a></h4>
			      <h4><a href="/xtf/search?browse-labs=all">Lab/Department</a></h4>
			      <h4><a href="/xtf/search?browse-researchers=all">Researcher</a></h4>
			    </div>
			</div>	
		
			<div class="share-data">

			  <h2><img src="assets/img/upload.png"  alt=""/> Share data</h2>
			  <div class="upload-link"><a href="/xtf/search?smode=uploadPage">Upload research data</a></div>
			  <div class="help-options">
			    <h3>Learn more:</h3>
			    <h4><a href="/xtf/search?smode=aboutPage">About DataShare</a></h4>
			    <h4><a href="/xtf/search?smode=whyShareDataPage">Why share research data?</a></h4>
			    <h4><a href="/xtf/search?smode=faqPage">FAQ</a></h4>
			  </div>
			  </div>
			</div>
			
			<div class="promo-row">
				<div class="featured-data">
					 <div class="promo-box">
						<h3>Recently uploaded research data</h3>
						
						<ul>
						<xsl:for-each select="document('../../../../static/brand/featured.xml')//featured">
							<xsl:for-each select="./dataset">
								<li>
									<a href="{./link}">
									<xsl:value-of select="string(./title)" />
									</a>
								</li>
							</xsl:for-each>
						</xsl:for-each>
						</ul>
					</div>
				</div>
				
				<div class="featured-sharer">
					  <div class="promo-box">
					    <h3>Researcher voices</h3>
					    <img class="headshot" src="assets/img/promo/weiner.jpg" />
					    <p>
					      <p>"Making data transparent and available is going to accelerate all of science. It's a relatively inexpensive way to get more value out of all of the work that we do." &#8212;Dr. Michael Weiner, UCSF</p>
					    </p>
					  </div>
					</div>
			</div>
		</div>
		
	</xsl:template>
   
 	<xsl:template name="simpleForm" exclude-result-prefixes="#all">
		
		<body>
		<!-- begin page id -->
		<div id="home"> 
		<!-- begin outer container -->  
		  <div id="outer-container"> 
		    <!-- begin inner container -->
		    <div id="inner-container"> 
		      <!-- begin header -->
		    <xsl:call-template name="ucsf_header"/>


					<div id="banner">
						<img src="assets/img/banner-home-v8.0.jpg" width="952" height="72" alt="Publish and Download Research Datasets"/>
					</div>	
					<!-- begin content -->
					<div id="content"> 	
						<div id="left-column">
						<div id="search-container">
							<div class="left"><img src="assets/img/magnifying2.gif" width="76" height="75" alt="Search-icon"/></div>
							<div class="right">
								
								<h1>Search for Data</h1>
								
								<!--
								<form id="search-form" name="search-form" action="#" method="get">
									<label for="search-box"><span class="hidden">Search</span></label><input id="search-box" name="keyword" type="text"/>
									<input type="submit" alt="Go"/>
									<p/>
								</form>
								-->
								
									<form id="search-form" name="search-form" action="#" method="get">
										<label for="search-box"><span class="hidden">Search</span></label><input id="search-box" name="keyword" type="text"/>

										<input id="search-go" type="submit" name="submit" value=""></input>

									</form>
								
								<p id="or">or</p>
									<a href="/xtf/search?browse-all=yes"><input type="image" src="assets/img/browse.png" id="browse" alt="Browse all data"/></a>
							</div>
							<div id="featured-dataset">
								<div class="header">
									<p class="title">Featured Dataset</p>
								</div>
								<div class="para">
									<p><a href="/xtf/view?docId=erc/ark%2B%3Db7272%3Dq6cc0xmh/mrt-datacite.xml;query=;brand=default">White matter damage in frontotemporal dementia and Alzheimer’s disease measured by diffusion MRI.</a></p>
								</div>
								</div>
						</div>
						</div>
						<div id="right-column">
							<div id="publish-data">
							<div class="left-publish"><img src="assets/img/world2.gif" width="75" height="73" alt="World-icon"/></div>
							<div class="right-publish">
								<h1>Share Data</h1>
								<ul>
									<li>Make your data count</li>
									<li>Get credit for your data</li>
									<li>Ensure reproducibility</li>
									<li>Promote reuse</li>
									<li>Meet funder requirements</li>
								</ul>
								<a href="/xtf/search?smode=stepsPage"><img src="assets/img/learn-more.gif" width="125" height="27" alt="Learn more"/></a>
							</div>
							<div id="reasercher-voice">
								<div class="researcher-header">
									<p >Researcher Voice</p>
								</div>
								<div class="voice-container">
									<img src="assets/img/researcher-pic.jpg" width="60" height="81" alt="Researcher - Dr. Michael Weiner"/>
									<div class="voice"><p>“Making data transparent and available is going to accelerate all of science. It’s a relatively inexpensive way to get more value out of all of the work that we do.” <br/>-Dr. Michael Weiner, UCSF</p>
									</div>
								</div>
							</div>
							</div>
						</div>
					</div> <!-- end content-->
			<!-- begin footer-->
		    <xsl:call-template name="footer"/>

		
		<!-- end footer logos --> 
			<!-- end footer-->
			</div> <!-- end inner container -->
		  </div> <!-- end outer container -->
		</div> <!-- end page id container -->
		</body>
		
	</xsl:template>

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

	<xsl:template name="affiliation">
		<html>
				<head>
					<title>DataShare: Browse by Lab</title>
					<xsl:call-template name="header_links"/>
				</head>			
				<xsl:call-template name="ucsf_header"/>
			  <body>
			    <div class="content">

					<h2>Labs on DataShare:</h2>
					<ul>
							<xsl:for-each select="document('../../../../static/brand/labinfo.xml')/labs/lab">
								<li>
				        			<a href="/xtf/search?browse-lab=all;f1-contributor={contributor}"><xsl:value-of select="campus"/>, <xsl:value-of select="name"/></a>
								</li>
				   			</xsl:for-each>
					</ul>
			    </div>

			    <xsl:call-template name="footer"/>
			  </body>
		</html>
	</xsl:template>
	
	<xsl:template name="researcher">
		<html>
				<head>
					<title>DataShare: Browse by Researcher</title>
					<xsl:call-template name="header_links"/>
				</head>			<xsl:call-template name="ucsf_header"/>
			  <body>
			    <div class="content">

					<h2>Researchers on DataShare:</h2>
					<ul>
							<xsl:for-each select="document('../../../../static/brand/researcherinfo.xml')/researchers/researcher">
								<li>
				        			<a href="/xtf/search?browse-researcher=all;f1-creator={editURL:protectValue(creator)}"><xsl:value-of select="creator"/></a>
								</li>
				   			</xsl:for-each>
					</ul>
			    </div>

			    <xsl:call-template name="footer"/>
			  </body>
		</html>
	</xsl:template>
   
</xsl:stylesheet>
