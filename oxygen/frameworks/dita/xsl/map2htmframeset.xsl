<?xml version="1.0" encoding="UTF-8" ?>
<!-- This file is part of the DITA Open Toolkit project hosted on 
     Sourceforge.net. See the accompanying license.txt file for 
     applicable licenses.-->
<!-- (c) Copyright IBM Corp. 2004, 2005 All Rights Reserved. -->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:saxon="http://icl.com/saxon"
                extension-element-prefixes="saxon"
                >

  <xsl:import href="../DITA-OT/xsl/map2htmtoc.xsl"/>
  <xsl:param name="oxy_cfn" select="'toc'"/>
  
  <xsl:variable name="oxy_cfn_html" select="concat($oxy_cfn,'.toc.html')"/>

  <!-- Outputs the frameset. This goes into the output file. -->
  <xsl:template match="/">
      <html>
        <head>          
          <xsl:choose>
            <xsl:when test="/*[contains(@class,' map/map ')]/*[contains(@class,' topic/title ')]">
              <title><xsl:value-of select="/*[contains(@class,' map/map ')]/*[contains(@class,' topic/title ')]"/></title>
            </xsl:when>
            <xsl:when test="/*[contains(@class,' map/map ')]/@title">
              <title><xsl:value-of select="/*[contains(@class,' map/map ')]/@title"/></title>
            </xsl:when>
          </xsl:choose>
        </head>
                
        
        <frameset cols="25%,*">
          <frame name="navwin" src="{$oxy_cfn_html}" />
          <frame name="contentwin" src="{$oxy_cfn_html}" scrolling="auto" />
        </frameset>
      </html>
    
    <!-- Generates the TOC. -->
    <saxon:output href="{concat($WORKDIR, '/', $oxy_cfn_html)}">
      <!-- *********************************************************************************
        Setup the HTML wrapper for the table of contents
        ********************************************************************************* -->
        <html><xsl:value-of select="$newline"/>
          <head><xsl:value-of select="$newline"/>
            <xsl:if test="string-length($contenttarget)>0 and
              $contenttarget!='NONE'">
              <base target="{$contenttarget}"/>
            </xsl:if>
            <xsl:choose>
              <xsl:when test="/*[contains(@class,' map/map ')]/*[contains(@class,' topic/title ')]">
                <title><xsl:value-of select="/*[contains(@class,' map/map ')]/*[contains(@class,' topic/title ')]"/></title>
              </xsl:when>
              <xsl:when test="/*[contains(@class,' map/map ')]/@title">
                <title><xsl:value-of select="/*[contains(@class,' map/map ')]/@title"/></title>
              </xsl:when>
            </xsl:choose>
          </head>
          
          <body>
            <xsl:apply-templates/>
          </body>
        </html>
    </saxon:output>
    
  </xsl:template>

</xsl:stylesheet>
