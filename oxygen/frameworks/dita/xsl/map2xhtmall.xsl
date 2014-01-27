<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"
    xmlns:saxon="http://icl.com/saxon"
    extension-element-prefixes="saxon">
    
    <xsl:import href="../DITA-OT/xsl/dita2xhtml.xsl"/>
    
    <xsl:output method="xml" encoding="UTF-8"
        indent="no"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"/>
    
    
    
    <!-- Match the MAP document. Copy it to the output
    to allow cascade processing of the MAP TOC, but
    also generate the X/HTML for the referred topics.-->
    <xsl:template match="/map">
        <!-- Copy -->        
        <xsl:apply-templates mode="oxy_copy" select="."/>
        <!-- Process the references -->
        <xsl:call-template name="processTopicrefs"/>
    </xsl:template>
    
    <!-- Deep copy template -->
    <xsl:template match="*|text()|@*|processing-instruction()|comment()" mode="oxy_copy">
        <xsl:copy>
            <!-- TODO - comment is not copied. -->
            <xsl:apply-templates mode="oxy_copy" select="@*"/>
            <xsl:apply-templates mode="oxy_copy"/>
        </xsl:copy>
    </xsl:template>
    

    <!--**************************************************
        For each topic reference, generates the HTML page.    
        ************************************************** -->
    <xsl:template name="processTopicrefs">
        <xsl:for-each select="//*[contains(@class, ' map/topicref ')][not(@toc='no')]">
            <!-- The name of the output file. -->
            <xsl:variable name="outputName" select="concat(substring-before(@href,'.xml'),'.html')"/>
            <!-- The full path of the output file. -->
            <xsl:variable name="outputPath" select="concat(concat($WORKDIR,'/'),$outputName)"/>            
            <saxon:output href="{$outputPath}">
                <xsl:apply-templates select="document(@href,/)"/>            
            </saxon:output>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
