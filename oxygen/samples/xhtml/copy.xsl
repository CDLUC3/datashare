<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml"/>
    <!-- Match document -->
    <xsl:template match="/">
        <xsl:apply-templates mode="copy" select="."/>
    </xsl:template>
    <!-- Deep copy template -->
    <xsl:template match="*|text()|@*" mode="copy">
        <xsl:copy>
            <xsl:apply-templates mode="copy" select="@*"/>
            <xsl:apply-templates mode="copy"/>
        </xsl:copy>
    </xsl:template>
    <!-- Handle default matching -->
    <xsl:template match="*"/>
</xsl:stylesheet>
