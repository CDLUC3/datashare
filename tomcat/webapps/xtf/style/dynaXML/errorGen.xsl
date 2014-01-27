<!-- ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ -->
<!-- Error page generation stylesheet                                       -->
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

<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:output method="xhtml" indent="no" 
      encoding="UTF-8" media-type="text/html; charset=UTF-8" 
      doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
      doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
      exclude-result-prefixes="#all"
      omit-xml-declaration="yes"/>

<xsl:template match="/">

		<html>
		
			<head>
				<title>Error Page</title>
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
								<h1>Error - Page Not Found</h1>
								<div class="text-container">
								<p>
								Sorry, DataShare is unable to locate the page you have requested.
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
		<div id="logo"> <a href="index.html"> <img src="assets/img/datashare-logo3.gif" width="320" height="63" alt="DataShare: Open data for the global research community" title="DataShare: Open data for the global research community" /> </a> </div>
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
