<?xml version="1.0"?>
<!-- ********************************************************************** -->
<!--                                                                        -->
<!-- Routine to return the value of the ident= attributes of any            -->
<!-- <schemaSpec> elements in a TEI document.                               -->
<!--                                                                        -->
<!-- Input: an XML file, presumably an ODD file, i.e., one that's in the    -->
<!--        tei namespace and that uses the tagset for tagset documentation -->
<!--                                                                        -->
<!-- Output: a newline-separated list of the values of the ident=           -->
<!--         attribute of each <schemaSpec> element found.                  -->
<!--                                                                        -->
<!-- Used by the Roma shell script to ascertain the schema name             -->
<!--                                                                        -->
<!-- Written 2005-01-18 by Syd Bauman                                       -->
<!-- Copyright 2005 Brown University & TEI Consortium                        -->
<!-- Licence: GPL                                                                       -->
<!-- ********************************************************************** -->
<xsl:stylesheet version="1.0" xmlns:tei="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output encoding="utf8" method="text"/>
  <xsl:template match="/">
    <xsl:for-each select=".//tei:schemaSpec">
      <xsl:value-of select="@ident"/>
      <xsl:text>&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
