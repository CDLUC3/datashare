<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
   xmlns:xtf="http://cdlib.org/xtf"
   xmlns:saxon="http://saxon.sf.net/"
   exclude-result-prefixes="#all">
   
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
   <!-- Import Common Templates and Functions                                  -->
   <!-- ====================================================================== -->
   
   <xsl:import href="../common/preFilterCommon.xsl"/>
   
   <!-- ====================================================================== -->
   <!-- Output parameters                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:output method="xml" 
      indent="yes" 
      encoding="UTF-8"/>
   
   <!-- ====================================================================== -->
   <!-- Default: identity transformation                                       -->
   <!-- ====================================================================== -->
   
   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Root Template                                                          -->
   <!-- ====================================================================== -->
   
   <xsl:template match="/*">
      <xsl:copy>
         <xsl:namespace name="xtf" select="'http://cdlib.org/xtf'"/>
         <xsl:copy-of select="@*"/>
         <xsl:call-template name="get-meta"/>
         <xsl:apply-templates/>
      </xsl:copy>
   </xsl:template>
   
   <!-- ====================================================================== -->
   <!-- Metadata Indexing                                                      -->
   <!-- ====================================================================== -->
   
   <xsl:template name="get-meta">
      <!-- Access Dublin Core Record (if present) -->
      <xsl:variable name="dcMeta">
         <xsl:call-template name="get-dc-meta"/>
      </xsl:variable>
      
      <!-- Add display and sort fields to the data, and output the result. -->
      <xsl:call-template name="add-fields">
         <xsl:with-param name="display">
            <xsl:value-of select="if (contains(saxon:system-id(), '.dc.xml')) then 'dynaxml' else 'raw'"/>
         </xsl:with-param>
         <xsl:with-param name="meta" select="$dcMeta"/>
      </xsl:call-template>    
   </xsl:template>
   
</xsl:stylesheet>
