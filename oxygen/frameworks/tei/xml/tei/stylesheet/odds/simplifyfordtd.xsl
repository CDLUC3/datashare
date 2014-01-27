<?xml version="1.0" encoding="utf-8"?>
<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2008/10/15 14:46:30 $, $Revision: 1.8 $, $Author: sorin $

XSL stylesheet to process TEI documents using ODD markup

 
##LICENSE
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:s="http://www.ascc.net/xml/schematron" xmlns:exsl="http://exslt.org/common" xmlns:xsp="http://apache.org/xsp/core/v1" xmlns:xi="http://www.w3.org/2001/XInclude" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0" xmlns:f="http://axkit.org/NS/xsp/perform/v1" xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:rng="http://relaxng.org/ns/structure/1.0" extension-element-prefixes="exsl" exclude-result-prefixes="exsl rng a f tei s xs" version="1.0">
  <xsl:output indent="yes"/>
  <xsl:key name="Die" match="rng:define[rng:notAllowed and count(rng:*)=1]" use="@name"/>
  <xsl:key name="All" match="rng:define" use="@name"/>
  <xsl:key name="Refs" match="rng:ref" use="@name"/>
  <xsl:template match="*|@*|text()|comment()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="rng:ref">
    <xsl:if test="not(count(key('All',@name))=1 and key('Die',@name))">
      <xsl:copy>
        <xsl:apply-templates select="*|@*|text()|comment()"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="rng:define">
    <xsl:choose>
      <xsl:when test="key('Refs',@name)">
        <xsl:copy>
          <xsl:apply-templates select="*|@*|text()|comment()"/>
        </xsl:copy>
      </xsl:when>
    </xsl:choose>
  </xsl:template>
  <xsl:template match="rng:oneOrMore/rng:notAllowed">
    <xsl:if test="not(following-sibling::*)">
      <xsl:copy/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="rng:zeroOrMore/rng:notAllowed">
    <xsl:if test="not(following-sibling::*)">
      <xsl:copy/>
    </xsl:if>
  </xsl:template>
  <xsl:template match="rng:choice[count(rng:*)=0]">
    <rng:notAllowed/>
  </xsl:template>
  <xsl:template match="rng:define[count(rng:*)=0]">
    <xsl:copy>
      <xsl:copy-of select="@*"/>
      <rng:notAllowed/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="rng:group[count(rng:*)=0]"/>
  <xsl:template match="rng:define/rng:group[count(rng:*)=0]">
    <rng:notAllowed/>
  </xsl:template>
  <xsl:template match="rng:optional[count(rng:*)=0]"/>
  <xsl:template match="rng:zeroOrMore[count(rng:*)=0]"/>
  <xsl:template match="rng:oneOrMore[count(rng:*)=0]"/>
  <xsl:template match="rng:zeroOrMore[count(rng:*)=1 and rng:notAllowed]"/>
  <xsl:template match="rng:oneOrMore[count(rng:*)=1 and rng:notAllowed]"/>
  <xsl:template match="rng:choice[count(rng:*)=1 and rng:notAllowed]"/>
  <xsl:template match="rng:element[.//rng:anyName]">
    <rng:text/>
  </xsl:template>
</xsl:stylesheet>
