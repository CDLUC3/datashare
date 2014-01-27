<?xml version="1.0" encoding="utf-8"?>
<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2008/10/15 14:46:30 $, $Revision: 1.8 $, $Author: sorin $

XSL stylesheet to process TEI documents using ODD markup

 
##LICENSE
-->
<!-- separate bits by David Tolpin, combined by Sebastian Rahtz January 2004 


manglexsd.xsl

Take a W3C scheme and sort out inherited content type
problem from trang, which upsets Microsoft

-->
<xsl:stylesheet version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*|@*|text()|comment()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="xsd:complexType">
    <xsl:copy>
      <xsl:choose>
        <xsl:when test="@mixed"/>
        <xsl:when test=".//xsd:extension[contains(@base,'macro.phraseSeq')]">
          <xsl:attribute name="mixed">true</xsl:attribute>
        </xsl:when>
        <xsl:when test=".//xsd:extension[contains(@base,'macro.paraContent')]">
          <xsl:attribute name="mixed">true</xsl:attribute>
        </xsl:when>
        <xsl:when test=".//xsd:extension[contains(@base,'macro.specialPara')]">
          <xsl:attribute name="mixed">true</xsl:attribute>
        </xsl:when>
      </xsl:choose>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
