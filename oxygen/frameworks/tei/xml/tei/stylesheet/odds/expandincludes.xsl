<?xml version="1.0" encoding="utf-8"?>
<!-- 
Text Encoding Initiative Consortium XSLT stylesheet family
$Date: 2008/10/15 14:46:30 $, $Revision: 1.8 $, $Author: sorin $

XSL stylesheet to process TEI documents using ODD markup

 
##LICENSE
-->
<!-- separate bits by David Tolpin, combined by Sebastian Rahtz January 2004 


expandincludes.xsl

Take a Relax NG spec and simplify it to remove
rng:includes

-->
<xsl:stylesheet exclude-result-prefixes="exsl rng a f tei s cc dc rdf xs"
  extension-element-prefixes="exsl" version="1.0"
  xmlns:a="http://relaxng.org/ns/compatibility/annotations/1.0"
  xmlns:cc="http://web.resource.org/cc/" xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:exsl="http://exslt.org/common" xmlns:f="http://axkit.org/NS/xsp/perform/v1"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rng="http://relaxng.org/ns/structure/1.0" xmlns:s="http://www.ascc.net/xml/schematron"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xi="http://www.w3.org/2001/XInclude"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xsp="http://apache.org/xsp/core/v1">
  <xsl:param name="namespace"/>
  <xsl:output indent="yes"/>
  <xsl:template match="/">
    <xsl:variable name="step1">
      <xsl:apply-templates/>
    </xsl:variable>
    <!--
    <exsl:document href="temp.rng" method="xml" indent="yes">
    <xsl:copy-of select="$step1"/>
    </exsl:document>
  -->
    <xsl:apply-templates mode="stage2" select="exsl:node-set($step1)"/>
  </xsl:template>
  <xsl:template match="rng:include">
    <rng:div>
      <xsl:text>&#10;</xsl:text>
      <xsl:comment>include "<xsl:value-of select="@href"/>"</xsl:comment>
      <xsl:text>&#10;</xsl:text>
      <xsl:apply-templates select="*|@*[name()!='href']|text()|comment()"/>
      <rng:include>
        <xsl:for-each select="document(@href,.)/rng:grammar">
          <xsl:apply-templates select="*|@*|text()|comment()"/>
        </xsl:for-each>
      </rng:include>
    </rng:div>
  </xsl:template>
  <xsl:template match="rng:start" mode="stage2">
    <xsl:if test="not(preceding::rng:start)">
      <xsl:copy>
        <xsl:apply-templates mode="stage2"/>
      </xsl:copy>
    </xsl:if>
  </xsl:template>
  <xsl:template match="rng:include" mode="stage2">
    <rng:div>
      <xsl:apply-templates mode="stage2" select="*|@*|text()|comment()"/>
    </rng:div>
  </xsl:template>
  <xsl:template match="rng:define[not(@combine='choice')]" mode="stage2">
    <!-- can be overriden -->
    <!-- find if there is an overriding definition:
       two dimensional recursion - by ancestor::incelim,
       then by children of incelim, starting with 2 -->
    <xsl:call-template name="cp-unless-ovr">
      <xsl:with-param name="incelim" select="ancestor::rng:include[1]"/>
      <xsl:with-param name="define" select="."/>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="cp-unless-ovr">
    <xsl:param name="incelim"/>
    <xsl:param name="define"/>
    <xsl:choose>
      <xsl:when
        test="$incelim        and generate-id($define/ancestor::rng:grammar[1])        = generate-id($incelim/ancestor::rng:grammar[1])">
        <xsl:if
          test="not(        $incelim/preceding-sibling::*/descendant-or-self::rng:define[        @name=$define/@name        and generate-id(ancestor::rng:grammar[1])        = generate-id($incelim/ancestor::rng:grammar[1])])">
          <xsl:call-template name="cp-unless-ovr">
            <xsl:with-param name="incelim" select="$incelim/ancestor::rng:include[1]"/>
            <xsl:with-param name="define" select="$define"/>
          </xsl:call-template>
        </xsl:if>
      </xsl:when>
      <xsl:otherwise>
        <rng:define>
          <xsl:for-each select="$define">
            <xsl:apply-templates mode="stage2" select="*|@*|text()|comment()"/>
          </xsl:for-each>
        </rng:define>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- dull stuff, just copying -->
  <xsl:template match="*|@*|text()|comment()">
    <xsl:copy>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="*|@*|text()|comment()" mode="stage2">
    <xsl:copy>
      <xsl:apply-templates mode="stage2" select="*|@*|text()|comment()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="rng:grammar">
    <rng:grammar xmlns:xi="http://www.w3.org/2001/XInclude"
      xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xmlns:xsp="http://apache.org/xsp/core/v1">
      <xsl:if test="not($namespace='')">
        <xsl:attribute name="ns">
          <xsl:value-of select="ancestor::tei:schemaSpec/@namespace"/>
        </xsl:attribute>
      </xsl:if>
      <xsl:if test="not(@datatypeLibrary)">
        <xsl:attribute name="datatypeLibrary">
          <xsl:text>http://www.w3.org/2001/XMLSchema-datatypes</xsl:text>
        </xsl:attribute>
      </xsl:if>
      <xsl:apply-templates select="*|@*|text()|comment()"/>
    </rng:grammar>
  </xsl:template>
</xsl:stylesheet>
