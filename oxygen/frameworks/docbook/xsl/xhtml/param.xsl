<?xml version="1.0" encoding="UTF-8"?><!--This file was created automatically by html2xhtml--><!--from the HTML stylesheets.--><!-- This file is generated from param.xweb --><xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:d="http://docbook.org/ns/docbook" xmlns="http://www.w3.org/1999/xhtml" exclude-result-prefixes="d" version="1.0">

<!-- ********************************************************************
     $Id$
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://docbook.sf.net/release/xsl/current/ for
     copyright and other information.

     ******************************************************************** -->


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics.extension">
<refmeta xmlns="">
<refentrytitle>admon.graphics.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>admon.graphics.extension</refname>
<refpurpose>Filename extension for admonition graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the filename extension to use on admonition graphics.</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics.extension">.png</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics">
<refmeta xmlns="">
<refentrytitle>admon.graphics</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>admon.graphics</refname>
<refpurpose>Use graphics in admonitions?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true (non-zero), admonitions are presented in an alternate style that uses
a graphic.  Default graphics are provided in the distribution.
</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.graphics.path">
<refmeta xmlns="">
<refentrytitle>admon.graphics.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>admon.graphics.path</refname>
<refpurpose>Path to admonition graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the path to the directory containing the admonition graphics
(caution.png, important.png etc). This location is normally relative
to the output html directory. See <parameter>base.dir</parameter></para>

</refsection>
</doc:refentry>
<xsl:param name="admon.graphics.path">images/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.style">
<refmeta xmlns="">
<refentrytitle>admon.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>admon.style</refname>
<refpurpose>Specifies the CSS style attribute that should be added to
admonitions.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the value of the CSS <tag class="attribute">style</tag>
attribute that should be added to admonitions.
</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.style">
  <xsl:text>margin-left: 0.5in; margin-right: 0.5in;</xsl:text>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="admon.textlabel">
<refmeta xmlns="">
<refentrytitle>admon.textlabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>admon.textlabel</refname>
<refpurpose>Use text label in admonitions?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true (non-zero), admonitions are presented with a generated
text label such as Note or Warning in the appropriate language.
If zero, such labels are turned off, but any title child
of the admonition element are still output.
The default value is 1.
</para>

</refsection>
</doc:refentry>
<xsl:param name="admon.textlabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotate.toc">
<refmeta xmlns="">
<refentrytitle>annotate.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotate.toc</refname>
<refpurpose>Annotate the Table of Contents?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true, TOCs will be annotated. At present, this just means
that the <tag>RefPurpose</tag> of <tag>RefEntry</tag>
TOC entries will be displayed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="annotate.toc" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotation.css">
<refmeta xmlns="">
<refentrytitle>annotation.css</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotation.css</refname>
<refpurpose>CSS rules for annotations</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>annotation.support</parameter> is enabled and the
document contains <tag>annotation</tag>s, then the CSS in this
parameter will be included in the document.</para>

</refsection>
</doc:refentry>
<xsl:param name="annotation.css">
/* ======================================================================
   Annotations
*/

div.annotation-list  { visibility: hidden;
                     }

div.annotation-nocss { position: absolute;
                       visibility: hidden;
                     }

div.annotation-popup { position: absolute;
                       z-index: 4;
                       visibility: hidden;
                       padding: 0px;
                       margin: 2px;
                       border-style: solid;
                       border-width: 1px;
                       width: 200px;
		       background-color: white;
                     }

div.annotation-title { padding: 1px;
                       font-weight: bold;
                       border-bottom-style: solid;
                       border-bottom-width: 1px;
		       color: white;
		       background-color: black;
                     }

div.annotation-body  { padding: 2px;
                     }

div.annotation-body p { margin-top: 0px;
                        padding-top: 0px;
                      }

div.annotation-close { position: absolute;
                       top: 2px;
                       right: 2px;
                     }
</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotation.js">
<refmeta xmlns="">
<refentrytitle>annotation.js</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotation.js</refname>
<refpurpose>URIs identifying JavaScript files with support for annotation popups</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <property>annotation.support</property> is enabled and the
document contains <tag>annotation</tag>s, then the URIs listed
in this parameter will be included. These JavaScript files are required
for popup annotation support.</para>

</refsection>
</doc:refentry>
<xsl:param name="annotation.js">
<xsl:text>http://docbook.sourceforge.net/release/script/AnchorPosition.js http://docbook.sourceforge.net/release/script/PopupWindow.js</xsl:text></xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotation.graphic.open">
<refmeta xmlns="">
<refentrytitle>annotation.graphic.open</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotation.graphic.open</refname>
<refpurpose>Image for identifying a link that opens an annotation popup</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This image is used inline to identify the location of
annotations. It may be replaced by a user provided graphic. The size should be approximately 10x10 pixels.</para>

</refsection>
</doc:refentry>
<xsl:param name="annotation.graphic.open">http://docbook.sourceforge.net/release/images/annot-open.png</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotation.graphic.close">
<refmeta xmlns="">
<refentrytitle>annotation.graphic.close</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotation.graphic.close</refname>
<refpurpose>Image for identifying a link that closes an annotation popup</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This image is used on popup annotations as the “x” that the
user can click to dismiss the popup.</para>
<para>This image is used on popup annotations as the “x” that the user can
click to dismiss the popup. It may be replaced by a user provided graphic. The size should be approximately 10x10 pixels.</para>

</refsection>
</doc:refentry>
<xsl:param name="annotation.graphic.close">
http://docbook.sourceforge.net/release/images/annot-close.png</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="annotation.support">
<refmeta xmlns="">
<refentrytitle>annotation.support</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>annotation.support</refname>
<refpurpose>Enable annotations?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the stylesheets will attempt to support annotation
elements in HTML by including some JavaScript (see
<parameter>annotation.js</parameter>).</para>

</refsection>
</doc:refentry>
<xsl:param name="annotation.support" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="appendix.autolabel">
<refmeta xmlns="">
<refentrytitle>appendix.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>appendix.autolabel</refname>
<refpurpose>Specifies the labeling format for Appendix titles</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, then appendices will be numbered using the
parameter value as the number format if the value matches one of the
following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (upperalpha).
</para>

</refsection>
</doc:refentry>
<xsl:param name="appendix.autolabel">A</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="author.othername.in.middle">
<refmeta xmlns="">
<refentrytitle>author.othername.in.middle</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>author.othername.in.middle</refname>
<refpurpose>Is <tag>othername</tag> in <tag>author</tag> a
middle name?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the <tag>othername</tag> of an <tag>author</tag>
appears between the <tag>firstname</tag> and
<tag>surname</tag>.  Otherwise, <tag>othername</tag>
is suppressed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="author.othername.in.middle" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="autotoc.label.separator">
<refmeta xmlns="">
<refentrytitle>autotoc.label.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>autotoc.label.separator</refname>
<refpurpose>Separator between labels and titles in the ToC</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>String used to separate labels and titles in a table of contents.</para>

</refsection>
</doc:refentry>
<xsl:param name="autotoc.label.separator">. </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="autotoc.label.in.hyperlink">
<refmeta xmlns="">
<refentrytitle>autotoc.label.in.hyperlink</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>autotoc.label.in.hyperlink</refname>
<refpurpose>Include label in hyperlinked titles in TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If the value of
<parameter>autotoc.label.in.hyperlink</parameter> is non-zero, labels
are included in hyperlinked titles in the TOC. If it is instead zero,
labels are still displayed prior to the hyperlinked titles, but
are not hyperlinked along with the titles.</para>

</refsection>
</doc:refentry>
<xsl:param name="autotoc.label.in.hyperlink" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="base.dir">
<refmeta xmlns="">
<refentrytitle>base.dir</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>base.dir</refname>
<refpurpose>The base directory of chunks</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If specified, the <parameter>base.dir</parameter> identifies
the output directory for chunks. (If not specified, the output directory
is system dependent.)</para>

</refsection>
</doc:refentry>
<xsl:param name="base.dir"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="biblioentry.item.separator">
<refmeta xmlns="">
<refentrytitle>biblioentry.item.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>biblioentry.item.separator</refname>
<refpurpose>Text to separate bibliography entries</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Text to separate bibliography entries
</para>

</refsection>
</doc:refentry>
<xsl:param name="biblioentry.item.separator">. </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.collection">
<refmeta xmlns="">
<refentrytitle>bibliography.collection</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>bibliography.collection</refname>
<refpurpose>Name of the bibliography collection file</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Maintaining bibliography entries across a set of documents is tedious, time
consuming, and error prone. It makes much more sense, usually, to store all of
the bibliography entries in a single place and simply <quote>extract</quote>
the ones you need in each document.</para>

<para>That's the purpose of the
<parameter>bibliography.collection</parameter> parameter. To setup a global
bibliography <quote>database</quote>, follow these steps:</para>

<para>First, create a stand-alone bibliography document that contains all of
the documents that you wish to reference. Make sure that each bibliography
entry (whether you use <tag>biblioentry</tag> or <tag>bibliomixed</tag>)
has an ID.</para>

<para>My global bibliography, <filename>~/bibliography.xml</filename> begins
like this:</para>

<informalexample>
<programlisting>&lt;!DOCTYPE bibliography
  PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
  "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"&gt;
&lt;bibliography&gt;&lt;title&gt;References&lt;/title&gt;

&lt;bibliomixed id="xml-rec"&gt;&lt;abbrev&gt;XML 1.0&lt;/abbrev&gt;Tim Bray,
Jean Paoli, C. M. Sperberg-McQueen, and Eve Maler, editors.
&lt;citetitle&gt;&lt;ulink url="http://www.w3.org/TR/REC-xml"&gt;Extensible Markup
Language (XML) 1.0 Second Edition&lt;/ulink&gt;&lt;/citetitle&gt;.
World Wide Web Consortium, 2000.
&lt;/bibliomixed&gt;

&lt;bibliomixed id="xml-names"&gt;&lt;abbrev&gt;Namespaces&lt;/abbrev&gt;Tim Bray,
Dave Hollander,
and Andrew Layman, editors.
&lt;citetitle&gt;&lt;ulink url="http://www.w3.org/TR/REC-xml-names/"&gt;Namespaces in
XML&lt;/ulink&gt;&lt;/citetitle&gt;.
World Wide Web Consortium, 1999.
&lt;/bibliomixed&gt;

&lt;!-- ... --&gt;
&lt;/bibliography&gt;
</programlisting>
</informalexample>

<para>When you create a bibliography in your document, simply
provide <emphasis>empty</emphasis> <tag>bibliomixed</tag>
entries for each document that you wish to cite. Make sure that these
elements have the same ID as the corresponding <quote>real</quote>
entry in your global bibliography.</para>

<para>For example:</para>

<informalexample>
<programlisting>&lt;bibliography&gt;&lt;title&gt;Bibliography&lt;/title&gt;

&lt;bibliomixed id="xml-rec"/&gt;
&lt;bibliomixed id="xml-names"/&gt;
&lt;bibliomixed id="DKnuth86"&gt;Donald E. Knuth. &lt;citetitle&gt;Computers and
Typesetting: Volume B, TeX: The Program&lt;/citetitle&gt;. Addison-Wesley,
1986.  ISBN 0-201-13437-3.
&lt;/bibliomixed&gt;
&lt;bibliomixed id="relaxng"/&gt;

&lt;/bibliography&gt;</programlisting>
</informalexample>

<para>Note that it's perfectly acceptable to mix entries from your
global bibliography with <quote>normal</quote> entries. You can use
<tag>xref</tag> or other elements to cross-reference your
bibliography entries in exactly the same way you do now.</para>

<para>Finally, when you are ready to format your document, simply set the
<parameter>bibliography.collection</parameter> parameter (in either a
customization layer or directly through your processor's interface) to
point to your global bibliography.</para>

<para>The stylesheets will format the bibliography in your document as if
all of the entries referenced appeared there literally.</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.collection">http://docbook.sourceforge.net/release/bibliography/bibliography.xml</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.numbered">
<refmeta xmlns="">
<refentrytitle>bibliography.numbered</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>bibliography.numbered</refname>
<refpurpose>Should bibliography entries be numbered?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero bibliography entries will be numbered</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.numbered" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bibliography.style">
<refmeta xmlns="">
<refentrytitle>bibliography.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">normal</refmiscinfo>
<refmiscinfo class="other" otherclass="value">iso690</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>bibliography.style</refname>
<refpurpose>Style used for formatting of biblioentries.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Currently only <literal>normal</literal> and
<literal>iso690</literal> styles are supported.</para>

<para>In order to use ISO690 style to the full extent you might need
to use additional markup described on <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://wiki.docbook.org/topic/ISO690Bibliography">the
following WiKi page</link>.</para>

</refsection>
</doc:refentry>
<xsl:param name="bibliography.style">normal</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="blurb.on.titlepage.enabled">
<refmeta xmlns="">
<refentrytitle>blurb.on.titlepage.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>blurb.on.titlepage.enabled</refname>
<refpurpose>Display personblurb and authorblurb on title pages?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, output from <tag>authorblurb</tag> and
<tag>personblurb</tag> elements is displayed on title pages. If zero
(the default), output from those elements is suppressed on title pages
(unless you are using a <literal>titlepage</literal> customization
that causes them to be included).</para>

</refsection>
</doc:refentry>
<xsl:param name="blurb.on.titlepage.enabled" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="bridgehead.in.toc">
<refmeta xmlns="">
<refentrytitle>bridgehead.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>bridgehead.in.toc</refname>
<refpurpose>Should bridgehead elements appear in the TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, <tag>bridgehead</tag>s appear in the TOC. Note that
this option is not fully supported and may be removed in a future
version of the stylesheets.
</para>

</refsection>
</doc:refentry>
<xsl:param name="bridgehead.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.defaultcolumn">
<refmeta xmlns="">
<refentrytitle>callout.defaultcolumn</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.defaultcolumn</refname>
<refpurpose>Indicates what column callouts appear in by default</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If a callout does not identify a column (for example, if it uses
the <literal>linerange</literal> <tag class="attribute">unit</tag>),
it will appear in the default column.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.defaultcolumn">60</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.extension">
<refmeta xmlns="">
<refentrytitle>callout.graphics.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.graphics.extension</refname>
<refpurpose>Filename extension for callout graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>
<para>Sets the filename extension to use on callout graphics. </para>

<itemizedlist>
<para>The Docbook XSL distribution provides callout graphics in the following formats:</para>
<listitem><para>SVG (extension: <filename class="extension">.svg</filename>)</para></listitem>
<listitem><para>PNG (extension: <filename class="extension">.png</filename>)</para></listitem>
<listitem><para>GIF (extension: <filename class="extension">.gif</filename>)</para></listitem>
</itemizedlist>
</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.extension">.png</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics">
<refmeta xmlns="">
<refentrytitle>callout.graphics</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.graphics</refname>
<refpurpose>Use graphics for callouts?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, callouts are presented with graphics (e.g., reverse-video
circled numbers instead of "(1)", "(2)", etc.).
Default graphics are provided in the distribution.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.number.limit">
<refmeta xmlns="">
<refentrytitle>callout.graphics.number.limit</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.graphics.number.limit</refname>
<refpurpose>Number of the largest callout graphic</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>callout.graphics</parameter> is non-zero, graphics
are used to represent callout numbers instead of plain text. The value
of <parameter>callout.graphics.number.limit</parameter> is the largest
number for which a graphic exists. If the callout number exceeds this
limit, the default presentation "(plain text instead of a graphic)"
will  be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.number.limit">15</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.graphics.path">
<refmeta xmlns="">
<refentrytitle>callout.graphics.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.graphics.path</refname>
<refpurpose>Path to callout graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the path to the directory holding the callout graphics. his
location is normally relative to the output html directory. see
base.dir. Always terminate the directory with / since the graphic file
is appended to this string, hence needs the separator.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.graphics.path">images/callouts/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.list.table">
<refmeta xmlns="">
<refentrytitle>callout.list.table</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.list.table</refname>
<refpurpose>Present callout lists using a table?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The default presentation of <tag>CalloutList</tag>s uses
an HTML <tag>DL</tag>. Some browsers don't align DLs very well
if <parameter>callout.graphics</parameter> are used. With this option
turned on, <tag>CalloutList</tag>s are presented in an HTML
<tag>TABLE</tag>, which usually results in better alignment
of the callout number with the callout description.</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.list.table" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode">
<refmeta xmlns="">
<refentrytitle>callout.unicode</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.unicode</refname>
<refpurpose>Use Unicode characters rather than images for callouts.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The stylesheets can use either an image of the numbers one to ten, or the single Unicode character which represents the numeral, in white on a black background. Use this to select the Unicode character option.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode.number.limit">
<refmeta xmlns="">
<refentrytitle>callout.unicode.number.limit</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.unicode.number.limit</refname>
<refpurpose>Number of the largest unicode callout character</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>callout.unicode</parameter>
is non-zero, unicode characters are used to represent
callout numbers. The value of
<parameter>callout.unicode.number.limit</parameter>
is
the largest number for which a unicode character exists. If the callout number
exceeds this limit, the default presentation "(nnn)" will always
be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode.number.limit">10</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callout.unicode.start.character">
<refmeta xmlns="">
<refentrytitle>callout.unicode.start.character</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callout.unicode.start.character</refname>
<refpurpose>First Unicode character to use, decimal value.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>callout.graphics</parameter> is zero and <parameter>callout.unicode</parameter>
is non-zero, unicode characters are used to represent
callout numbers. The value of
<parameter>callout.unicode.start.character</parameter>
is the decimal unicode value used for callout number one. Currently, 
only 10102 is supported in the stylesheets for this parameter. 
</para>

</refsection>
</doc:refentry>
<xsl:param name="callout.unicode.start.character">10102</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="callouts.extension">
<refmeta xmlns="">
<refentrytitle>callouts.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>callouts.extension</refname>
<refpurpose>Enable the callout extension</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The callouts extension processes <tag>areaset</tag>
elements in <tag>ProgramListingCO</tag> and other text-based
callout elements.
</para>

</refsection>
</doc:refentry>
<xsl:param name="callouts.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chapter.autolabel">
<refmeta xmlns="">
<refentrytitle>chapter.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chapter.autolabel</refname>
<refpurpose>Specifies the labeling format for Chapter titles</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, then chapters will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (arabic).
</para>

</refsection>
</doc:refentry>
<xsl:param name="chapter.autolabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.append">
<refmeta xmlns="">
<refentrytitle>chunk.append</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.append</refname>
<refpurpose>Specifies content to append to chunked HTML output</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies content to append to the end of HTML files output by
the <filename>html/chunk.xsl</filename> stylesheet, after the closing
<code>&lt;html&gt;</code> tag. You probably don’t want to set any value
for this parameter; but if you do, the only value it should ever be
set to is a newline character: <code>&amp;#x0a;</code> or
<code>&amp;#10;</code></para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.append"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.first.sections">
<refmeta xmlns="">
<refentrytitle>chunk.first.sections</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.first.sections</refname>
<refpurpose>Chunk the first top-level section?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a chunk will be created for the first top-level
<tag>sect1</tag> or <tag>section</tag> elements in
each component. Otherwise, that section will be part of the chunk for
its parent.
</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.first.sections" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.quietly">
<refmeta xmlns="">
<refentrytitle>chunk.quietly</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.quietly</refname>
<refpurpose>Omit the chunked filename messages.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If zero (the default), the XSL processor emits a message naming
each separate chunk filename as it is being output.
If nonzero, then the messages are suppressed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.quietly" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.section.depth">
<refmeta xmlns="">
<refentrytitle>chunk.section.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.section.depth</refname>
<refpurpose>Depth to which sections should be chunked</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter sets the depth of section chunking.</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.section.depth" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.toc">
<refmeta xmlns="">
<refentrytitle>chunk.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.toc</refname>
<refpurpose>An explicit TOC to be used for chunking</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>chunk.toc</parameter> identifies an explicit TOC that
will be used for chunking. This parameter is only used by the
<filename>chunktoc.xsl</filename> stylesheet (and customization layers built
from it).</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.toc"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.tocs.and.lots">
<refmeta xmlns="">
<refentrytitle>chunk.tocs.and.lots</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.tocs.and.lots</refname>
<refpurpose>Should ToC and LoTs be in separate chunks?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, ToC and LoT (List of Examples, List of Figures, etc.)
will be put in a separate chunk. At the moment, this chunk is not in the
normal forward/backward navigation list. Instead, a new link is added to the
navigation footer.</para>

<para>This feature is still somewhat experimental. Feedback welcome.</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.tocs.and.lots" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.tocs.and.lots.has.title">
<refmeta xmlns="">
<refentrytitle>chunk.tocs.and.lots.has.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.tocs.and.lots.has.title</refname>
<refpurpose>Should ToC and LoTs in a separate chunks have title?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero title of document is shown before ToC/LoT in
separate chunk.</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.tocs.and.lots.has.title" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="chunk.separate.lots">
<refmeta xmlns="">
<refentrytitle>chunk.separate.lots</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>chunk.separate.lots</refname>
<refpurpose>Should each LoT be in its own separate chunk?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, each of the ToC and LoTs
(List of Examples, List of Figures, etc.)
will be put in its own separate chunk.
The title page includes generated links to each of the separate files.
</para>
<para>
This feature depends on the
<literal>chunk.tocs.and.lots</literal>
parameter also being non-zero. 
</para>

</refsection>
</doc:refentry>
<xsl:param name="chunk.separate.lots" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="citerefentry.link">
<refmeta xmlns="">
<refentrytitle>citerefentry.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>citerefentry.link</refname>
<refpurpose>Generate URL links when cross-referencing RefEntrys?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a web link will be generated, presumably
to an online man-&gt;HTML gateway. The text of the link is
generated by the <literal>generate.citerefentry.link</literal> template.
</para>

</refsection>
</doc:refentry>
<xsl:param name="citerefentry.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="collect.xref.targets"> 
<refmeta xmlns=""> 
<refentrytitle>collect.xref.targets</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">only</refmiscinfo>
</refmeta> 
<refnamediv xmlns=""> 
<refname>collect.xref.targets</refname> 
<refpurpose>Controls whether cross reference data is
collected</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 
<para>
In order to resolve olinks efficiently, the stylesheets can
generate an external data file containing information about
all potential cross reference endpoints in a document.
This parameter determines whether the collection process is run when the document is processed by the stylesheet. The default value is  <literal>no</literal>, which means the data file is not generated during processing. The other choices are <literal>yes</literal>, which means the data file is created and the document is processed for output, and <literal>only</literal>, which means the data file is created but the document is not processed for output.
See also <parameter>targets.filename</parameter>.
</para> 
</refsection> 
</doc:refentry>
<xsl:param name="collect.xref.targets">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="component.label.includes.part.label">
<refmeta xmlns="">
<refentrytitle>component.label.includes.part.label</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>component.label.includes.part.label</refname>
<refpurpose>Do component labels include the part label?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, number labels for <tag>chapter</tag>,
<tag>appendix</tag>, and other component elements are prefixed with
the label of the part element that contains them.  So you might see
Chapter II.3 instead of Chapter 3.  Also, the labels for formal
elements such as <tag>table</tag> and <tag>figure</tag> will include
the part label.  If there is no part element container, then no prefix
is generated.
</para>
<para>
This feature is most useful when the
<parameter>label.from.part</parameter> parameter is turned on.
In that case, there would be more than one <tag>chapter</tag>
<quote>1</quote>, and the extra part label prefix will identify
each chapter unambiguously.
</para>

</refsection>
</doc:refentry>
<xsl:param name="component.label.includes.part.label" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="contrib.inline.enabled">
<refmeta xmlns="">
<refentrytitle>contrib.inline.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>contrib.inline.enabled</refname>
<refpurpose>Display contrib output inline?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero (the default), output of the <tag>contrib</tag> element is
displayed as inline content rather than as block content.</para>

</refsection>
</doc:refentry>
<xsl:param name="contrib.inline.enabled">1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="css.decoration">
<refmeta xmlns="">
<refentrytitle>css.decoration</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>css.decoration</refname>
<refpurpose>Enable CSS decoration of elements</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If non-zero, then html elements produced by the stylesheet may be
decorated with <literal>style</literal> attributes.  For example, the
<literal>li</literal> tags produced for list items may include a
fragment of CSS in the <literal>style</literal> attribute which sets
the CSS property "list-style-type".
</para>

</refsection>
</doc:refentry>
<xsl:param name="css.decoration" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="current.docid"> 
<refmeta xmlns=""> 
<refentrytitle>current.docid</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>current.docid</refname> 
<refpurpose>targetdoc identifier for the document being
processed</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 
<para>When olinks between documents are resolved for HTML output, the stylesheet can compute the relative path between the current document and the target document. The stylesheet needs to know the <literal>targetdoc</literal> identifiers for both documents, as they appear in the <parameter>target.database.document</parameter> database file. This parameter passes to the stylesheet
the targetdoc identifier of the current document, since that
identifier does not appear in the document itself. </para>
<para>This parameter can also be used for print output. If an olink's  <literal>targetdoc</literal>  id differs from the <literal>current.docid</literal>, then the stylesheet can append the target document's title to the generated olink text. That identifies to the reader that the link is to a different document, not the current document. See also <parameter>olink.doctitle</parameter> to enable that feature.</para> 
</refsection> 
</doc:refentry>
<xsl:param name="current.docid"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.float.class">
<refmeta xmlns="">
<refentrytitle>default.float.class</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>default.float.class</refname>
<refpurpose>Specifies the default float class</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Selects the direction in which a float should be placed. for
xsl-fo this is before, for html it is left. For Western texts, the
before direction is the top of the page.</para>

</refsection>
</doc:refentry>
<xsl:param name="default.float.class">
  <xsl:choose>
    <xsl:when test="contains($stylesheet.result.type,'html')">left</xsl:when>
    <xsl:otherwise>before</xsl:otherwise>
  </xsl:choose>
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.image.width">
<refmeta xmlns="">
<refentrytitle>default.image.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>default.image.width</refname>
<refpurpose>The default width of images</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If specified, this value will be used for the
<tag class="attribute">width</tag> attribute on
images that do not specify any
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://docbook.org/tdg/en/html/imagedata.html#viewport.area">viewport
dimensions</link>.</para>

</refsection>
</doc:refentry>
<xsl:param name="default.image.width"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.table.width">
<refmeta xmlns="">
<refentrytitle>default.table.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>default.table.width</refname>
<refpurpose>The default width of tables</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, this value will be used for the
<literal>width</literal> attribute on <tag>table</tag>s that do not specify an
alternate width (with the <tag class="xmlpi">dbhtml table-width</tag> or 
<tag class="xmlpi">dbfo table-width</tag> processing instruction).</para>
</refsection>
</doc:refentry>
<xsl:param name="default.table.width"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="default.table.frame">
<refmeta xmlns="">
<refentrytitle>default.table.frame</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>default.table.frame</refname>
<refpurpose>The default framing of tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This value will be used when there is no frame attribute on the
table. </para>

</refsection>
</doc:refentry>
<xsl:param name="default.table.frame">all</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="draft.mode">
<refmeta xmlns="">
<refentrytitle>draft.mode</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">no</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>draft.mode</refname>
<refpurpose>Select draft mode</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Selects draft mode. If <parameter>draft.mode</parameter> is
<quote><literal>yes</literal></quote>, the entire document will be treated
as a draft. If it is <quote><literal>no</literal></quote>, the entire document
will be treated as a final copy. If it is <quote><literal>maybe</literal></quote>,
individual sections will be treated as draft or final independently, depending
on how their <literal>status</literal> attribute is set.
</para>

</refsection>
</doc:refentry>
<xsl:param name="draft.mode">maybe</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="draft.watermark.image">
<refmeta xmlns="">
<refentrytitle>draft.watermark.image</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>draft.watermark.image</refname>
<refpurpose>The URI of the image to be used for draft watermarks</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The image to be used for draft watermarks.</para>

</refsection>
</doc:refentry>
<xsl:param name="draft.watermark.image">http://docbook.sourceforge.net/release/images/draft.png</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.table.bgcolor">
<refmeta xmlns="">
<refentrytitle>ebnf.table.bgcolor</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">color</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ebnf.table.bgcolor</refname>
<refpurpose>Background color for EBNF tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the background color for EBNF tables (a pale brown). No
<tag>bgcolor</tag> attribute is output if
<parameter>ebnf.table.bgcolor</parameter> is set to the null string. </para>


</refsection>
</doc:refentry>
<xsl:param name="ebnf.table.bgcolor">#F5DCB3</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.table.border">
<refmeta xmlns="">
<refentrytitle>ebnf.table.border</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ebnf.table.border</refname>
<refpurpose>Selects border on EBNF tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Selects the border on EBNF tables. If non-zero, the tables have
borders, otherwise they don't.</para>

</refsection>
</doc:refentry>
<xsl:param name="ebnf.table.border" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.assignment">
<refmeta xmlns="">
<refentrytitle>ebnf.assignment</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">rtf</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ebnf.assignment</refname>
<refpurpose>The EBNF production assignment operator</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>ebnf.assignment</parameter> parameter determines what
text is used to show <quote>assignment</quote> in <tag>production</tag>s
in <tag>productionset</tag>s.</para>

<para>While <quote><literal>::=</literal></quote> is common, so are several
other operators.</para>

</refsection>
</doc:refentry>
<xsl:param name="ebnf.assignment">
<code>::=</code>
</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ebnf.statement.terminator">
<refmeta xmlns="">
<refentrytitle>ebnf.statement.terminator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">rtf</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ebnf.statement.terminator</refname>
<refpurpose>Punctuation that ends an EBNF statement.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>ebnf.statement.terminator</parameter> parameter determines what
text is used to terminate each <tag>production</tag>
in <tag>productionset</tag>.</para>

<para>Some notations end each statement with a period.</para>

</refsection>
</doc:refentry>
<xsl:param name="ebnf.statement.terminator"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="eclipse.autolabel">
<refmeta xmlns="">
<refentrytitle>eclipse.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>eclipse.autolabel</refname>
<refpurpose>Should tree-like ToC use autonumbering feature?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want to include chapter and section numbers into ToC in
the left panel, set this parameter to 1.</para>

</refsection>
</doc:refentry>
<xsl:param name="eclipse.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="eclipse.plugin.name">
<refmeta xmlns="">
<refentrytitle>eclipse.plugin.name</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>eclipse.plugin.name</refname>
<refpurpose>Eclipse Help plugin name</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Eclipse Help plugin name.</para>

</refsection>
</doc:refentry>
<xsl:param name="eclipse.plugin.name">DocBook Online Help Sample</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="eclipse.plugin.id">
<refmeta xmlns="">
<refentrytitle>eclipse.plugin.id</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>eclipse.plugin.id</refname>
<refpurpose>Eclipse Help plugin id</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Eclipse Help plugin id. You should change this id to something
unique for each help.</para>

</refsection>
</doc:refentry>
<xsl:param name="eclipse.plugin.id">com.example.help</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="eclipse.plugin.provider">
<refmeta xmlns="">
<refentrytitle>eclipse.plugin.provider</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>eclipse.plugin.provider</refname>
<refpurpose>Eclipse Help plugin provider name</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Eclipse Help plugin provider name.</para>

</refsection>
</doc:refentry>
<xsl:param name="eclipse.plugin.provider">Example provider</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="editedby.enabled">
<refmeta xmlns="">
<refentrytitle>editedby.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>editedby.enabled</refname>
<refpurpose>Display “Edited by” heading above editor name?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a localized <emphasis role="bold">Edited
by</emphasis> heading is displayed above editor names in output of the
<tag>editor</tag> element.</para>

</refsection>
</doc:refentry>
<xsl:param name="editedby.enabled">1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="email.delimiters.enabled">
<refmeta xmlns="">
<refentrytitle>email.delimiters.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>email.delimiters.enabled</refname>
<refpurpose>Generate delimiters around email addresses?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, delimiters

<footnote><para>For delimiters, the
stylesheets are currently hard-coded to output angle
brackets.</para></footnote> 

are generated around e-mail addresses
(the output of the <tag>email</tag> element).</para>

</refsection>
</doc:refentry>
<xsl:param name="email.delimiters.enabled" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="emphasis.propagates.style">
<refmeta xmlns="">
<refentrytitle>emphasis.propagates.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>emphasis.propagates.style</refname>
<refpurpose>Pass emphasis role attribute through to HTML?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, the <literal>role</literal> attribute of
<tag>emphasis</tag> elements will be passed through to the HTML as a
class attribute on a <literal>span</literal> that surrounds the
emphasis.</para>
</refsection>
</doc:refentry>
<xsl:param name="emphasis.propagates.style" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="entry.propagates.style">
<refmeta xmlns="">
<refentrytitle>entry.propagates.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>entry.propagates.style</refname>
<refpurpose>Pass entry role attribute through to HTML?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true, the role attribute of <tag>entry</tag> elements
will be passed through to the HTML as a class attribute on the
<tag>td</tag> or <tag>th</tag> generated for the table
cell.</para>

</refsection>
</doc:refentry>
<xsl:param name="entry.propagates.style" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="firstterm.only.link">
<refmeta xmlns="">
<refentrytitle>firstterm.only.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>firstterm.only.link</refname>
<refpurpose>Does automatic glossterm linking only apply to firstterms?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, only <tag>firstterm</tag>s will be automatically linked
to the glossary. If glossary linking is not enabled, this parameter
has no effect.</para>

</refsection>
</doc:refentry>
<xsl:param name="firstterm.only.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footer.rule">
<refmeta xmlns="">
<refentrytitle>footer.rule</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>footer.rule</refname>
<refpurpose>Rule over footers?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a rule will be drawn above the page footers.</para>

</refsection>
</doc:refentry>
<xsl:param name="footer.rule" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.number.format">
<refmeta xmlns="">
<refentrytitle>footnote.number.format</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>footnote.number.format</refname>
<refpurpose>Identifies the format used for footnote numbers</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>footnote.number.format</parameter> specifies the format
to use for footnote numeration (1, i, I, a, or A).</para>

</refsection>
</doc:refentry>
<xsl:param name="footnote.number.format">1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="footnote.number.symbols">
<refmeta xmlns="">
<refentrytitle>footnote.number.symbols</refentrytitle>
<refmiscinfo class="other" otherclass="datatype"/>
</refmeta>
<refnamediv xmlns="">
<refname>footnote.number.symbols</refname>
<refpurpose>Special characters to use as footnote markers</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>footnote.number.symbols</parameter> is not the empty string,
footnotes will use the characters it contains as footnote symbols. For example,
<quote>*&amp;#x2020;&amp;#x2021;&amp;#x25CA;&amp;#x2720;</quote> will identify
footnotes with <quote>*</quote>, <quote>†</quote>, <quote>‡</quote>,
<quote>◊</quote>, and <quote>✠</quote>. If there are more footnotes
than symbols, the stylesheets will fall back to numbered footnotes using
<parameter>footnote.number.format</parameter>.</para>

<para>The use of symbols for footnotes depends on the ability of your
processor (or browser) to render the symbols you select. Not all systems are
capable of displaying the full range of Unicode characters. If the quoted characters
in the preceding paragraph are not displayed properly, that's a good indicator
that you may have trouble using those symbols for footnotes.</para>

</refsection>
</doc:refentry>
<xsl:param name="footnote.number.symbols"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.procedures">
<refmeta xmlns="">
<refentrytitle>formal.procedures</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>formal.procedures</refname>
<refpurpose>Selects formal or informal procedures</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Formal procedures are numbered and always have a title.
</para>

</refsection>
</doc:refentry>
<xsl:param name="formal.procedures" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="formal.title.placement">
<refmeta xmlns="">
<refentrytitle>formal.title.placement</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">table</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>formal.title.placement</refname>
<refpurpose>Specifies where formal object titles should occur</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies where formal object titles should occur. For each formal object
type (<tag>figure</tag>,
<tag>example</tag>,
<tag>equation</tag>,
<tag>table</tag>, and <tag>procedure</tag>)
you can specify either the keyword
<quote><literal>before</literal></quote> or
<quote><literal>after</literal></quote>.</para>

</refsection>
</doc:refentry>
<xsl:param name="formal.title.placement">
figure before
example before
equation before
table before
procedure before
task before
</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="funcsynopsis.decoration">
<refmeta xmlns="">
<refentrytitle>funcsynopsis.decoration</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>funcsynopsis.decoration</refname>
<refpurpose>Decorate elements of a <tag>funcsynopsis</tag>?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, elements of the <tag>funcsynopsis</tag> will be
decorated (e.g. rendered as bold or italic text). The decoration is controlled by
templates that can be redefined in a customization layer.
</para>

</refsection>
</doc:refentry>
<xsl:param name="funcsynopsis.decoration" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="funcsynopsis.style">
<refmeta xmlns="">
<refentrytitle>funcsynopsis.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">ansi</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kr</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>funcsynopsis.style</refname>
<refpurpose>What style of <tag>funcsynopsis</tag> should be generated?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>funcsynopsis.style</parameter> is <literal>ansi</literal>,
ANSI-style function synopses are generated for a
<tag>funcsynopsis</tag>, otherwise K&amp;R-style
function synopses are generated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="funcsynopsis.style">kr</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="function.parens">
<refmeta xmlns="">
<refentrytitle>function.parens</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>function.parens</refname>
<refpurpose>Generate parens after a function?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the formatting of a <tag>function</tag> element
will include generated parentheses.
</para>

</refsection>
</doc:refentry>
<xsl:param name="function.parens" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.id.attributes">
<refmeta xmlns="">
<refentrytitle>generate.id.attributes</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.id.attributes</refname>
<refpurpose>Generate ID attributes on container elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the HTML stylesheet will generate ID attributes on
containers. For example, the markup:</para>

<screen>&lt;section id="foo"&gt;&lt;title&gt;Some Title&lt;/title&gt;
&lt;para&gt;Some para.&lt;/para&gt;
&lt;/section&gt;</screen>

<para>might produce:</para>

<screen>&lt;div class="section" id="foo"&gt;
&lt;h2&gt;Some Title&lt;/h2&gt;
&lt;p&gt;Some para.&lt;/p&gt;
&lt;/div&gt;</screen>

<para>The alternative is to generate anchors:</para>

<screen>&lt;div class="section"&gt;
&lt;h2&gt;&lt;a name="foo"&gt;&lt;/a&gt;Some Title&lt;/h2&gt;
&lt;p&gt;Some para.&lt;/p&gt;
&lt;/div&gt;</screen>

<para>Because the <tag class="attribute">name</tag> attribute of
the <tag>a</tag> element and the <tag class="attribute">id</tag>
attribute of other tags are both of type <quote>ID</quote>, producing both
generates invalid documents.</para>

<para>As of version 1.50, you can use this switch to control which type of
identifier is generated. For backwards-compatibility, generating
<tag>a</tag> anchors is preferred.</para>

<para>Note: at present, this switch is incompletely implemented.
Disabling ID attributes will suppress them, but enabling ID attributes
will not suppress the anchors.</para>

</refsection>
</doc:refentry>
<xsl:param name="generate.id.attributes" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.index">
<refmeta xmlns="">
<refentrytitle>generate.index</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.index</refname>
<refpurpose>Do you want an index?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specify if an index should be generated. </para>

</refsection>
</doc:refentry>
<xsl:param name="generate.index" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.legalnotice.link">
<refmeta xmlns="">
<refentrytitle>generate.legalnotice.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.legalnotice.link</refname>
<refpurpose>Write legalnotice to separate chunk and generate link?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If the value of <parameter>generate.legalnotice.link</parameter>
is non-zero, the stylesheet:

<itemizedlist>
  <listitem>
    <para>writes the contents of <tag>legalnotice</tag> to a separate
    HTML file</para>
  </listitem>
  <listitem>
    <para>inserts a hyperlink to the <tag>legalnotice</tag> file</para>
  </listitem>
  <listitem>
    <para>adds (in the HTML <literal>head</literal>) either a single
    <literal>link</literal> or element or multiple
    <literal>link</literal> elements (depending on the value of the
    <parameter>html.head.legalnotice.link.multiple</parameter>
    parameter), with the value or values derived from the
    <parameter>html.head.legalnotice.link.types</parameter>
    parameter</para>
  </listitem>
  </itemizedlist>

  Otherwise, if <parameter>generate.legalnotice.link</parameter> is
  zero, <tag>legalnotice</tag> contents are rendered on the title
  page.</para>

<para>The name of the separate HTML file is computed as follows:

<orderedlist>
<listitem>
  <para>If a filename is given by the <tag class="xmlpi">dbhtml filename</tag> 
processing instruction, that filename is used.</para>
</listitem>
<listitem>
  <para>If the legalnotice has an <tag class="attribute">id</tag>/<tag class="attribute">xml:id</tag> 
attribute, and if <parameter>use.id.as.filename</parameter> != 0, the filename 
is the concatenation of the id value and the value of the <parameter>html.ext</parameter> 
parameter.</para>
</listitem>
<listitem>
  <para>If the legalnotice does not have an <tag class="attribute">id</tag>/<tag class="attribute">xml:id</tag>
 attribute, or if <parameter>use.id.as.filename</parameter> = 0, the filename is the concatenation of "ln-", 
auto-generated id value, and <parameter>html.ext</parameter> value.
  </para>
</listitem>
</orderedlist>

</para>

</refsection>
</doc:refentry>
<xsl:param name="generate.legalnotice.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.revhistory.link">
<refmeta xmlns="">
<refentrytitle>generate.revhistory.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.revhistory.link</refname>
<refpurpose>Write revhistory to separate chunk and generate link?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the contents of <tag>revhistory</tag> are written
to a separate HTML file and a link to the file is
generated. Otherwise, <tag>revhistory</tag> contents are rendered on
the title page.</para>

<para>The name of the separate HTML file is computed as follows:

<orderedlist>
<listitem>
  <para>If a filename is given by the <tag class="xmlpi">dbhtml filename</tag> processing instruction, 
that filename is used.</para>
</listitem>
<listitem>
  <para>If the revhistory has an <tag class="attribute">id</tag>/<tag class="attribute">xml:id</tag> 
attribute, and if <parameter>use.id.as.filename</parameter> != 0, the filename is the concatenation of 
the id value and the value of the <parameter>html.ext</parameter> parameter.</para>
</listitem>
<listitem>
  <para>If the revhistory does not have an <tag class="attribute">id</tag>/<tag class="attribute">xml:id</tag> 
attribute, or if <parameter>use.id.as.filename</parameter> = 0, the filename is the concatenation of "rh-", 
auto-generated id value, and <parameter>html.ext</parameter> value.
  </para>
</listitem>
</orderedlist>

</para>

</refsection>
</doc:refentry>
<xsl:param name="generate.revhistory.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.manifest">
  <refmeta xmlns="">
    <refentrytitle>generate.manifest</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
  </refmeta>
  <refnamediv xmlns="">
    <refname>generate.manifest</refname>
    <refpurpose>Generate a manifest file?</refpurpose>
  </refnamediv>

  

  <refsection xmlns=""><info><title>Description</title></info>

    <para>If non-zero, a list of HTML files generated by the
      stylesheet transformation is written to the file named by
      the <parameter>manifest</parameter> parameter.</para>

  </refsection>
</doc:refentry>
<xsl:param name="generate.manifest" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.meta.abstract">
<refmeta xmlns="">
<refentrytitle>generate.meta.abstract</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.meta.abstract</refname>
<refpurpose>Generate HTML <tag>META</tag> element from <tag>abstract</tag>?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, document abstracts will be reproduced in the HTML
<literal>head</literal>, with <literal>&gt;meta name="description" content="..."</literal></para>


</refsection>
</doc:refentry>
<xsl:param name="generate.meta.abstract" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.section.toc.level">
<refmeta xmlns="">
<refentrytitle>generate.section.toc.level</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.section.toc.level</refname>
<refpurpose>Control depth of TOC generation in sections</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>generate.section.toc.level</parameter> parameter
controls the depth of <tag>section</tag> in which TOCs will be generated. Note
that this is related to, but not the same as
<parameter>toc.section.depth</parameter>, which controls the depth to
which TOC entries will be generated in a given TOC.</para>
<para>If, for example, <parameter>generate.section.toc.level</parameter>
is <literal>3</literal>, TOCs will be generated in first, second, and third
level sections, but not in fourth level sections.
</para>

</refsection>
</doc:refentry>
<xsl:param name="generate.section.toc.level" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="generate.toc">
<refmeta xmlns="">
<refentrytitle>generate.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">table</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>generate.toc</refname>
<refpurpose>Control generation of ToCs and LoTs</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter has a structured value. It is a table of space-delimited
path/value pairs. Each path identifies some element in the source document
using a restricted subset of XPath (only the implicit child axis, no wildcards,
no predicates). Paths can be either relative or absolute.</para>

<para>When processing a particular element, the stylesheets consult this table to
determine if a ToC (or LoT(s)) should be generated.</para>

<para>For example, consider the entry:</para>

<screen>book toc,figure</screen>

<para>This indicates that whenever a <tag>book</tag> is formatted, a
Table Of Contents and a List of Figures should be generated. Similarly,</para>

<screen>/chapter toc</screen>

<para>indicates that whenever a document <emphasis>that has a root
of</emphasis> <tag>chapter</tag> is formatted, a Table of
Contents should be generated. The entry <literal>chapter</literal> would match
all chapters, but <literal>/chapter</literal> matches only <tag>chapter</tag>
document elements.</para>

<para>Generally, the longest match wins. So, for example, if you want to distinguish
articles in books from articles in parts, you could use these two entries:</para>

<screen>book/article toc,figure
part/article toc</screen>

<para>Note that an article in a part can never match a <literal>book/article</literal>,
so if you want nothing to be generated for articles in parts, you can simply leave
that rule out.</para>

<para>If you want to leave the rule in, to make it explicit that you're turning
something off, use the value <quote>nop</quote>. For example, the following
entry disables ToCs and LoTs for articles:</para>

<screen>article nop</screen>

<para>Do not simply leave the word <quote>article</quote> in the file
without a matching value. That'd be just begging the silly little
path/value parser to get confused.</para>

<para>Section ToCs are further controlled by the
<parameter>generate.section.toc.level</parameter> parameter.
For a given section level to have a ToC, it must have both an entry in 
<parameter>generate.toc</parameter> and be within the range enabled by
<parameter>generate.section.toc.level</parameter>.</para>
</refsection>
</doc:refentry>
<xsl:param name="generate.toc">
appendix  toc,title
article/appendix  nop
article   toc,title
book      toc,title,figure,table,example,equation
chapter   toc,title
part      toc,title
preface   toc,title
qandadiv  toc
qandaset  toc
reference toc,title
sect1     toc
sect2     toc
sect3     toc
sect4     toc
sect5     toc
section   toc
set       toc,title
</xsl:param>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossary.collection">
<refmeta xmlns="">
<refentrytitle>glossary.collection</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>glossary.collection</refname>
<refpurpose>Name of the glossary collection file</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Glossaries maintained independently across a set of documents
are likely to become inconsistent unless considerable effort is
expended to keep them in sync. It makes much more sense, usually, to
store all of the glossary entries in a single place and simply
<quote>extract</quote> the ones you need in each document.</para>

<para>That's the purpose of the
<parameter>glossary.collection</parameter> parameter. To setup a global
glossary <quote>database</quote>, follow these steps:</para>

<refsection><info><title>Setting Up the Glossary Database</title></info>

<para>First, create a stand-alone glossary document that contains all of
the entries that you wish to reference. Make sure that each glossary
entry has an ID.</para>

<para>Here's an example glossary:</para>

<informalexample>
<programlisting>
&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE glossary
  PUBLIC "-//OASIS//DTD DocBook XML V4.1.2//EN"
  "http://www.oasis-open.org/docbook/xml/4.1.2/docbookx.dtd"&gt;
&lt;glossary&gt;
&lt;glossaryinfo&gt;
&lt;editor&gt;&lt;firstname&gt;Eric&lt;/firstname&gt;&lt;surname&gt;Raymond&lt;/surname&gt;&lt;/editor&gt;
&lt;title&gt;Jargon File 4.2.3 (abridged)&lt;/title&gt;
&lt;releaseinfo&gt;Just some test data&lt;/releaseinfo&gt;
&lt;/glossaryinfo&gt;

&lt;glossdiv&gt;&lt;title&gt;0&lt;/title&gt;

&lt;glossentry&gt;
&lt;glossterm&gt;0&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;Numeric zero, as opposed to the letter `O' (the 15th letter of
the English alphabet). In their unmodified forms they look a lot
alike, and various kluges invented to make them visually distinct have
compounded the confusion. If your zero is center-dotted and letter-O
is not, or if letter-O looks almost rectangular but zero looks more
like an American football stood on end (or the reverse), you're
probably looking at a modern character display (though the dotted zero
seems to have originated as an option on IBM 3270 controllers). If
your zero is slashed but letter-O is not, you're probably looking at
an old-style ASCII graphic set descended from the default typewheel on
the venerable ASR-33 Teletype (Scandinavians, for whom /O is a letter,
curse this arrangement). (Interestingly, the slashed zero long
predates computers; Florian Cajori's monumental "A History of
Mathematical Notations" notes that it was used in the twelfth and
thirteenth centuries.) If letter-O has a slash across it and the zero
does not, your display is tuned for a very old convention used at IBM
and a few other early mainframe makers (Scandinavians curse &lt;emphasis&gt;this&lt;/emphasis&gt;
arrangement even more, because it means two of their letters collide).
Some Burroughs/Unisys equipment displays a zero with a &lt;emphasis&gt;reversed&lt;/emphasis&gt;
slash. Old CDC computers rendered letter O as an unbroken oval and 0
as an oval broken at upper right and lower left. And yet another
convention common on early line printers left zero unornamented but
added a tail or hook to the letter-O so that it resembled an inverted
Q or cursive capital letter-O (this was endorsed by a draft ANSI
standard for how to draw ASCII characters, but the final standard
changed the distinguisher to a tick-mark in the upper-left corner).
Are we sufficiently confused yet?&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;

&lt;glossentry&gt;
&lt;glossterm&gt;1TBS&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para role="accidence"&gt;
&lt;phrase role="pronounce"&gt;&lt;/phrase&gt;
&lt;phrase role="partsofspeach"&gt;n&lt;/phrase&gt;
&lt;/para&gt;
&lt;para&gt;The "One True Brace Style"&lt;/para&gt;
&lt;glossseealso&gt;indent style&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;

&lt;!-- ... --&gt;

&lt;/glossdiv&gt;

&lt;!-- ... --&gt;

&lt;/glossary&gt;</programlisting>
</informalexample>

</refsection>

<refsection><info><title>Marking Up Glossary Terms</title></info>

<para>That takes care of the glossary database, now you have to get the entries
into your document. Unlike bibliography entries, which can be empty, creating
<quote>placeholder</quote> glossary entries would be very tedious. So instead,
support for <parameter>glossary.collection</parameter> relies on implicit linking.</para>

<para>In your source document, simply use <tag>firstterm</tag> and
<tag>glossterm</tag> to identify the terms you wish to have included
in the glossary. The stylesheets assume that you will either set the
<tag class="attribute">baseform</tag> attribute correctly, or that the
content of the element exactly matches a term in your glossary.</para>

<para>If you're using a <parameter>glossary.collection</parameter>, don't
make explicit links on the terms in your document.</para>

<para>So, in your document, you might write things like this:</para>

<informalexample>
<programlisting>&lt;para&gt;This is dummy text, without any real meaning.
The point is simply to reference glossary terms like &lt;glossterm&gt;0&lt;/glossterm&gt;
and the &lt;firstterm baseform="1TBS"&gt;One True Brace Style (1TBS)&lt;/firstterm&gt;.
The &lt;glossterm&gt;1TBS&lt;/glossterm&gt;, as you can probably imagine, is a nearly
religious issue.&lt;/para&gt;</programlisting>
</informalexample>

<para>If you set the <parameter>firstterm.only.link</parameter> parameter,
only the terms marked with <tag>firstterm</tag> will be links.
Otherwise, all the terms will be linked.</para>

</refsection>

<refsection><info><title>Marking Up the Glossary</title></info>

<para>The glossary itself has to be identified for the stylesheets. For lack
of a better choice, the <tag class="attribute">role</tag> is used.
To identify the glossary as the target for automatic processing, set
the role to <quote><literal>auto</literal></quote>. The title of this
glossary (and any other information from the <tag>glossaryinfo</tag>
that's rendered by your stylesheet) will be displayed, but the entries will
come from the database.
</para>

<para>Unfortunately, the glossary can't be empty, so you must put in
at least one <tag>glossentry</tag>. The content of this entry
is irrelevant, it will not be rendered:</para>

<informalexample>
<programlisting>&lt;glossary role="auto"&gt;
&lt;glossentry&gt;
&lt;glossterm&gt;Irrelevant&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;If you can see this, the document was processed incorrectly. Use
the &lt;parameter&gt;glossary.collection&lt;/parameter&gt; parameter.&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;
&lt;/glossary&gt;</programlisting>
</informalexample>

<para>What about glossary divisions? If your glossary database has glossary
divisions <emphasis>and</emphasis> your automatic glossary contains at least
one <tag>glossdiv</tag>, the automic glossary will have divisions.
If the <tag>glossdiv</tag> is missing from either location, no divisions
will be rendered.</para>

<para>Glossary entries (and divisions, if appropriate) in the glossary will
occur in precisely the order they occur in your database.</para>

</refsection>

<refsection><info><title>Formatting the Document</title></info>

<para>Finally, when you are ready to format your document, simply set the
<parameter>glossary.collection</parameter> parameter (in either a
customization layer or directly through your processor's interface) to
point to your global glossary.</para>

<para>The stylesheets will format the glossary in your document as if
all of the entries implicilty referenced appeared there literally.</para>
</refsection>

<refsection><info><title>Limitations</title></info>

<para>Glossary cross-references <emphasis>within the glossary</emphasis> are
not supported. For example, this <emphasis>will not</emphasis> work:</para>

<informalexample>
<programlisting>&lt;glossentry&gt;
&lt;glossterm&gt;gloss-1&lt;/glossterm&gt;
&lt;glossdef&gt;&lt;para&gt;A description that references &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/para&gt;
&lt;glossseealso&gt;gloss-2&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;</programlisting>
</informalexample>

<para>If you put glossary cross-references in your glossary that way,
you'll get the cryptic error: <computeroutput>Warning:
glossary.collection specified, but there are 0 automatic
glossaries</computeroutput>.</para>

<para>Instead, you must do two things:</para>

<orderedlist>
<listitem>
<para>Markup your glossary using <tag>glossseealso</tag>:</para>

<informalexample>
<programlisting>&lt;glossentry&gt;
&lt;glossterm&gt;gloss-1&lt;/glossterm&gt;
&lt;glossdef&gt;&lt;para&gt;A description that references &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/para&gt;
&lt;glossseealso&gt;gloss-2&lt;/glossseealso&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;</programlisting>
</informalexample>
</listitem>

<listitem>
<para>Make sure there is at least one <tag>glossterm</tag> reference to
<glossterm>gloss-2</glossterm> <emphasis>in your document</emphasis>. The
easiest way to do that is probably within a <tag>remark</tag> in your
automatic glossary:</para>

<informalexample>
<programlisting>&lt;glossary role="auto"&gt;
&lt;remark&gt;Make sure there's a reference to &lt;glossterm&gt;gloss-2&lt;/glossterm&gt;.&lt;/remark&gt;
&lt;glossentry&gt;
&lt;glossterm&gt;Irrelevant&lt;/glossterm&gt;
&lt;glossdef&gt;
&lt;para&gt;If you can see this, the document was processed incorrectly. Use
the &lt;parameter&gt;glossary.collection&lt;/parameter&gt; parameter.&lt;/para&gt;
&lt;/glossdef&gt;
&lt;/glossentry&gt;
&lt;/glossary&gt;</programlisting>
</informalexample>
</listitem>
</orderedlist>
</refsection>

</refsection>
</doc:refentry>
<xsl:param name="glossary.collection"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossary.sort">
<refmeta xmlns="">
<refentrytitle>glossary.sort</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>glossary.sort</refname>
<refpurpose>Sort glossentry elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, then the glossentry elements within a
glossary, glossdiv, or glosslist are sorted on the glossterm, using
the current lang setting.  If zero (the default), then
glossentry elements are not sorted and are presented
in document order.
</para>

</refsection>
</doc:refentry>
<xsl:param name="glossary.sort" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossentry.show.acronym">
<refmeta xmlns="">
<refentrytitle>glossentry.show.acronym</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">no</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">primary</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>glossentry.show.acronym</refname>
<refpurpose>Display <tag>glossentry</tag> acronyms?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>A setting of <quote>yes</quote> means they should be displayed;
<quote>no</quote> means they shouldn't. If <quote>primary</quote> is used,
then they are shown as the primary text for the entry.</para>

<note>
<para>This setting controls both <tag>acronym</tag> and
<tag>abbrev</tag> elements in the <tag>glossentry</tag>.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="glossentry.show.acronym">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="glossterm.auto.link">
<refmeta xmlns="">
<refentrytitle>glossterm.auto.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>glossterm.auto.link</refname>
<refpurpose>Generate links from glossterm to glossentry automatically?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, links from inline <tag>glossterm</tag>s to the corresponding 
<tag>glossentry</tag> elements in a <tag>glossary</tag> or <tag>glosslist</tag> 
will be automatically generated. This is useful when your glossterms are consistent 
and you don't want to add links manually.</para>

<para>The automatic link generation feature is not used on <tag>glossterm</tag> elements
that have a <tag class="attribute">linkend</tag> attribute.</para>

</refsection>
</doc:refentry>
<xsl:param name="glossterm.auto.link" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="graphic.default.extension">
<refmeta xmlns="">
<refentrytitle>graphic.default.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>graphic.default.extension</refname>
<refpurpose>Default extension for graphic filenames</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If a <tag>graphic</tag> or <tag>mediaobject</tag>
includes a reference to a filename that does not include an extension,
and the <tag class="attribute">format</tag> attribute is
<emphasis>unspecified</emphasis>, the default extension will be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="graphic.default.extension"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="graphicsize.extension">
<refmeta xmlns="">
<refentrytitle>graphicsize.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>graphicsize.extension</refname>
<refpurpose>Enable the getWidth()/getDepth() extension functions</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero (and if <parameter>use.extensions</parameter> is non-zero
and if you're using a processor that supports extension functions), the
<function>getWidth</function> and <function>getDepth</function> functions
will be used to extract image sizes from graphics.</para>

</refsection>
</doc:refentry>
<xsl:param name="graphicsize.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="graphicsize.use.img.src.path">
<refmeta xmlns="">
<refentrytitle>graphicsize.use.img.src.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>graphicsize.use.img.src.path</refname>
<refpurpose>Prepend <parameter>img.src.path</parameter> before
filenames passed to extension functions</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero <parameter>img.src.path</parameter> parameter will
be appended before filenames passed to extension functions for
measuring image dimensions.</para>

</refsection>
</doc:refentry>
<xsl:param name="graphicsize.use.img.src.path" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="header.rule">
<refmeta xmlns="">
<refentrytitle>header.rule</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>header.rule</refname>
<refpurpose>Rule under headers?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a rule will be drawn below the page headers.</para>

</refsection>
</doc:refentry>
<xsl:param name="header.rule" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="highlight.default.language">
<refmeta xmlns="">
<refentrytitle>highlight.default.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>highlight.default.language</refname>
<refpurpose>Default language of programlisting</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This language is used when there is no language attribute on programlisting.</para>

</refsection>
</doc:refentry>
<xsl:param name="highlight.default.language"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="highlight.source">
<refmeta xmlns="">
<refentrytitle>highlight.source</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>highlight.source</refname>
<refpurpose>Should the content of <tag>programlisting</tag>
be syntactically highlighted?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When this parameter is non-zero, the stylesheets will try to do
syntax highlighting of the content of the <tag>programlisting</tag> element. The highlighting is done by the 
XSLTHL extension module. This is an external Java library which is not part of the DocBook XSL distribution.</para>

<para>In order to use this extension, you must add
<filename>xslthl.jar</filename> to your Java classpath. You can
download this software from <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://sourceforge.net/projects/xslthl">the XSLT syntax highlighting project</link> at SourceForge.</para>

<para>The configuration of syntax highlighting is stored in 
<filename>highlighting/xslthl-config.xml</filename>. The Java
property <literal>xslthl.config</literal> must point to this
file (using URL syntax).</para>

<para>This extension is known to work with Saxon 6.5.x. Here is an example of a modified Saxon command:</para>

<programlisting>java -cp c:\batch\;…;c:\path\to\xslthl.jar -Dxslthl.config=file:///c:/docbook-xsl/highlighting/xslthl-config.xml … com.icl.saxon.StyleSheet …</programlisting>

<para>You can specify the language for each programlisting by using the <tag class="attribute">language</tag> attribute. The
<parameter>highlighting.default.language</parameter> parameter can be used for specifying the
language to be used for programlistings without a <tag class="attribute">language</tag> attribute.</para>

</refsection>
</doc:refentry>
<xsl:param name="highlight.source" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.append">
<refmeta xmlns="">
<refentrytitle>html.append</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.append</refname>
<refpurpose>Specifies content to append to HTML output</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies content to append to the end of HTML files output by
the <filename>html/docbook.xsl</filename> stylesheet, after the
closing <code>&lt;html&gt;</code> tag. You probably don’t want to set any
value for this parameter; but if you do, the only value it should ever
be set to is a newline character: <code>&amp;#x0a;</code> or
<code>&amp;#10;</code></para>

</refsection>
</doc:refentry>
<xsl:param name="html.append"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.base">
<refmeta xmlns="">
<refentrytitle>html.base</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.base</refname>
<refpurpose>An HTML base URI</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If html.base is set, it is used for the <tag>base</tag> element
in the <tag>head</tag> of the html documents.  The parameter specifies
the base URL for all relative URLs in the document.  This is useful
for dynamically served html where the base URI needs to be
shifted.</para>

</refsection>
</doc:refentry>
<xsl:param name="html.base"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.cellpadding">
<refmeta xmlns="">
<refentrytitle>html.cellpadding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.cellpadding</refname>
<refpurpose>Default value for cellpadding in HTML tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, this value will be used as the default cellpadding value
in HTML tables. nn for pixels or nn% for percentage length. E.g. 5 or
5%</para>

</refsection>
</doc:refentry>
<xsl:param name="html.cellpadding"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.cellspacing">
<refmeta xmlns="">
<refentrytitle>html.cellspacing</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.cellspacing</refname>
<refpurpose>Default value for cellspacing in HTML tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, this value will be used as the default cellspacing
value in HTML tables. nn for pixels or nn% for percentage
length. E.g. 5 or 5%</para>

</refsection>
</doc:refentry>
<xsl:param name="html.cellspacing"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.cleanup">
<refmeta xmlns="">
<refentrytitle>html.cleanup</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.cleanup</refname>
<refpurpose>Attempt to clean up the resulting HTML?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, and if the <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.exslt.org/">EXSLT</link>
extensions are supported by your processor, the resulting HTML will be
<quote>cleaned up</quote>. This improves the chances that the
resulting HTML will be valid. It may also improve the formatting of
some elements.</para>

<para>This parameter is different from <parameter>make.valid.html</parameter>
because it uses extension functions to manipulate result-tree-fragments.</para>

</refsection>
</doc:refentry>
<xsl:param name="html.cleanup" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.ext">
<refmeta xmlns="">
<refentrytitle>html.ext</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.ext</refname>
<refpurpose>Identifies the extension of generated HTML files</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The extension identified by <parameter>html.ext</parameter> will
be used as the filename extension for chunks created by this
stylesheet. </para>

</refsection>
</doc:refentry>
<xsl:param name="html.ext">.html</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.extra.head.links">
<refmeta xmlns="">
<refentrytitle>html.extra.head.links</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.extra.head.links</refname>
<refpurpose>Toggle extra HTML head link information</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, extra <tag>link</tag> elements will be
generated in the <tag>head</tag> of chunked HTML files. These
extra links point to chapters, appendixes, sections, etc. as supported
by the <quote>Site Navigation Bar</quote> in Mozilla 1.0 (as of CR1, at least).
</para>

</refsection>
</doc:refentry>
<xsl:param name="html.extra.head.links" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.head.legalnotice.link.types">
<refmeta xmlns="">
<refentrytitle>html.head.legalnotice.link.types</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.head.legalnotice.link.types</refname>
<refpurpose>Specifies link types for legalnotice link in html head</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of
<parameter>html.head.legalnotice.link.types</parameter> is a
space-separated list of link types, as described in <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/html401/types.html#type-links">Section 6.12
of the HTML 4.01 specification</link>. If the value of the
<parameter>generate.legalnotice.link</parameter> parameter is
non-zero, then the stylesheet generates (in the
<literal>head</literal> section of the HTML source) either a single
HTML <literal>link</literal> element or, if the value of the
<parameter>html.head.legalnotice.link.multiple</parameter> is
non-zero, one <literal>link</literal> element for each link type
specified. Each <literal>link</literal> has the following attributes:

<itemizedlist>
  <listitem>
    <para>a <tag class="attribute">rel</tag> attribute whose
    value is derived from the value of
    <parameter>html.head.legalnotice.link.types</parameter></para>
  </listitem>
  <listitem>
    <para>an <tag class="attribute">href</tag> attribute whose
    value is set to the URL of the file containing the
    <tag>legalnotice</tag></para>
  </listitem>
  <listitem>
    <para>a <tag class="attribute">title</tag> attribute whose
    value is set to the title of the corresponding
    <tag>legalnotice</tag> (or a title programatically
    determined by the stylesheet)</para>
  </listitem>
</itemizedlist>

For example:

<screen>  &lt;link rel="license" href="ln-id2524073.html" title="Legal Notice"&gt;</screen>
</para>

<refsection><info><title>About the default value</title></info>
  
  <para>In an ideal world, the default value of
  <parameter>html.head.legalnotice.link.types</parameter> would
  probably be “<literal>license</literal>”, since the content of the
  DocBook <tag>legalnotice</tag> is typically license
  information, not copyright information. However, the default value
  is “<literal>copyright</literal>” for pragmatic reasons: because
  that’s among the set of “recognized link types” listed in <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/html401/types.html#type-links">Section
  6.12 of the HTML 4.01 specification</link>, and because certain
  browsers and browser extensions are preconfigured to recognize that
  value.</para>
</refsection>

</refsection>
</doc:refentry>
<xsl:param name="html.head.legalnotice.link.types">copyright</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.head.legalnotice.link.multiple">
<refmeta xmlns="">
<refentrytitle>html.head.legalnotice.link.multiple</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.head.legalnotice.link.multiple</refname>
<refpurpose>Generate multiple link instances in html head for legalnotice?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>html.head.legalnotice.link.multiple</parameter> is
non-zero and the value of
<parameter>html.head.legalnotice.link.types</parameter> contains
multiple link types, then the stylesheet generates (in the
<literal>head</literal> section of the HTML source) one
<literal>link</literal> element for each link type specified. For
example, if the value of
<parameter>html.head.legalnotice.link.types</parameter> is
“<literal>copyright license</literal>”:

<screen>  &lt;link rel="copyright" href="ln-id2524073.html" title="Legal Notice"&gt;
  &lt;link rel="license" href="ln-id2524073.html" title="Legal Notice"&gt;</screen>

 Otherwise, the stylesheet generates generates a single
 <literal>link</literal> instance; for example:

<screen>  &lt;link rel="copyright license" href="ln-id2524073.html" title="Legal Notice"&gt;</screen>
 
</para>
</refsection>
</doc:refentry>
<xsl:param name="html.head.legalnotice.link.multiple" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.longdesc">
<refmeta xmlns="">
<refentrytitle>html.longdesc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.longdesc</refname>
<refpurpose>Should longdesc URIs be created?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, HTML files will be created for the
<literal>longdesc</literal> attribute. These files
are created from the <tag>textobject</tag>s in
<tag>mediaobject</tag>s and
<tag>inlinemediaobject</tag>.
</para>
</refsection>
</doc:refentry>
<xsl:param name="html.longdesc" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.longdesc.link">
<refmeta xmlns="">
<refentrytitle>html.longdesc.link</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.longdesc.link</refname>
<refpurpose>Should a link to the longdesc be included in the HTML?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, links will be created to the
HTML files created for the
<literal>longdesc</literal> attribute. It makes no
sense to enable this option without also enabling the
<parameter>html.longdesc</parameter> parameter.</para>



</refsection>
</doc:refentry>
<xsl:param name="html.longdesc.link" select="$html.longdesc"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.stylesheet">
<refmeta xmlns="">
<refentrytitle>html.stylesheet</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.stylesheet</refname>
<refpurpose>Name of the stylesheet(s) to use in the generated HTML</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>html.stylesheet</parameter> parameter is either
empty, indicating that no stylesheet <tag>link</tag> tag should be
generated in the html output, or it is a list of one or more
stylesheet files.</para>

<para>Multiple stylesheets are space-delimited. If you need to
reference a stylesheet URI that includes a space, encode it with
<literal>%20</literal>. A separate html <literal>link</literal> element will
be generated for each stylesheet in the order they are listed in the
parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="html.stylesheet"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="html.stylesheet.type">
<refmeta xmlns="">
<refentrytitle>html.stylesheet.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>html.stylesheet.type</refname>
<refpurpose>The type of the stylesheet used in the generated HTML</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The type of the stylesheet to place in the HTML <tag>link</tag> tag.
</para>

</refsection>
</doc:refentry>
<xsl:param name="html.stylesheet.type">text/css</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.alias.file">
<refmeta xmlns="">
<refentrytitle>htmlhelp.alias.file</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.alias.file</refname>
<refpurpose>Filename of alias file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the filename of the alias file (used for context-sensitive help).</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.alias.file">alias.h</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.autolabel">
<refmeta xmlns="">
<refentrytitle>htmlhelp.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.autolabel</refname>
<refpurpose>Should tree-like ToC use autonumbering feature?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set this to non-zero to include chapter and section numbers into ToC
in the left panel.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.back">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.back</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.back</refname>
<refpurpose>Should the Back button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the  Hide/Show button shown on toolbar</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.back" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.forward">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.forward</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.forward</refname>
<refpurpose>Should the Forward button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the  Forward button  on the toolbar.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.forward" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.hideshow">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.hideshow</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.hideshow</refname>
<refpurpose>Should the Hide/Show button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the  Hide/Show button shown on toolbar</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.hideshow" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.home">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.home</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.home</refname>
<refpurpose>Should the Home button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Home button  on the toolbar.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.home" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.home.url">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.home.url</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.home.url</refname>
<refpurpose>URL address of page accessible by Home button</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>URL address of page accessible by Home button.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.home.url"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump1">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump1</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump1</refname>
<refpurpose>Should the Jump1 button be shown?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
  <para>Set to non-zero to include the <literal>Jump1</literal> button on the toolbar.</para>
</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump1" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump1.title">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump1.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump1.title</refname>
<refpurpose>Title of Jump1 button</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Title of Jump1 button.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump1.title">User1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump1.url">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump1.url</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump1.url</refname>
<refpurpose>URL address of page accessible by Jump1 button</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>URL address of page accessible by Jump1 button.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump1.url"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump2">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump2</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump2</refname>
<refpurpose>Should the Jump2 button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Jump2 button  on the toolbar.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump2" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump2.title">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump2.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump2.title</refname>
<refpurpose>Title of Jump2 button</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Title of Jump2 button.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump2.title">User2</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.jump2.url">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.jump2.url</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.jump2.url</refname>
<refpurpose>URL address of page accessible by Jump2 button</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>URL address of page accessible by Jump2 button.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.jump2.url"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.locate">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.locate</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.locate</refname>
<refpurpose>Should the Locate button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want Locate button shown on toolbar, turn this
parameter to 1.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.locate" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.next">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.next</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.next</refname>
<refpurpose>Should the Next button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Next button  on the toolbar.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.next" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.options">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.options</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.options</refname>
<refpurpose>Should the Options button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want Options button shown on toolbar, turn this
parameter to 1.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.options" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.prev">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.prev</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.prev</refname>
<refpurpose>Should the Prev button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Prev button  on the toolbar.
</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.prev" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.print">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.print</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.print</refname>
<refpurpose>Should the Print button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Print button  on the toolbar.
</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.print" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.refresh">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.refresh</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.refresh</refname>
<refpurpose>Should the Refresh button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Stop button  on the toolbar.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.refresh" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.stop">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.stop</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.stop</refname>
<refpurpose>Should the Stop button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want Stop button shown on toolbar, turn this
parameter to 1.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.stop" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.button.zoom">
<refmeta xmlns="">
<refentrytitle>htmlhelp.button.zoom</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.button.zoom</refname>
<refpurpose>Should the Zoom button be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include the Zoom button  on the toolbar.
</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.button.zoom" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.chm">
<refmeta xmlns="">
<refentrytitle>htmlhelp.chm</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.chm</refname>
<refpurpose>Filename of output HTML Help file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set the  name of resulting CHM file</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.chm">htmlhelp.chm</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.default.topic">
<refmeta xmlns="">
<refentrytitle>htmlhelp.default.topic</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.default.topic</refname>
<refpurpose>Name of file with default topic</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Normally first chunk of document is displayed when you open HTML
Help file. If you want to display another topic, simply set its
filename by this parameter.</para>

<para>This is useful especially if you don't generate ToC in front of
your document and you also hide root element in ToC. E.g.:</para>

<programlisting>&lt;xsl:param name="generate.book.toc" select="0"/&gt;
&lt;xsl:param name="htmlhelp.hhc.show.root" select="0"/&gt;
&lt;xsl:param name="htmlhelp.default.topic"&gt;pr01.html&lt;/xsl:param&gt;
</programlisting>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.default.topic"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.display.progress">
<refmeta xmlns="">
<refentrytitle>htmlhelp.display.progress</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.display.progress</refname>
<refpurpose>Display compile progress?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to to display compile progress
</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.display.progress" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.encoding">
<refmeta xmlns="">
<refentrytitle>htmlhelp.encoding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.encoding</refname>
<refpurpose>Character encoding to use in files for HTML Help compiler.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>HTML Help Compiler is not UTF-8 aware, so you should always use an
appropriate single-byte encoding here. Use one from <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="ftp://ftp.isi.edu/in-notes/iana/assignments/character-sets">iana</link>, the  registered charset values.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.encoding">iso-8859-1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.enhanced.decompilation">
<refmeta xmlns="">
<refentrytitle>htmlhelp.enhanced.decompilation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.enhanced.decompilation</refname>
<refpurpose>Allow enhanced decompilation of CHM?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When non-zero this parameter enables enhanced decompilation of CHM.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.enhanced.decompilation" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.enumerate.images">
<refmeta xmlns="">
<refentrytitle>htmlhelp.enumerate.images</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.enumerate.images</refname>
<refpurpose>Should the paths to all used images be added to the project file?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero if you insert images into your documents as
external binary entities or if you are using absolute image paths.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.enumerate.images" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.force.map.and.alias">
<refmeta xmlns="">
<refentrytitle>htmlhelp.force.map.and.alias</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.force.map.and.alias</refname>
<refpurpose>Should [MAP] and [ALIAS] sections be added to the project file unconditionally?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
  <para>Set to non-zero if you have your own
    <literal>alias.h</literal> and <literal>context.h</literal>
    files and you want to include references to them in the project
    file.</para>
</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.force.map.and.alias" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc.binary">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc.binary</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc.binary</refname>
<refpurpose>Generate binary ToC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to generate a binary TOC. You must create a binary TOC
if you want to add Prev/Next buttons to toolbar (which is default
behaviour). Files with binary TOC can't be merged.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc.binary" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc.folders.instead.books">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc.folders.instead.books</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc.folders.instead.books</refname>
<refpurpose>Use folder icons in ToC (instead of book icons)?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set non-zero for folder-like icons or zero for book-like icons in the TOC
ToC. If you want to use folder-like icons you must swith off binary
ToC using (xref) <parameter>htmlhelp.hhc.binary</parameter>.



</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc.folders.instead.books" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc</refname>
<refpurpose>Filename of TOC file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set the name of the TOC file. The default is <filename>toc.hhc</filename>.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc">toc.hhc</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc.section.depth">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc.section.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc.section.depth</refname>
<refpurpose>Depth of TOC for sections in a left pane.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set the section depth in the left pane of HTML Help viewer. </para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc.section.depth">5</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc.show.root">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc.show.root</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc.show.root</refname>
<refpurpose>Should there be an entry for the root element in the ToC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If set to zero, there will be no entry for the root element in the 
ToC. This is useful when you want to provide the user with an expanded
ToC as a default.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc.show.root" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhc.width">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhc.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhc.width</refname>
<refpurpose>Width of navigation pane</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter specifies the width of the navigation pane (containing TOC and
other navigation tabs) in pixels.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhc.width"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhk">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhk</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhk</refname>
<refpurpose>Filename of index file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>set the name of the index file. The default is <filename>index.hhk</filename>.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhk">index.hhk</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhp">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhp</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhp</refname>
<refpurpose>Filename of project file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Change this parameter if you want different name of project
file than htmlhelp.hhp.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhp">htmlhelp.hhp</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhp.tail">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhp.tail</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhp.tail</refname>
<refpurpose>Additional content for project file.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want to include some additional parameters into project file,
store appropriate part of project file into this parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhp.tail"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhp.window">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhp.window</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhp.window</refname>
<refpurpose>Name of default window.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Name of default window. If empty no [WINDOWS] section will be
added to project file.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhp.window">Main</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.hhp.windows">
<refmeta xmlns="">
<refentrytitle>htmlhelp.hhp.windows</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.hhp.windows</refname>
<refpurpose>Definition of additional windows</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Content of this parameter is placed at the end of [WINDOWS]
section of project file. You can use it for defining your own
addtional windows.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.hhp.windows"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.map.file">
<refmeta xmlns="">
<refentrytitle>htmlhelp.map.file</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.map.file</refname>
<refpurpose>Filename of map file.</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>Set the name of map file. The default is
  <filename>context.h</filename>. (used for context-sensitive
  help).</para>
</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.map.file">context.h</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.only">
<refmeta xmlns="">
<refentrytitle>htmlhelp.only</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.only</refname>
<refpurpose>Should only project files be generated?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>


<para>Set to non-zero if you want to play with various HTML Help parameters
and you don't need to regenerate all HTML files. This setting will not
process whole document, only project files (hhp, hhc, hhk,...) will be
generated.</para>


</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.only" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.remember.window.position">
<refmeta xmlns="">
<refentrytitle>htmlhelp.remember.window.position</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.remember.window.position</refname>
<refpurpose>Remember help window position?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to remember help window position between starts.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.remember.window.position" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.show.advanced.search">
<refmeta xmlns="">
<refentrytitle>htmlhelp.show.advanced.search</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.show.advanced.search</refname>
<refpurpose>Should advanced search features be available?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want advanced search features in your help, turn this
parameter to 1.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.show.advanced.search" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.show.favorities">
<refmeta xmlns="">
<refentrytitle>htmlhelp.show.favorities</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.show.favorities</refname>
<refpurpose>Should the Favorites tab be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to include a Favorites tab in the navigation pane 
of the help window.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.show.favorities" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.show.menu">
<refmeta xmlns="">
<refentrytitle>htmlhelp.show.menu</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.show.menu</refname>
<refpurpose>Should the menu bar be shown?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to have an application menu bar in your HTML Help window.
</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.show.menu" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.show.toolbar.text">
<refmeta xmlns="">
<refentrytitle>htmlhelp.show.toolbar.text</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.show.toolbar.text</refname>
<refpurpose>Show text under toolbar buttons?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set to non-zero to display texts under toolbar buttons, zero to switch
off displays.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.show.toolbar.text" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.title">
<refmeta xmlns="">
<refentrytitle>htmlhelp.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.title</refname>
<refpurpose>Title of HTML Help</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Content of this parameter will be used as a title for generated
HTML Help. If empty, title will be automatically taken from document.</para>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.title"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.use.hhk">
<refmeta xmlns="">
<refentrytitle>htmlhelp.use.hhk</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.use.hhk</refname>
<refpurpose>Should the index be built using the HHK file?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the index is created using the HHK file (instead of using <tag role="html">object</tag>
elements in the HTML files). For more information, see <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="HtmlHelp.html#HHGenIndex">Generating an index</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.use.hhk" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="htmlhelp.window.geometry">
<refmeta xmlns="">
<refentrytitle>htmlhelp.window.geometry</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>htmlhelp.window.geometry</refname>
<refpurpose>Set initial geometry of help window</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter specifies initial position of help
window. E.g.</para>

<programlisting>&lt;xsl:param name="htmlhelp.window.geometry"&gt;[160,64,992,704]&lt;/xsl:param&gt;</programlisting>

</refsection>
</doc:refentry>
<xsl:param name="htmlhelp.window.geometry"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="img.src.path">
<refmeta xmlns="">
<refentrytitle>img.src.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>img.src.path</refname>
<refpurpose>Path to HTML/FO image files</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Add a path prefix to the value of the <tag class="attribute">fileref</tag> 
attribute of <tag>graphic</tag>, <tag>inlinegraphic</tag>, and <tag>imagedata</tag> elements. The resulting 
compound path is used in the output as the value of the <tag class="attribute">src</tag> 
attribute of <tag class="element">img</tag> (HTML) or <tag class="element">external-graphic</tag> (FO).
</para>

<para>
The path given by <literal>img.src.path</literal> could be relative to the directory where the HTML/FO
files are created, or it could be an absolute URI.
The default value is empty.
Be sure to include a trailing slash if needed.
</para>

<para>This prefix is not applied to any filerefs that start
with "/" or contain "//:".
</para>

</refsection>
</doc:refentry>
<xsl:param name="img.src.path"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="id.warnings">
<refmeta xmlns="">
<refentrytitle>id.warnings</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>id.warnings</refname>
<refpurpose>Should warnings be generated for titled elements without IDs?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, the stylesheet will issue a warning for any element
(other than the root element) which has a <tag>title</tag> but does not have an
ID.</para>
</refsection>
</doc:refentry>
<xsl:param name="id.warnings" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.method">
<refmeta xmlns="">
<refentrytitle>index.method</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">basic</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kosek</refmiscinfo>
<refmiscinfo class="other" otherclass="value">kimber</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.method</refname>
<refpurpose>Select method used to group index entries in an index</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter lets you select which method to use for sorting and grouping
 index entries in an index.
Indexes in Latin-based languages that have accented characters typically
sort together accented words and unaccented words.
Thus <quote>Á</quote> (U+00C1 LATIN CAPITAL LETTER A WITH ACUTE) would sort together
with <quote>A</quote> (U+0041 LATIN CAPITAL LETTER A), so both would appear in the <quote>A</quote>
section of the index.
Languages using other alphabets (such as Russian,  which is written in the Cyrillic alphabet)
and languages using ideographic chararacters (such as Japanese)
require grouping specific to the languages and alphabets.
</para>

<para>The default indexing method is limited.
It can group accented characters in Latin-based languages only.
It cannot handle non-Latin alphabets or ideographic languages.
The other indexing methods require extensions of one type or
another, and do not work with
all XSLT processors, which is why they are not used by default.</para>

<para>The three choices for indexing method are:</para>
<variablelist>
<varlistentry>
<term><literal>basic</literal></term>
<listitem>
<para>
(default)  Sort and groups words based only on the Latin alphabet.
Words with accented Latin letters will group and sort with
their respective primary letter, but
words in non-Latin alphabets will be
put in the <quote>Symbols</quote> section of the index.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>kosek</literal></term>
<listitem>
<para>
This method sorts and groups words based on letter groups configured in
the DocBook locale file for the given language.
See, for example, the French locale file <filename>common/fr.xml</filename>.
This method requires that the XSLT processor
supports the EXSLT extensions (most do).
It also requires support for using 
user-defined functions in xsl:key (xsltproc does not).
</para>
<para>This method is suitable for any language for which you can
list all the individual characters that should appear
in each letter group in an index.
It is probably not practical to use it for ideographic languages
such as Chinese that have hundreds or thousands of characters.
</para>

<para>To use the kosek method, you must:</para>

<orderedlist>
<listitem>
<para>Use a processor that supports its extensions, such as
Saxon 6 or Xalan (xsltproc and Saxon 8 do not).
</para>
</listitem>
<listitem>
<para>Set the index.method parameter's value to <quote>kosek</quote>.
</para>
</listitem>
<listitem>
<para>Import the appropriate index extensions stylesheet module
<filename>fo/autoidx-kosek.xsl</filename> or 
<filename>html/autoidx-kosek.xsl</filename> into your
customization.
</para>
</listitem>
</orderedlist>

</listitem>
</varlistentry>
<varlistentry>
<term><literal>kimber</literal></term>
<listitem>
<para>
This method uses extensions to the Saxon processor to implement
sophisticated indexing processes. It uses its own 
configuration file, which can include information for any number of
languages. Each language's configuration can group
words using one of two processes. In the
enumerated process similar to that used in the kosek method,
you indicate the groupings character-by-character.
In the between-key process, you specify the
break-points in the sort order that should start a new group.
The latter configuration is useful for ideographic languages
such as Chinese, Japanese, and Korean.
You can also define your own collation algorithms and how you
want mixed Latin-alphabet words sorted.</para>
<itemizedlist>
<listitem>
<para>For a whitepaper describing the extensions, see:
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.innodata-isogen.com/knowledge_center/white_papers/back_of_book_for_xsl_fo.pdf">http://www.innodata-isogen.com/knowledge_center/white_papers/back_of_book_for_xsl_fo.pdf</link>.
</para>
</listitem>
<listitem>
<para>To download the extension library, see
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.innodata-isogen.com/knowledge_center/tools_downloads/i18nsupport">http://www.innodata-isogen.com/knowledge_center/tools_downloads/i18nsupport</link>.
</para>
</listitem>
</itemizedlist>

<para>To use the kimber method, you must:</para>

<orderedlist>
<listitem>
<para>Use Saxon (version 6 or 8) as your XSLT processor.
</para>
</listitem>
<listitem>
<para>Install and configure the Innodata Isogen library, using
the documentation that comes with it.
</para>
</listitem>
<listitem>
<para>Set the index.method parameter's value to <quote>kimber</quote>.
</para>
</listitem>
<listitem>
<para>Import the appropriate index extensions stylesheet module
<filename>fo/autoidx-kimber.xsl</filename> or 
<filename>html/autoidx-kimber.xsl</filename> into your
customization.
</para>
</listitem>
</orderedlist>

</listitem>
</varlistentry>
</variablelist>

</refsection>
</doc:refentry>
<xsl:param name="index.method">basic</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.on.role">
<refmeta xmlns="">
<refentrytitle>index.on.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.on.role</refname>
<refpurpose>Select indexterms based on <tag class="attribute">role</tag> value</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If non-zero, 
then an <tag>index</tag> element that has a
<tag class="attribute">role</tag> attribute
value will contain only those <tag>indexterm</tag>
elements with a matching role value.
If an <tag>index</tag> has no <tag class="attribute">role</tag>
attribute or it is blank, then the index will contain
all <tag>indexterm</tag>s in the current scope.
</para>
<para>
If <literal>index.on.role</literal> is zero, then the
<tag class="attribute">role</tag> attribute has no effect
on selecting indexterms for an index.
</para>

<para>If you are using DocBook version 4.3 or later, you should
use the <tag class="attribute">type</tag> attribute instead of <tag class="attribute">role</tag>
on <tag>indexterm</tag> and <tag>index</tag>,
and set the <parameter>index.on.type</parameter> to a nonzero
value.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.on.role" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.on.type">
<refmeta xmlns="">
<refentrytitle>index.on.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.on.type</refname>
<refpurpose>Select indexterms based on <tag class="attribute">type</tag>
attribute value</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If non-zero, 
then an <tag>index</tag> element that has a
<tag class="attribute">type</tag> attribute
value will contain only those <tag>indexterm</tag>
elements with a matching <tag class="attribute">type</tag> attribute value.
If an <tag>index</tag> has no <tag class="attribute">type</tag>
attribute or it is blank, then the index will contain
all <tag>indexterm</tag>s in the current scope.
</para>

<para>
If <literal>index.on.type</literal> is zero, then the
<tag class="attribute">type</tag> attribute has no effect
on selecting indexterms for an index.
</para>

<para>For those using DocBook version 4.2 or earlier,
the <tag class="attribute">type</tag> attribute is not available
for index terms.  However, you can achieve the same
effect by using the <tag class="attribute">role</tag> attribute
in the same manner on <tag>indexterm</tag>
and <tag>index</tag>, and setting the stylesheet parameter 
<parameter>index.on.role</parameter> to a nonzero value.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.on.type" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.number.separator">
<refmeta xmlns="">
<refentrytitle>index.number.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.number.separator</refname>
<refpurpose>Override for punctuation separating page numbers in index</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter permits you to override the text to insert between
page references in a formatted index entry.  Typically 
that would be a comma and a space.
</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'number-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
override the gentext with the content of this parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
</para>

<para>In HTML index output, section title references are used instead of
page number references.  This punctuation appears between
such section titles in an HTML index.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.number.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.term.separator">
<refmeta xmlns="">
<refentrytitle>index.term.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.term.separator</refname>
<refpurpose>Override for punctuation separating an index term 
from its list of page references in an index</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter permits you to override
the text to insert between
the end of an index term and its list of page references.
Typically that might be a comma and a space.
</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'term-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
fill in the content for this normally empty 
override parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
For fo output, it could be an <tag>fo:leader</tag>
element to provide space of a specific length, or a dot leader.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.term.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.range.separator">
<refmeta xmlns="">
<refentrytitle>index.range.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.range.separator</refname>
<refpurpose>Override for punctuation separating the two numbers
in a page range in index</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter permits you
to override the text to insert between
the two numbers of a page range in an index.
This parameter is only used by those XSL-FO processors
that support an extension for generating such page ranges
(such as XEP).</para>

<para>Because this text may be locale dependent,
this parameter's value is normally taken from a gentext
template named 'range-separator' in the
context 'index' in the stylesheet
locale file for the language
of the current document.
This parameter can be used to override the gentext string,
and would typically be used on the command line.
This parameter would apply to all languages.
</para>

<para>So this text string can be customized in two ways.
You can reset the default gentext string using
the <parameter>local.l10n.xml</parameter> parameter, or you can
override the gentext with the content of this parameter.
The content can be a simple string, or it can be
something more complex such as a call-template.
</para>

<para>In HTML index output, section title references are used instead of
page number references. So there are no page ranges
and this parameter has no effect.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.range.separator"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="index.prefer.titleabbrev">
<refmeta xmlns="">
<refentrytitle>index.prefer.titleabbrev</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>index.prefer.titleabbrev</refname>
<refpurpose>Should abbreviated titles be used as back references?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, and if a <tag>titleabbrev</tag> is defined, the abbreviated title
is used as the link text of a back reference in the index.
</para>

</refsection>
</doc:refentry>
<xsl:param name="index.prefer.titleabbrev" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ignore.image.scaling">
<refmeta xmlns="">
<refentrytitle>ignore.image.scaling</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ignore.image.scaling</refname>
<refpurpose>Tell the stylesheets to ignore the author's image scaling attributes</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the scaling attributes on graphics and media objects are
ignored.</para>

</refsection>
</doc:refentry>
<xsl:param name="ignore.image.scaling" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="inherit.keywords">
<refmeta xmlns="">
<refentrytitle>inherit.keywords</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>inherit.keywords</refname>
<refpurpose>Inherit keywords from ancestor elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>inherit.keywords</parameter>
is non-zero, the keyword <literal>meta</literal> for each HTML
<literal>head</literal> element will include all of the keywords from
ancestor elements. Otherwise, only the keywords from the current section
will be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="inherit.keywords" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.xref.page.number">
<refmeta xmlns="">
<refentrytitle>insert.xref.page.number</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>insert.xref.page.number</refname>
<refpurpose>Turns page numbers in xrefs on and off</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter determines if
cross references (<tag>xref</tag>s) in
printed output will
include page number citations.
It has three possible values.
</para>
<variablelist>
<varlistentry>
<term>no</term>
<listitem><para>No page number references will be generated.
</para></listitem>
</varlistentry>
<varlistentry>
<term>yes</term>
<listitem><para>Page number references will be generated
for all <tag>xref</tag> elements.
The style of page reference may be changed
if an <tag class="attribute">xrefstyle</tag>
attribute is used.
</para></listitem>
</varlistentry>
<varlistentry>
<term>maybe</term>
<listitem><para>Page number references will not be generated
for an <tag>xref</tag> element unless 
it has an
<tag class="attribute">xrefstyle</tag>
attribute whose value specifies a page reference.
</para></listitem>
</varlistentry>
</variablelist>

</refsection>
</doc:refentry>
<xsl:param name="insert.xref.page.number">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="javahelp.encoding">
<refmeta xmlns="">
<refentrytitle>javahelp.encoding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>javahelp.encoding</refname>
<refpurpose>Character encoding to use in control files for JavaHelp.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>
  
<para>JavaHelp crashes on some characters when written as character
references. In that case you can use this parameter to select an appropriate encoding.</para>
  
</refsection>
</doc:refentry>
<xsl:param name="javahelp.encoding">iso-8859-1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="keep.relative.image.uris">
<refmeta xmlns="">
<refentrytitle>keep.relative.image.uris</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>keep.relative.image.uris</refname>
<refpurpose>Should image URIs be resolved against xml:base?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, relative URIs (in, for example
<literal>fileref</literal> attributes) will be used in the generated
output. Otherwise, the URIs will be made absolute with respect to the
base URI.</para>

<para>Note that the stylesheets calculate (and use) the absolute form
for some purposes, this only applies to the resulting output.</para>

</refsection>
</doc:refentry>
<xsl:param name="keep.relative.image.uris" select="1"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.default.language">
  <refmeta xmlns="">
    <refentrytitle>l10n.gentext.default.language</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
  </refmeta>
  <refnamediv xmlns="">
    <refname>l10n.gentext.default.language</refname>
    <refpurpose>Sets the default language for generated text</refpurpose>
  </refnamediv>

  

<refsection xmlns=""><info><title>Description</title></info>

<para>The value of the <parameter>l10n.gentext.default.language</parameter>
parameter is used as the language for generated text if no setting is provided
in the source document.</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.default.language">en</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.language">
<refmeta xmlns="">
<refentrytitle>l10n.gentext.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>l10n.gentext.language</refname>
<refpurpose>Sets the gentext language</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If this parameter is set to any value other than the empty string, its
value will be used as the value for the language when generating text. Setting
<parameter>l10n.gentext.language</parameter> overrides any settings within the
document being formatted.</para>

<para>It's much more likely that you might want to set the
<parameter>l10n.gentext.default.language</parameter> parameter.</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.language"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.gentext.use.xref.language">
<refmeta xmlns="">
<refentrytitle>l10n.gentext.use.xref.language</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>l10n.gentext.use.xref.language</refname>
<refpurpose>Use the language of target when generating cross-reference text?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the language of the target will be used when
generating cross reference text. Usually, the <quote>current</quote>
language is used when generating text (that is, the language of the
element that contains the cross-reference element). But setting this parameter
allows the language of the element <emphasis>pointed to</emphasis> to control
the generated text.</para>

<para>Consider the following example:</para>

<informalexample>
<programlisting>&lt;para lang="en"&gt;See also &lt;xref linkend="chap3"/&gt;.&lt;/para&gt;
</programlisting>
</informalexample>

<para>Suppose that Chapter 3 happens to be written in German.
If <parameter>l10n.gentext.use.xref.language</parameter> is non-zero, the
resulting text will be something like this:</para>

<blockquote>
<para>See also Kapital 3.</para>
</blockquote>

<para>Where the more traditional rendering would be:</para>

<blockquote>
<para>See also Chapter 3.</para>
</blockquote>

</refsection>
</doc:refentry>
<xsl:param name="l10n.gentext.use.xref.language" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="l10n.lang.value.rfc.compliant">
<refmeta xmlns="">
<refentrytitle>l10n.lang.value.rfc.compliant</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>l10n.lang.value.rfc.compliant</refname>
<refpurpose>Make value of lang attribute RFC compliant?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, ensure that the values for all <tag class="attribute">lang</tag> attributes in HTML output are RFC
compliant<footnote><para>Section 8.1.1, <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/REC-html40/struct/dirlang.html#h-8.1.1">Language Codes</link>, in the HTML 4.0 Recommendation states that:

<blockquote><para>[RFC1766] defines and explains the language codes
that must be used in HTML documents.</para>
<para>Briefly, language codes consist of a primary code and a possibly
empty series of subcodes:

<literallayout class="monospaced">language-code = primary-code ( "-" subcode )*</literallayout>
</para>
<para>And in RFC 1766, <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.ietf.org/rfc/rfc1766.txt">Tags for the Identification
of Languages</link>, the EBNF for "language tag" is given as:

<literallayout class="monospaced">Language-Tag = Primary-tag *( "-" Subtag )
Primary-tag = 1*8ALPHA
Subtag = 1*8ALPHA</literallayout>
</para>
</blockquote>
</para></footnote>.

by taking any underscore characters in any <tag class="attribute">lang</tag> values found in source documents, and
replacing them with hyphen characters in output HTML files. For
example, <literal>zh_CN</literal> in a source document becomes
<literal>zh-CN</literal> in the HTML output form that source.

<note>
<para>This parameter does not cause any case change in <tag class="attribute">lang</tag> values, because RFC 1766
explicitly states that all "language tags" (as it calls them) "are
to be treated as case insensitive".</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="l10n.lang.value.rfc.compliant" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="label.from.part">
<refmeta xmlns="">
<refentrytitle>label.from.part</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>label.from.part</refname>
<refpurpose>Renumber components in each part?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>label.from.part</parameter> is non-zero, then
  numbering of components — <tag>preface</tag>,
  <tag>chapter</tag>, <tag>appendix</tag>, and
  <tag>reference</tag> (when <tag>reference</tag> occurs at the
  component level) — is re-started within each
  <tag>part</tag>.</para>
<para>If <parameter>label.from.part</parameter> is zero (the
  default), numbering of components is <emphasis>not</emphasis>
  re-started within each <tag>part</tag>; instead, components are
  numbered sequentially throughout each <tag>book</tag>,
  regardless of whether or not they occur within <tag>part</tag>
  instances.</para>

</refsection>
</doc:refentry>
<xsl:param name="label.from.part" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.everyNth">
<refmeta xmlns="">
<refentrytitle>linenumbering.everyNth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>linenumbering.everyNth</refname>
<refpurpose>Indicate which lines should be numbered</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If line numbering is enabled, everyNth line will be
numbered. Note that numbering is one based, not zero based.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.everyNth">5</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.extension">
<refmeta xmlns="">
<refentrytitle>linenumbering.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>linenumbering.extension</refname>
<refpurpose>Enable the line numbering extension</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, verbatim environments (<tag>address</tag>, <tag>literallayout</tag>,
<tag>programlisting</tag>, <tag>screen</tag>, <tag>synopsis</tag>) that specify line numbering will
have line numbers.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.separator">
<refmeta xmlns="">
<refentrytitle>linenumbering.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>linenumbering.separator</refname>
<refpurpose>Specify a separator between line numbers and lines</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The separator is inserted between line numbers and lines in the
verbatim environment. The default value is a single white space.
 Note the interaction with <parameter>linenumbering.width</parameter>
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.separator"><xsl:text> </xsl:text></xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="linenumbering.width">
<refmeta xmlns="">
<refentrytitle>linenumbering.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>linenumbering.width</refname>
<refpurpose>Indicates the width of line numbers</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If line numbering is enabled, line numbers will appear right
justified in a field "width" characters wide.
</para>

</refsection>
</doc:refentry>
<xsl:param name="linenumbering.width">3</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="link.mailto.url">
<refmeta xmlns="">
<refentrytitle>link.mailto.url</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>link.mailto.url</refname>
<refpurpose>Mailto URL for the LINK REL=made HTML HEAD element</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If not the empty string, this address will be used for the
rel=made <literal>link</literal> element in the html <literal>head</literal>
</para>

</refsection>
</doc:refentry>
<xsl:param name="link.mailto.url"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.graphic.viewport">
<refmeta xmlns="">
<refentrytitle>make.graphic.viewport</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>make.graphic.viewport</refname>
<refpurpose>Use tables in HTML to make viewports for graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The HTML <tag>img</tag> element only supports the notion
of content-area scaling; it doesn't support the distinction between a
content-area and a viewport-area, so we have to make some compromises.</para>

<para>If <parameter>make.graphic.viewport</parameter> is non-zero, a table
will be used to frame the image. This creates an effective viewport-area.
</para>

<para>Tables and alignment don't work together, so this parameter is ignored
if alignment is specified on an image.</para>
</refsection>
</doc:refentry>
<xsl:param name="make.graphic.viewport" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.single.year.ranges">
<refmeta xmlns="">
<refentrytitle>make.single.year.ranges</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>make.single.year.ranges</refname>
<refpurpose>Print single-year ranges (e.g., 1998-1999)</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, year ranges that span a single year will be printed
in range notation (1998-1999) instead of discrete notation
(1998, 1999).</para>

</refsection>
</doc:refentry>
<xsl:param name="make.single.year.ranges" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.valid.html">
<refmeta xmlns="">
<refentrytitle>make.valid.html</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>make.valid.html</refname>
<refpurpose>Attempt to make sure the HTML output is valid HTML</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>make.valid.html</parameter> is true, the stylesheets take
extra effort to ensure that the resulting HTML is valid. This may mean that some
<tag>para</tag> tags are translated into HTML <tag>div</tag>s or
that other substitutions occur.</para>

<para>This parameter is different from <parameter>html.cleanup</parameter>
because it changes the resulting markup; it does not use extension functions
to manipulate result-tree-fragments and is therefore applicable to any
XSLT processor.</para>

</refsection>
</doc:refentry>
<xsl:param name="make.valid.html" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="make.year.ranges">
<refmeta xmlns="">
<refentrytitle>make.year.ranges</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>make.year.ranges</refname>
<refpurpose>Collate copyright years into ranges?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, multiple copyright <tag>year</tag> elements will be
collated into ranges.
This works only if each year number is put into a separate
year element.  The copyright element permits multiple
year elements. The stylesheet will not successfully parse
a complex year element such as <literal>&lt;year&gt;2001,2002,2003&lt;/year&gt;</literal> into
a range.</para>

</refsection>
</doc:refentry>
<xsl:param name="make.year.ranges" select="0"/>
    
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="manifest">
  <refmeta xmlns="">
    <refentrytitle>manifest</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
  </refmeta>
  <refnamediv xmlns="">
    <refname>manifest</refname>
    <refpurpose>Name of manifest file</refpurpose>
  </refnamediv>

  

  <refsection xmlns=""><info><title>Description</title></info>

    <para>The name of the file to which a manifest is written (if the
      value of the <parameter>generate.manifest</parameter> parameter
      is non-zero).</para>

  </refsection>
</doc:refentry>
<xsl:param name="manifest">HTML.manifest</xsl:param>
    

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="manifest.in.base.dir">
<refmeta xmlns="">
<refentrytitle>manifest.in.base.dir</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>manifest.in.base.dir</refname>
<refpurpose>Should the manifest file be written into <parameter>base.dir</parameter>?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the manifest file as well as project files for HTML Help and
Eclipse Help are written into <parameter>base.dir</parameter> instead
of the current directory.</para>

</refsection>
</doc:refentry>
<xsl:param name="manifest.in.base.dir" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="manual.toc">
<refmeta xmlns="">
<refentrytitle>manual.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>manual.toc</refname>
<refpurpose>An explicit TOC to be used for the TOC</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>manual.toc</parameter> identifies an explicit TOC that
will be used for building the printed TOC.
</para>

</refsection>
</doc:refentry>
<xsl:param name="manual.toc"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="menuchoice.menu.separator">
<refmeta xmlns="">
<refentrytitle>menuchoice.menu.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>menuchoice.menu.separator</refname>
<refpurpose>Separator between items of a <tag>menuchoice</tag>
with <tag>guimenuitem</tag> or
<tag>guisubmenu</tag></refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Separator used to connect items of a <tag>menuchoice</tag> with
<tag>guimenuitem</tag> or <tag>guisubmenu</tag>. Other elements
are linked with <parameter>menuchoice.separator</parameter>.
</para>
<para>The default value is &amp;#x2192;, which is the
&amp;rarr; (right arrow) character entity.  
The current FOP (0.20.5) requires setting the font-family
explicitly.
</para>
<para>The default value also includes spaces around the arrow,
which will allow a line to break.  Replace the spaces with
&amp;#xA0; (nonbreaking space) if you don't want those
spaces to break.
</para>

</refsection>
</doc:refentry>
<xsl:param name="menuchoice.menu.separator"> → </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="menuchoice.separator">
<refmeta xmlns="">
<refentrytitle>menuchoice.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>menuchoice.separator</refname>
<refpurpose>Separator between items of a <tag>menuchoice</tag>
other than <tag>guimenuitem</tag> and
<tag>guisubmenu</tag></refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Separator used to connect items of a <tag>menuchoice</tag> other
than <tag>guimenuitem</tag> and <tag>guisubmenu</tag>. The latter
elements are linked with <parameter>menuchoice.menu.separator</parameter>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="menuchoice.separator">+</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="navig.graphics.extension">
<refmeta xmlns="">
<refentrytitle>navig.graphics.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>navig.graphics.extension</refname>
<refpurpose>Extension for navigational graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the filename extension to use on navigational graphics used
in the headers and footers of chunked HTML.</para>

</refsection>
</doc:refentry>
<xsl:param name="navig.graphics.extension">.gif</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="navig.graphics">
<refmeta xmlns="">
<refentrytitle>navig.graphics</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>navig.graphics</refname>
<refpurpose>Use graphics in navigational headers and footers?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the navigational headers and footers in chunked
HTML are presented in an alternate style that uses graphical icons for
Next, Previous, Up, and Home.  Default graphics are provided in the
distribution. If zero, text is used instead of graphics.
</para>

</refsection>
</doc:refentry>
<xsl:param name="navig.graphics" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="navig.graphics.path">
<refmeta xmlns="">
<refentrytitle>navig.graphics.path</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>navig.graphics.path</refname>
<refpurpose>Path to navigational graphics</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Sets the path, probably relative to the directory where the HTML
files are created, to the navigational graphics used in the
headers and footers of chunked HTML.
</para>

</refsection>
</doc:refentry>
<xsl:param name="navig.graphics.path">images/</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="navig.showtitles">
<refmeta xmlns="">
<refentrytitle>navig.showtitles</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>navig.showtitles</refname>
<refpurpose>Display titles in HTML headers and footers?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero,
the headers and footers of chunked HTML
display the titles of the next and previous chunks,
along with the words 'Next' and 'Previous' (or the
equivalent graphical icons if navig.graphics is true).
If false (zero), then only the words 'Next' and 'Previous'
(or the icons) are displayed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="navig.showtitles">1</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="nominal.image.depth">
<refmeta xmlns="">
<refentrytitle>nominal.image.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>nominal.image.depth</refname>
<refpurpose>Nominal image depth</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>See <parameter>nominal.image.width</parameter>.</para>

</refsection>
</doc:refentry>
<xsl:param name="nominal.image.depth" select="4 * $pixels.per.inch"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="nominal.image.width">
<refmeta xmlns="">
<refentrytitle>nominal.image.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>nominal.image.width</refname>
<refpurpose>The nominal image width</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Graphic widths expressed as a percentage are problematic. In the
following discussion, we speak of width and contentwidth, but
the same issues apply to depth and contentdepth.</para>

<para>A width of 50% means "half of the available space for the image."
That's fine. But note that in HTML, this is a dynamic property and
the image size will vary if the browser window is resized.</para>

<para>A contentwidth of 50% means "half of the actual image width".
But what does that mean if the stylesheets cannot assess the image's
actual size? Treating this as a width of 50% is one possibility, but
it produces behavior (dynamic scaling) that seems entirely out of
character with the meaning.</para>

<para>Instead, the stylesheets define a
<parameter>nominal.image.width</parameter> and convert percentages to
actual values based on that nominal size.</para>

</refsection>
</doc:refentry>
<xsl:param name="nominal.image.width" select="6 * $pixels.per.inch"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="nominal.table.width">
<refmeta xmlns="">
<refentrytitle>nominal.table.width</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>nominal.table.width</refname>
<refpurpose>The (absolute) nominal width of tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>In order to convert CALS column widths into HTML column widths, it
is sometimes necessary to have an absolute table width to use for conversion
of mixed absolute and relative widths. This value must be an absolute
length (not a percentage).</para>

</refsection>
</doc:refentry>
<xsl:param name="nominal.table.width">6in</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.base.uri"> 
<refmeta xmlns=""> 
<refentrytitle>olink.base.uri</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>olink.base.uri</refname> 
<refpurpose>Base URI used in olink hrefs</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 
<para>When cross reference data is collected for resolving olinks, it
may be necessary to prepend a base URI to each target's href. This
parameter lets you set that base URI when cross reference data is
collected. This feature is needed when you want to link to a document
that is processed without chunking. The output filename for such a
document is not known to the XSL stylesheet; the only target
information consists of fragment identifiers such as
<literal>#idref</literal>. To enable the resolution of olinks between
documents, you should pass the name of the HTML output file as the
value of this parameter. Then the hrefs recorded in the cross
reference data collection look like
<literal>outfile.html#idref</literal>, which can be reached as links
from other documents.</para>
</refsection> 
</doc:refentry>
<xsl:param name="olink.base.uri"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.debug">
<refmeta xmlns="">
<refentrytitle>olink.debug</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.debug</refname>
<refpurpose>Turn on debugging messages for olinks</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, then each olink will generate several
messages about how it is being resolved during processing.
This is useful when an olink does not resolve properly
and the standard error messages are not sufficient to
find the problem. 
</para>

<para>You may need to read through the olink XSL templates
to understand the context for some of the debug messages.
</para>

</refsection>
</doc:refentry>
<xsl:param name="olink.debug" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.properties">
<refmeta xmlns="">
<refentrytitle>olink.properties</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.properties</refname>
<refpurpose>Properties associated with the cross-reference 
text of an olink.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This <literal>attribute set</literal> is applied to the
<literal>fo:basic-link</literal> element of an olink. It is not applied to the
optional page number or optional title of the external
document.</para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="olink.properties">
  <xsl:attribute name="show-destination">replace</xsl:attribute>
</xsl:attribute-set>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.olink.page.number">
<refmeta xmlns="">
<refentrytitle>insert.olink.page.number</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>insert.olink.page.number</refname>
<refpurpose>Turns page numbers in olinks on and off</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter determines if
cross references made between documents with
<tag>olink</tag> will 
include page number citations.
In most cases this is only applicable to references in printed output.
</para>
<para>The parameter has three possible values.
</para>
<variablelist>
<varlistentry>
<term>no</term>
<listitem><para>No page number references will be generated for olinks.
</para></listitem>
</varlistentry>
<varlistentry>
<term>yes</term>
<listitem><para>Page number references will be generated
for all <tag>olink</tag> references.
The style of page reference may be changed
if an <tag class="attribute">xrefstyle</tag>
attribute is used.
</para></listitem>
</varlistentry>
<varlistentry>
<term>maybe</term>
<listitem><para>Page number references will not be generated
for an <tag>olink</tag> element unless 
it has an
<tag class="attribute">xrefstyle</tag>
attribute whose value specifies a page reference.
</para></listitem>
</varlistentry>
</variablelist>
<para>Olinks that point to targets within the same document
are treated as <tag>xref</tag>s, and controlled by
the <parameter>insert.xref.page.number</parameter> parameter.
</para>

<para>Page number references for olinks to
external documents can only be inserted if the 
information exists in the olink database. 
This means each olink target element 
(<tag>div</tag> or <tag>obj</tag>)
must have a <tag class="attribute">page</tag> attribute
whose value is its page number in the target document.
The XSL stylesheets are not able to extract that information
during processing because pages have not yet been created in
XSLT transformation.  Only the XSL-FO processor knows what
page each element is placed on.
Therefore some postprocessing must take place to populate
page numbers in the olink database.
</para>



</refsection>
</doc:refentry>
<xsl:param name="insert.olink.page.number">no</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="insert.olink.pdf.frag">
<refmeta xmlns="">
<refentrytitle>insert.olink.pdf.frag</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>insert.olink.pdf.frag</refname>
<refpurpose>Add fragment identifiers for links into PDF files</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter determines whether
the cross reference URIs to PDF documents made with
<tag>olink</tag> will 
include fragment identifiers.
</para>

<para>When forming a URI to link to a PDF document,
a fragment identifier (typically a '#' followed by an
id value) appended to the PDF filename can be used by
the PDF viewer to open
the PDF file to a location within the document instead of
the first page.
However, not all PDF files have id
values embedded in them, and not all PDF viewers can
handle fragment identifiers. 
</para>

<para>If <parameter>insert.olink.pdf.frag</parameter> is set
to a non-zero value, then any olink targeting a
PDF file will have the fragment identifier appended to the URI.
The URI is formed by concatenating the value of the
<parameter>olink.base.uri</parameter> parameter, the
value of the <tag class="attribute">baseuri</tag>
attribute from the <tag class="element">document</tag>
element in the olink database with the matching
<tag class="attribute">targetdoc</tag> value,
and the value of the <tag class="attribute">href</tag>
attribute for the targeted element in the olink database.
The <tag class="attribute">href</tag> attribute
contains the fragment identifier.
</para>

<para>If <parameter>insert.olink.pdf.frag</parameter> is set
to zero (the default value), then 
the <tag class="attribute">href</tag> attribute
from the olink database
is not appended to PDF olinks, so the fragment identifier is left off.
A PDF olink is any olink for which the
<tag class="attribute">baseuri</tag> attribute
from the matching <tag class="element">document</tag>
element in the olink database ends with '.pdf'.
Any other olinks will still have the fragment identifier added.
</para>
</refsection>
</doc:refentry>
<xsl:param name="insert.olink.pdf.frag" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="prefer.internal.olink">
<refmeta xmlns="">
<refentrytitle>prefer.internal.olink</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>prefer.internal.olink</refname>
<refpurpose>Prefer a local olink reference to an external reference</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you are re-using XML content modules in multiple documents,
you may want to redirect some of your olinks.  This parameter
permits you to redirect an olink to the current document.
</para>

<para>For example: you are writing documentation for a  product, 
which includes 3 manuals: a little installation
booklet (booklet.xml), a user 
guide (user.xml), and a reference manual (reference.xml).
All 3 documents begin with the same introduction section (intro.xml) that 
contains a reference to the customization section (custom.xml) which is 
included in both user.xml and reference.xml documents.
</para>

<para>How do you write the link to custom.xml in intro.xml
so that it is interpreted correctly in all 3 documents?</para>
<itemizedlist>
<listitem><para>If you use xref, it will fail in user.xml.</para>
</listitem>
<listitem><para>If you use olink (pointing to reference.xml),
the reference in user.xml  
will point to the customization section of the reference manual, while it is 
actually available in user.xml.</para>
</listitem>
</itemizedlist>

<para>If you set the <parameter>prefer.internal.olink</parameter>
parameter to a non-zero value, then the processor will
first look in the olink database
for the olink's <tag>targetptr</tag> attribute value
in document matching the <parameter>current.docid</parameter>
parameter value.  If it isn't found there, then
it tries the document in the database
with the <tag>targetdoc</tag>
value that matches the olink's <tag>targetdoc</tag>
attribute.
</para>

<para>This feature permits an olink reference to resolve to
the current document if there is an element
with an id matching the olink's <tag>targetptr</tag>
value.  The current document's olink data must be
included in the target database for this to work.</para>

<caution>
<para>There is a potential for incorrect links if
the same <tag>id</tag> attribute value is used for different
content in different documents.
Some of your olinks may be redirected to the current document
when they shouldn't be.  It is not possible to control
individual olink instances.</para>
</caution>

</refsection>
</doc:refentry>
<xsl:param name="prefer.internal.olink" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.lang.fallback.sequence"> 
<refmeta xmlns=""> 
<refentrytitle>olink.lang.fallback.sequence</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>olink.lang.fallback.sequence</refname> 
<refpurpose>look up translated documents if olink not found?</refpurpose>

</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 

<para>This parameter defines a list of lang values
to search among to resolve olinks.
</para>

<para>Normally an olink tries to resolve to a document in the same
language as the olink itself.  The language of an olink
is determined by its nearest ancestor element with a
<tag class="attribute">lang</tag> attribute, otherwise the
value of the <parameter>l10n.gentext.default.lang</parameter>
parameter.
</para>

<para>An olink database can contain target data for the same
document in multiple languages.  Each set of data has the
same value for the <tag>targetdoc</tag> attribute in
the <tag>document</tag> element in the database, but with a 
different <tag>lang</tag> attribute value.
</para>

<para>When an olink is being resolved, the target is first
sought in the document with the same language as the olink.
If no match is found there, then this parameter is consulted
for additional languages to try.</para>

<para>The <parameter>olink.lang.fallback.sequence</parameter>
must be a whitespace separated list of lang values to
try.  The first one with a match in the olink database is used.
The default value is empty.</para>

<para>For example, a document might be written in German
and contain an olink with
<literal>targetdoc="adminguide"</literal>.
When the document is processed, the processor
first looks for a target dataset in the
olink database starting with:</para>

<literallayout><literal>&lt;document targetdoc="adminguide" lang="de"&gt;</literal>.
</literallayout>

<para>If there is no such element, then the
<parameter>olink.lang.fallback.sequence</parameter> 
parameter is consulted.
If its value is, for example, <quote>fr en</quote>, then the processor next
looks for <literal>targetdoc="adminguide" lang="fr"</literal>, and
then for <literal>targetdoc="adminguide" lang="en"</literal>.
If there is still no match, it looks for
<literal>targetdoc="adminguide"</literal> with no
lang attribute.
</para>

<para>This parameter is useful when a set of documents is only
partially translated, or is in the process of being translated.  
If a target of an olink has not yet been translated, then this
parameter permits the processor to look for the document in
other languages.  This assumes the reader would rather have
a link to a document in a different language than to have
a broken link.
</para>

</refsection> 
</doc:refentry>
<xsl:param name="olink.lang.fallback.sequence"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.doctitle"> 
<refmeta xmlns=""> 
<refentrytitle>olink.doctitle</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">no</refmiscinfo>
<refmiscinfo class="other" otherclass="value">yes</refmiscinfo>
<refmiscinfo class="other" otherclass="value">maybe</refmiscinfo>
</refmeta> 
<refnamediv xmlns=""> 
<refname>olink.doctitle</refname> 
<refpurpose>show the document title for external olinks?</refpurpose>

</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 
<para>When olinks between documents are resolved, the generated text
may not make it clear that the reference is to another document.
It is possible for the stylesheets to append the other document's
title to external olinks. For this to happen, two parameters must
be set.</para>
<itemizedlist>
<listitem>
<para>This <parameter>olink.doctitle</parameter> parameter
should be set to either <literal>yes</literal> or <literal>maybe</literal>
to enable this feature.
</para>
</listitem>
<listitem>
<para>And you should also set the <parameter>current.docid</parameter>
parameter to the document id for the  document currently
being processed for output.
</para>
</listitem>
</itemizedlist>

<para>
Then if an olink's  <literal>targetdoc</literal> id differs from
the <literal>current.docid</literal> value, the stylesheet knows
that it is a reference to another document and can
append the target document's
title to the generated olink text. </para> 

<para>The text for the target document's title is copied from the
olink database from the <tag>ttl</tag> element
of the top-level <tag>div</tag> for that document.
If that <tag>ttl</tag> element is missing or empty,
no title is output.
</para>

<para>The supported values for <parameter>olink.doctitle</parameter> are:
</para>
<variablelist>
<varlistentry>
<term><literal>yes</literal></term>
<listitem>
<para>
Always insert the title to the target document if it is not
the current document.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>no</literal></term>
<listitem>
<para>
Never insert the title to the target document, even if requested
in an <tag class="attribute">xrefstyle</tag> attribute.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>maybe</literal></term>
<listitem>
<para>
Only insert the title to the target document, if requested
in an <tag class="attribute">xrefstyle</tag> attribute.
</para>
</listitem>
</varlistentry>
</variablelist>
<para>An <tag class="attribute">xrefstyle</tag> attribute
may override the global setting for individual olinks.
The following values are supported in an
<tag class="attribute">xrefstyle</tag>
attribute using the <literal>select:</literal> syntax:
</para>

<variablelist>
<varlistentry>
<term><literal>docname</literal></term>
<listitem>
<para>
Insert the target document name for this olink using the
<literal>docname</literal> gentext template, but only
if the value of <parameter>olink.doctitle</parameter>
is not <literal>no</literal>.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>docnamelong</literal></term>
<listitem>
<para>
Insert the target document name for this olink using the
<literal>docnamelong</literal> gentext template, but only
if the value of <parameter>olink.doctitle</parameter>
is not <literal>no</literal>.
</para>
</listitem>
</varlistentry>
<varlistentry>
<term><literal>nodocname</literal></term>
<listitem>
<para>
Omit the target document name even if
the value of <parameter>olink.doctitle</parameter>
is <literal>yes</literal>.
</para>
</listitem>
</varlistentry>
</variablelist>
<para>Another way of inserting the target document name 
for a single olink is to employ an
<tag class="attribute">xrefstyle</tag>
attribute using the <literal>template:</literal> syntax.
The <literal>%o</literal> placeholder (the letter o, not zero)
in such a template
will be filled in with the target document's title when it is processed.
This will occur regardless of 
the value of <parameter>olink.doctitle</parameter>.
</para>
<para>Note that prior to version 1.66 of the XSL stylesheets,
the allowed values for this parameter were 0 and 1.  Those
values are still supported and mapped to 'no' and 'yes', respectively.
</para>
</refsection> 
</doc:refentry>
<xsl:param name="olink.doctitle">no</xsl:param> 

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.fragid">
<refmeta xmlns="">
<refentrytitle>olink.fragid</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.fragid</refname>
<refpurpose>Names the fragment identifier portion of an OLink resolver query</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>The fragment identifier portion of an <tag>olink</tag> target.</para>
</refsection>
</doc:refentry>
<xsl:param name="olink.fragid">fragid=</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.outline.ext">
<refmeta xmlns="">
<refentrytitle>olink.outline.ext</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.outline.ext</refname>
<refpurpose>The extension of OLink outline files</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The extension to be expected for  OLink outline files</para>
<para>Bob has this parameter as dead. Please don't use</para>

</refsection>
</doc:refentry>
<xsl:param name="olink.outline.ext">.olink</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.pubid">
<refmeta xmlns="">
<refentrytitle>olink.pubid</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.pubid</refname>
<refpurpose>Names the public identifier portion of an OLink resolver query</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para/>

</refsection>
</doc:refentry>
<xsl:param name="olink.pubid">pubid</xsl:param>
  
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.resolver">
<refmeta xmlns="">
<refentrytitle>olink.resolver</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.resolver</refname>
<refpurpose>The root name of the OLink resolver (usually a script)</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>FIXME:</para>
</refsection>
</doc:refentry>
<xsl:param name="olink.resolver">/cgi-bin/olink</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="olink.sysid">
<refmeta xmlns="">
<refentrytitle>olink.sysid</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>olink.sysid</refname>
<refpurpose>Names the system identifier portion of an OLink resolver query</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>FIXME</para>

</refsection>
</doc:refentry>
<xsl:param name="olink.sysid">sysid</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="abstract.notitle.enabled">
<refmeta xmlns="">
<refentrytitle>abstract.notitle.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>abstract.notitle.enabled</refname>
<refpurpose>Suppress display of abstract titles?</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, in output of the <tag>abstract</tag> element on
  titlepages, display of the abstract title is suppressed.</para>
</refsection>
</doc:refentry>
<xsl:param name="abstract.notitle.enabled" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="othercredit.like.author.enabled">
<refmeta xmlns="">
<refentrytitle>othercredit.like.author.enabled</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>othercredit.like.author.enabled</refname>
<refpurpose>Display othercredit in same style as author?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, output of the
<tag>othercredit</tag> element on titlepages is displayed in
the same style as <tag>author</tag> and
<tag>editor</tag> output. If zero then
<tag>othercredit</tag> output is displayed using a style
different than that of <tag>author</tag> and
<tag>editor</tag>.</para>

</refsection>
</doc:refentry>
<xsl:param name="othercredit.like.author.enabled">0</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="para.propagates.style">
<refmeta xmlns="">
<refentrytitle>para.propagates.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>para.propagates.style</refname>
<refpurpose>Pass para role attribute through to HTML?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true, the role attribute of <tag>para</tag> elements
will be passed through to the HTML as a class attribute on the
<tag>p</tag> generated for the paragraph.</para>

</refsection>
</doc:refentry>
<xsl:param name="para.propagates.style" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="part.autolabel">
<refmeta xmlns="">
<refentrytitle>part.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>part.autolabel</refname>
<refpurpose>Specifies the labeling format for Part titles</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, then parts will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (upperroman).
</para>


</refsection>
</doc:refentry>
<xsl:param name="part.autolabel">I</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="phrase.propagates.style">
<refmeta xmlns="">
<refentrytitle>phrase.propagates.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>phrase.propagates.style</refname>
<refpurpose>Pass phrase role attribute through to HTML?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the role attribute of <tag>phrase</tag> elements
will be passed through to the HTML as a <literal>class</literal>
attribute on a <literal>span</literal> that surrounds the
phrase.</para>

</refsection>
</doc:refentry>
<xsl:param name="phrase.propagates.style" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="pixels.per.inch">
<refmeta xmlns="">
<refentrytitle>pixels.per.inch</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>pixels.per.inch</refname>
<refpurpose>How many pixels are there per inch?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When lengths are converted to pixels, this value is used to
determine the size of a pixel. The default value is taken from the
<link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/2004/WD-xsl11-20041216/">XSL
Recommendation</link>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="pixels.per.inch">90</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="points.per.em">
<refmeta xmlns="">
<refentrytitle>points.per.em</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">number</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>points.per.em</refname>
<refpurpose>Specify the nominal size of an em-space in points</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The fixed value used for calculations based upon the size of a
character. The assumption made is that ten point font is in use. This
assumption may not be valid.</para>

</refsection>
</doc:refentry>
<xsl:param name="points.per.em">10</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="preface.autolabel">
<refmeta xmlns="">
<refentrytitle>preface.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>preface.autolabel</refname>
<refpurpose>Specifices the labeling format for Preface titles</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero then prefaces will be numbered using the parameter
value as the number format if the value matches one of the following:
</para>

<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>

<para>Any nonzero value other than the above will generate
the default number format (arabic).
</para>


</refsection>
</doc:refentry>
<xsl:param name="preface.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="preferred.mediaobject.role">
<refmeta xmlns="">
<refentrytitle>preferred.mediaobject.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>preferred.mediaobject.role</refname>
<refpurpose>Select which mediaobject to use based on
this value of an object's <tag class="attribute">role</tag> attribute.
</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>A mediaobject may contain several objects such as imageobjects.
If the parameter <parameter>use.role.for.mediaobject</parameter> is
non-zero, then the <literal>role</literal> attribute on
<tag>imageobject</tag>s and other objects within a
<tag>mediaobject</tag> container will be used to select which object
will be used.  If one of the objects has a role value that matches the
<parameter>preferred.mediaobject.role</parameter> parameter, then it
has first priority for selection.  If more than one has such a role
value, the first one is used.
</para>
<para>
See the <parameter>use.role.for.mediaobject</parameter> parameter
for the sequence of selection.</para>
</refsection>
</doc:refentry>
<xsl:param name="preferred.mediaobject.role"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="process.empty.source.toc">
<refmeta xmlns="">
<refentrytitle>process.empty.source.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>process.empty.source.toc</refname>
<refpurpose>Generate automated TOC if <tag>toc</tag> element occurs in a source document?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies that if an empty <tag>toc</tag> element is found in a
source document, an automated TOC is generated at this point in the
document.
<note>
  <para>Depending on what the value of the
  <parameter>generate.toc</parameter> parameter is, setting this
  parameter to <literal>1</literal> could result in generation of
  duplicate automated TOCs. So the
  <parameter>process.empty.source.toc</parameter> is primarily useful
  as an "override": by placing an empty <tag>toc</tag> in your
  document and setting this parameter to <literal>1</literal>, you can
  force a TOC to be generated even if <tag>generate.toc</tag>
  says not to.</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="process.empty.source.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="process.source.toc">
<refmeta xmlns="">
<refentrytitle>process.source.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>process.source.toc</refname>
<refpurpose>Process a non-empty <tag>toc</tag> element if it occurs in a source document?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies that the contents of a non-empty "hard-coded"
<tag>toc</tag> element in a source document are processed to
generate a TOC in output.
<note>
  <para>This parameter has no effect on automated generation of
  TOCs. An automated TOC may still be generated along with the
  "hard-coded" TOC. To suppress automated TOC generation, adjust the
  value of the <parameter>generate.toc</parameter> paramameter.</para>

  <para>The <tag>process.source.toc</tag> parameter also has
  no effect if the <tag>toc</tag> element is empty; handling
  for empty <tag>toc</tag> is controlled by the
  <parameter>process.empty.source.toc</parameter> parameter.</para>
</note>
</para>

</refsection>
</doc:refentry>
<xsl:param name="process.source.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.arch">
<refmeta xmlns="">
<refentrytitle>profile.arch</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.arch</refname>
<refpurpose>Target profile for <tag class="attribute">arch</tag>
attribute</refpurpose>
</refnamediv>




<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.arch"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.audience">
<refmeta xmlns="">
<refentrytitle>profile.audience</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.audience</refname>
<refpurpose>Target profile for <tag class="attribute">audience</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.audience"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.attribute">
<refmeta xmlns="">
<refentrytitle>profile.attribute</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.attribute</refname>
<refpurpose>Name of user-specified profiling attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter is used in conjuction with
<parameter>profile.value</parameter>.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.attribute"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.condition">
<refmeta xmlns="">
<refentrytitle>profile.condition</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.condition</refname>
<refpurpose>Target profile for <tag class="attribute">condition</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.condition"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.conformance">
<refmeta xmlns="">
<refentrytitle>profile.conformance</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.conformance</refname>
<refpurpose>Target profile for <tag class="attribute">conformance</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.conformance"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.lang">
<refmeta xmlns="">
<refentrytitle>profile.lang</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.lang</refname>
<refpurpose>Target profile for <tag class="attribute">lang</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.lang"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.os">
<refmeta xmlns="">
<refentrytitle>profile.os</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.os</refname>
<refpurpose>Target profile for <tag class="attribute">os</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.os"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.revision">
<refmeta xmlns="">
<refentrytitle>profile.revision</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.revision</refname>
<refpurpose>Target profile for <tag class="attribute">revision</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.revision"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.revisionflag">
<refmeta xmlns="">
<refentrytitle>profile.revisionflag</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.revisionflag</refname>
<refpurpose>Target profile for <tag class="attribute">revisionflag</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.revisionflag"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.role">
<refmeta xmlns="">
<refentrytitle>profile.role</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.role</refname>
<refpurpose>Target profile for <tag class="attribute">role</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

<warning>
<para>Note that <tag class="attribute">role</tag> is often
used for other purposes than profiling. For example it is commonly
used to get emphasize in bold font:</para>

<programlisting>&lt;emphasis role="bold"&gt;very important&lt;/emphasis&gt;</programlisting>

<para>If you are using <tag class="attribute">role</tag> for
these purposes do not forget to add values like <literal>bold</literal> to
value of this parameter. If you forgot you will get document with
small pieces missing which are very hard to track.</para>

<para>For this reason it is not recommended to use <tag class="attribute">role</tag> attribute for profiling. You should
rather use profiling specific attributes like <tag class="attribute">userlevel</tag>, <tag class="attribute">os</tag>, <tag class="attribute">arch</tag>, <tag class="attribute">condition</tag>, etc.</para>
</warning>

</refsection>
</doc:refentry>
<xsl:param name="profile.role"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.security">
<refmeta xmlns="">
<refentrytitle>profile.security</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.security</refname>
<refpurpose>Target profile for <tag class="attribute">security</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.security"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.separator">
<refmeta xmlns="">
<refentrytitle>profile.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.separator</refname>
<refpurpose>Separator character for compound profile values</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Separator character used for compound profile values. See <parameter>profile.arch</parameter></para>

</refsection>
</doc:refentry>
<xsl:param name="profile.separator">;</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.status">
<refmeta xmlns="">
<refentrytitle>profile.status</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.status</refname>
<refpurpose>Target profile for <tag class="attribute">status</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.status"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.userlevel">
<refmeta xmlns="">
<refentrytitle>profile.userlevel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.userlevel</refname>
<refpurpose>Target profile for <tag class="attribute">userlevel</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.userlevel"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.value">
<refmeta xmlns="">
<refentrytitle>profile.value</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.value</refname>
<refpurpose>Target profile for user-specified attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When you are using this parameter you must also specify name of
profiling attribute with parameter
<parameter>profile.attribute</parameter>.</para>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.value"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.vendor">
<refmeta xmlns="">
<refentrytitle>profile.vendor</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.vendor</refname>
<refpurpose>Target profile for <tag class="attribute">vendor</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.vendor"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="profile.wordsize">
<refmeta xmlns="">
<refentrytitle>profile.wordsize</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>profile.wordsize</refname>
<refpurpose>Target profile for <tag class="attribute">wordsize</tag>
attribute</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The value of this parameter specifies profiles which should be
included in the output. You can specify multiple profiles by
separating them by semicolon. You can change separator character by
<parameter>profile.separator</parameter>
parameter.</para>

<para>This parameter has effect only when you are using profiling
stylesheets (<filename>profile-docbook.xsl</filename>,
<filename>profile-chunk.xsl</filename>, …) instead of normal
ones (<filename>docbook.xsl</filename>,
<filename>chunk.xsl</filename>, …).</para>

</refsection>
</doc:refentry>
<xsl:param name="profile.wordsize"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="punct.honorific">
<refmeta xmlns="">
<refentrytitle>punct.honorific</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>punct.honorific</refname>
<refpurpose>Punctuation after an honorific in a personal name.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>This parameter specifies the punctuation that should be added after an
honorific in a personal name.</para>

</refsection>
</doc:refentry>
<xsl:param name="punct.honorific">.</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.defaultlabel">
<refmeta xmlns="">
<refentrytitle>qanda.defaultlabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">number</refmiscinfo>
<refmiscinfo class="other" otherclass="value">qanda</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>qanda.defaultlabel</refname>
<refpurpose>Sets the default for defaultlabel on QandASet.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If no <literal>defaultlabel</literal> attribute is specified on
a <tag>qandaset</tag>, this value is used. It must be one of the legal
values for the defaultlabel attribute, one from none, number or
qanda. The default value is 'number'.
</para>
<para>Meaning</para>
<para>qanda -   <tag>question</tag>s are labeled “Q:” and <tag>answer</tag>s are labeled “A:”. </para>
<para>number -    The entries are enumerated. </para>
<para>none -    No distinguishing label precedes Questions or Answers. 

</para>





</refsection>
</doc:refentry>
<xsl:param name="qanda.defaultlabel">number</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.inherit.numeration">
<refmeta xmlns="">
<refentrytitle>qanda.inherit.numeration</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>qanda.inherit.numeration</refname>
<refpurpose>Does enumeration of QandASet components inherit the numeration of parent elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, numbered <tag>qandadiv</tag> elements and
<tag>question</tag> and <tag>answer</tag> inherit the enumeration of
the ancestors of the <tag>qandaset</tag>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.inherit.numeration" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.in.toc">
<refmeta xmlns="">
<refentrytitle>qanda.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>qanda.in.toc</refname>
<refpurpose>Should qandaentry questions appear in 
the document table of contents?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true (non-zero), then the generated table of contents
for a document will include <tag>qandaset</tag> titles, 
<tag>qandadiv</tag> titles,
and <tag>question</tag> elements.  The default value (zero) excludes
them from the TOC.
</para>
<para>This parameter does not affect any tables of contents
that may be generated inside a qandaset or qandadiv.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qanda.nested.in.toc">
<refmeta xmlns="">
<refentrytitle>qanda.nested.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>qanda.nested.in.toc</refname>
<refpurpose>Should nested answer/qandaentry instances appear in TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, instances of <tag>qandaentry</tag>
that are children of <tag>answer</tag> elements are shown in
the TOC.</para>

</refsection>
</doc:refentry>
<xsl:param name="qanda.nested.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="qandadiv.autolabel">
<refmeta xmlns="">
<refentrytitle>qandadiv.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>qandadiv.autolabel</refname>
<refpurpose>Are divisions in QAndASets enumerated?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, unlabeled qandadivs will be enumerated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="qandadiv.autolabel" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.generate.name">
<refmeta xmlns="">
<refentrytitle>refentry.generate.name</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>refentry.generate.name</refname>
<refpurpose>Output NAME header before 'RefName'(s)?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, a "NAME" section title is output before the list
of 'RefName's. This parameter and
<parameter>refentry.generate.title</parameter> are mutually
exclusive. This means that if you change this parameter to zero, you
should set <parameter>refentry.generate.title</parameter> to non-zero unless
you want get quite strange output.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.generate.name" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.generate.title">
<refmeta xmlns="">
<refentrytitle>refentry.generate.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>refentry.generate.title</refname>
<refpurpose>Output title before 'RefName'(s)?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the reference page title or first name is
output before the list of 'RefName's. This parameter and
<parameter>refentry.generate.name</parameter> are mutually exclusive.
This means that if you change this parameter to non-zero, you
should set <parameter>refentry.generate.name</parameter> to zero unless
you want get quite strange output.</para>


</refsection>
</doc:refentry>
<xsl:param name="refentry.generate.title" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.separator">
<refmeta xmlns="">
<refentrytitle>refentry.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>refentry.separator</refname>
<refpurpose>Generate a separator between consecutive RefEntry elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true, a separator will be generated between consecutive
reference pages.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.separator" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refentry.xref.manvolnum">
<refmeta xmlns="">
<refentrytitle>refentry.xref.manvolnum</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>refentry.xref.manvolnum</refname>
<refpurpose>Output <tag>manvolnum</tag> as part of 
<tag>refentry</tag> cross-reference?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>if non-zero, the <tag>manvolnum</tag> is used when cross-referencing
<tag>refentry</tag>s, either with <tag>xref</tag>
or <tag>citerefentry</tag>.
</para>

</refsection>
</doc:refentry>
<xsl:param name="refentry.xref.manvolnum" select="1"/>
  
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="reference.autolabel">
<refmeta xmlns="">
<refentrytitle>reference.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">0<alt>none</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>reference.autolabel</refname>
<refpurpose>Specifies the labeling format for Reference titles</refpurpose>
</refnamediv>

<refsection xmlns=""><info><title>Description</title></info>
<para>If non-zero, references will be numbered using the parameter
  value as the number format if the value matches one of the
  following:
</para>
<variablelist>
  <varlistentry>
    <term>1 or arabic</term>
    <listitem>
      <para>Arabic numeration (1, 2, 3 ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>A or upperalpha</term>
    <listitem>
      <para>Uppercase letter numeration (A, B, C ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>a or loweralpha</term>
    <listitem>
      <para>Lowercase letter numeration (a, b, c ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>I or upperroman</term>
    <listitem>
      <para>Uppercase roman numeration (I, II, III ...).</para>
    </listitem>
  </varlistentry>
  <varlistentry>
    <term>i or lowerroman</term>
    <listitem>
      <para>Lowercase roman letter numeration (i, ii, iii ...).</para>
    </listitem>
  </varlistentry>
</variablelist>
<para>Any non-zero value other than the above will generate
the default number format (upperroman).
</para>
</refsection>
</doc:refentry>
<xsl:param name="reference.autolabel">I</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="refclass.suppress">
<refmeta xmlns="">
<refentrytitle>refclass.suppress</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>refclass.suppress</refname>
<refpurpose>Suppress display of refclass contents?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If the value of <parameter>refclass.suppress</parameter> is
non-zero, then display of <tag>refclass</tag> contents is
suppressed in output.</para>

</refsection>
</doc:refentry>
<xsl:param name="refclass.suppress" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="root.filename">
<refmeta xmlns="">
<refentrytitle>root.filename</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>root.filename</refname>
<refpurpose>Identifies the name of the root HTML file when chunking</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>root.filename</parameter> is the base filename for
the chunk created for the root of each document processed.
</para>

</refsection>
</doc:refentry>
<xsl:param name="root.filename">index</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="rootid">
<refmeta xmlns="">
<refentrytitle>rootid</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>rootid</refname>
<refpurpose>Specify the root element to format</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>rootid</parameter> is not empty, it must be the
value of an ID that occurs in the document being formatted. The entire
document will be loaded and parsed, but formatting will begin at the
element identified, rather than at the root. For example, this allows
you to process only <tag>chapter</tag> 4 of a <tag>book</tag>.</para>
<para>Because the entire document is available to the processor, automatic
numbering, cross references, and other dependencies are correctly
resolved.</para>

</refsection>
</doc:refentry>
<xsl:param name="rootid"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="runinhead.default.title.end.punct">
<refmeta xmlns="">
<refentrytitle>runinhead.default.title.end.punct</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>runinhead.default.title.end.punct</refname>
<refpurpose>Default punctuation character on a run-in-head</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, For a <tag>formalpara</tag>, use the specified
string as the separator between the title and following text. The period is the default value.</para>

</refsection>
</doc:refentry>
<xsl:param name="runinhead.default.title.end.punct">.</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="runinhead.title.end.punct">
<refmeta xmlns="">
<refentrytitle>runinhead.title.end.punct</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>runinhead.title.end.punct</refname>
<refpurpose>Characters that count as punctuation on a run-in-head</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specify which characters are to be counted as punctuation. These
characters are checked for a match with the last character of the
title. If no match is found, the
<parameter>runinhead.default.title.end.punct</parameter> contents are
inserted. This is to avoid duplicated punctuation in the output.
</para>

</refsection>
</doc:refentry>
<xsl:param name="runinhead.title.end.punct">.!?:</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.autolabel">
<refmeta xmlns="">
<refentrytitle>section.autolabel</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>section.autolabel</refname>
<refpurpose>Are sections enumerated?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If true (non-zero), unlabeled sections will be enumerated.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.autolabel" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.autolabel.max.depth">
<refmeta xmlns="">
<refentrytitle>section.autolabel.max.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>section.autolabel.max.depth</refname>
<refpurpose>The deepest level of sections that are numbered.</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When section numbering is turned on by the
<parameter>section.autolabel</parameter> parameter, then this
parameter controls the depth of <tag>section</tag> nesting that is
numbered.  Sections nested to a level deeper than this value will not
be numbered.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.autolabel.max.depth">8</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="section.label.includes.component.label">
<refmeta xmlns="">
<refentrytitle>section.label.includes.component.label</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>section.label.includes.component.label</refname>
<refpurpose>Do section labels include the component label?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, section labels are prefixed with the label of the
component that contains them.
</para>

</refsection>
</doc:refentry>
<xsl:param name="section.label.includes.component.label" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="segmentedlist.as.table">
<refmeta xmlns="">
<refentrytitle>segmentedlist.as.table</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>segmentedlist.as.table</refname>
<refpurpose>Format segmented lists as tables?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, <tag>segmentedlist</tag>s will be formatted as
tables.</para>

</refsection>
</doc:refentry>
<xsl:param name="segmentedlist.as.table" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="shade.verbatim">
<refmeta xmlns="">
<refentrytitle>shade.verbatim</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>shade.verbatim</refname>
<refpurpose>Should verbatim environments be shaded?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>In the FO stylesheet, if this parameter is non-zero then the
<property>shade.verbatim.style</property> properties will be applied
to verbatim environments.</para>

<para>In the HTML stylesheet, this parameter is now deprecated. Use
CSS instead.</para>

</refsection>
</doc:refentry>
<xsl:param name="shade.verbatim" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="shade.verbatim.style">
<refmeta xmlns="">
<refentrytitle>shade.verbatim.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">attribute set</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>shade.verbatim.style</refname>
<refpurpose>Properties that specify the style of shaded verbatim listings</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Properties that specify the style of shaded verbatim listings. The
parameters specified (the border and background color) are added to
the styling of the xsl-fo output. A border might be specified as "thin
black solid" for example. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/2004/WD-xsl11-20041216/#border">xsl-fo</link></para>

</refsection>
</doc:refentry>
<xsl:attribute-set name="shade.verbatim.style">
  <xsl:attribute name="border">0</xsl:attribute>
  <xsl:attribute name="bgcolor">#E0E0E0</xsl:attribute>
</xsl:attribute-set>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="show.comments">
<refmeta xmlns="">
<refentrytitle>show.comments</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>show.comments</refname>
<refpurpose>Display <tag>remark</tag> elements?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, comments will be displayed, otherwise they
are suppressed.  Comments here refers to the <tag>remark</tag> element
(which was called <literal>comment</literal> prior to DocBook
4.0), not XML comments (&lt;-- like this --&gt;) which are
unavailable.
</para>

</refsection>
</doc:refentry>
<xsl:param name="show.comments" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="show.revisionflag">
<refmeta xmlns="">
<refentrytitle>show.revisionflag</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>show.revisionflag</refname>
<refpurpose>Enable decoration of elements that have a revisionflag</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If <parameter>show.revisionflag</parameter> is turned on, then the stylesheets
may produce additional markup designed to allow a CSS stylesheet to
highlight elements that have specific revisionflag settings.</para>

<para>The markup inserted will be usually be either a &lt;span&gt; or
&lt;div&gt; with an appropriate <literal>class</literal>
attribute. (The value of the class attribute will be the same as the
value of the revisionflag attribute). In some contexts, for example
tables, where extra markup would be structurally illegal, the class
attribute will be added to the appropriate container element.</para>

<para>In general, the stylesheets only test for revisionflag in contexts
where an importing stylesheet would have to redefine whole templates.
Most of the revisionflag processing is expected to be done by another
stylesheet, for example <filename>changebars.xsl</filename>.</para>

</refsection>
</doc:refentry>
<xsl:param name="show.revisionflag" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="simplesect.in.toc">
<refmeta xmlns="">
<refentrytitle>simplesect.in.toc</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>simplesect.in.toc</refname>
<refpurpose>Should <tag>simplesect</tag> elements appear in the TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, <tag>simplesect</tag>s will be included in the TOC.
</para>

</refsection>
</doc:refentry>
<xsl:param name="simplesect.in.toc" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="spacing.paras">
<refmeta xmlns="">
<refentrytitle>spacing.paras</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>spacing.paras</refname>
<refpurpose>Insert additional &lt;p&gt; elements for spacing?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When non-zero, additional, empty paragraphs are inserted in
several contexts (for example, around informal figures), to create a
more pleasing visual appearance in many browsers.
</para>

</refsection>
</doc:refentry>
<xsl:param name="spacing.paras" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="suppress.footer.navigation">
<refmeta xmlns="">
<refentrytitle>suppress.footer.navigation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>suppress.footer.navigation</refname>
<refpurpose>Disable footer navigation</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If non-zero, footer navigation will be suppressed.</para>

</refsection>
</doc:refentry>
<xsl:param name="suppress.footer.navigation">0</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="suppress.header.navigation">
<refmeta xmlns="">
<refentrytitle>suppress.header.navigation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>suppress.header.navigation</refname>
<refpurpose>Disable header navigation</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, header navigation will be suppressed.</para>

</refsection>
</doc:refentry>
<xsl:param name="suppress.header.navigation" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="suppress.navigation">
<refmeta xmlns="">
<refentrytitle>suppress.navigation</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>suppress.navigation</refname>
<refpurpose>Disable header and footer navigation</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
If non-zero, header and footer navigation will be suppressed.</para>

</refsection>
</doc:refentry>
<xsl:param name="suppress.navigation" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.borders.with.css">
<refmeta xmlns="">
<refentrytitle>table.borders.with.css</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.borders.with.css</refname>
<refpurpose>Use CSS to specify table, row, and cell borders?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, CSS will be used to draw table borders.
</para>

</refsection>
</doc:refentry>
<xsl:param name="table.borders.with.css" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.color">
<refmeta xmlns="">
<refentrytitle>table.cell.border.color</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">color</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.cell.border.color</refname>
<refpurpose>Specifies the border color of table cells</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set the color of table cell borders. If non-zero, the value is used
for the border coloration. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/CSS21/syndata.html#value-def-color">CSS</link>. A
<literal>color</literal> is either a keyword or a numerical RGB specification.
Keywords are aqua, black, blue, fuchsia, gray, green, lime, maroon,
navy, olive, orange, purple, red, silver, teal, white, and
yellow.</para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.color"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.style">
<refmeta xmlns="">
<refentrytitle>table.cell.border.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dotted</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dashed</refmiscinfo>
<refmiscinfo class="other" otherclass="value">double</refmiscinfo>
<refmiscinfo class="other" otherclass="value">groove</refmiscinfo>                       
<refmiscinfo class="other" otherclass="value">ridge</refmiscinfo>
<refmiscinfo class="other" otherclass="value">inset</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outset</refmiscinfo>          
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.cell.border.style</refname>
<refpurpose>Specifies the border style of table cells</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the border style of table cells.</para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.style">solid</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.cell.border.thickness">
<refmeta xmlns="">
<refentrytitle>table.cell.border.thickness</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.cell.border.thickness</refname>
<refpurpose>Specifies the thickness of table cell borders</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, specifies the thickness of borders on table
cells. The units are points. See <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.w3.org/TR/CSS21/box.html#border-width-properties">
CSS</link></para>

<note>
  <para>To control properties of cell borders in HTML output, you must also turn on the 
  <parameter>table.borders.with.css</parameter> parameter.</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="table.cell.border.thickness">0.5pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.footnote.number.format">
<refmeta xmlns="">
<refentrytitle>table.footnote.number.format</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">1<alt>1,2,3...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">A<alt>A,B,C...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">a<alt>a,b,c...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">i<alt>i,ii,iii...</alt></refmiscinfo>
<refmiscinfo class="other" otherclass="value">I<alt>I,II,III...</alt></refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.footnote.number.format</refname>
<refpurpose>Identifies the format used for footnote numbers in tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The <parameter>table.footnote.number.format</parameter> specifies the format
to use for footnote numeration (1, i, I, a, or A) in tables.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.footnote.number.format">a</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.footnote.number.symbols">
<refmeta xmlns="">
<refentrytitle>table.footnote.number.symbols</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.footnote.number.symbols</refname>
<refpurpose>Special characters to use a footnote markers in tables</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>table.footnote.number.symbols</parameter> is not the empty string,
table footnotes will use the characters it contains as footnote symbols. For example,
<quote>*&amp;#x2020;&amp;#x2021;&amp;#x25CA;&amp;#x2720;</quote> will identify
footnotes with <quote>*</quote>, <quote>†</quote>, <quote>‡</quote>,
<quote>◊</quote>, and <quote>✠</quote>. If there are more footnotes
than symbols, the stylesheets will fall back to numbered footnotes using
<parameter>table.footnote.number.format</parameter>.</para>

<para>The use of symbols for footnotes depends on the ability of your
processor (or browser) to render the symbols you select. Not all systems are
capable of displaying the full range of Unicode characters. If the quoted characters
in the preceding paragraph are not displayed properly, that's a good indicator
that you may have trouble using those symbols for footnotes.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.footnote.number.symbols"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.color">
<refmeta xmlns="">
<refentrytitle>table.frame.border.color</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">color</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.frame.border.color</refname>
<refpurpose>Specifies the border color of table frames</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the border color of table frames.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.color"/>


<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.style">
<refmeta xmlns="">
<refentrytitle>table.frame.border.style</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">none</refmiscinfo>
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dotted</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dashed</refmiscinfo>
<refmiscinfo class="other" otherclass="value">double</refmiscinfo>
<refmiscinfo class="other" otherclass="value">groove</refmiscinfo>                       
<refmiscinfo class="other" otherclass="value">ridge</refmiscinfo>
<refmiscinfo class="other" otherclass="value">inset</refmiscinfo>
<refmiscinfo class="other" otherclass="value">outset</refmiscinfo>          
<refmiscinfo class="other" otherclass="value">solid</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.frame.border.style</refname>
<refpurpose>Specifies the border style of table frames</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the border style of table frames.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.style">solid</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="table.frame.border.thickness">
<refmeta xmlns="">
<refentrytitle>table.frame.border.thickness</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">length</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>table.frame.border.thickness</refname>
<refpurpose>Specifies the thickness of the frame border</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the thickness of the border on the table's frame.</para>

</refsection>
</doc:refentry>
<xsl:param name="table.frame.border.thickness">0.5pt</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tablecolumns.extension">
<refmeta xmlns="">
<refentrytitle>tablecolumns.extension</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>tablecolumns.extension</refname>
<refpurpose>Enable the table columns extension function</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>The table columns extension function adjusts the widths of table
columns in the HTML result to more accurately reflect the specifications
in the CALS table.
</para>

</refsection>
</doc:refentry>
<xsl:param name="tablecolumns.extension" select="1"/>
 
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="target.database.document"> 
<refmeta xmlns=""> 
<refentrytitle>target.database.document</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">uri</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>target.database.document</refname> 
<refpurpose>Name of master database file for resolving
olinks</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info>
 
<para>
To resolve olinks between documents, the stylesheets use a master
database document that identifies the target datafiles for all the
documents within the scope of the olinks. This parameter value is the
URI of the master document to be read during processing to resolve
olinks.  The default value is <filename>olinkdb.xml</filename>.</para>

<para>The data structure of the file is defined in the
<filename>targetdatabase.dtd</filename> DTD.  The database file
provides the high level elements to record the identifiers, locations,
and relationships of documents. The cross reference data for
individual documents is generally pulled into the database using
system entity references or XIncludes. See also
<parameter>targets.filename</parameter>.  </para> </refsection>
</doc:refentry>
<xsl:param name="target.database.document">olinkdb.xml</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="targets.filename"> 
<refmeta xmlns=""> 
<refentrytitle>targets.filename</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>targets.filename</refname> 
<refpurpose>Name of cross reference targets data file</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info>
 
<para>
In order to resolve olinks efficiently, the stylesheets can
generate an external data file containing information about
all potential cross reference endpoints in a document.
This parameter lets you change the name of the generated
file from the default name <filename>target.db</filename>.
The name must agree with that used in the target database
used to resolve olinks during processing.
See also <parameter>target.database.document</parameter>.
</para> 
</refsection> 
</doc:refentry>
<xsl:param name="targets.filename">target.db</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="textdata.default.encoding">
<refmeta xmlns="">
<refentrytitle>textdata.default.encoding</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>textdata.default.encoding</refname>
<refpurpose>Default encoding of external text files which are included
using textdata element</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the encoding of any external text files included using
<tag>textdata</tag> element. This value is used only when you do
not specify encoding by the appropriate attribute 
directly on textdata. An empty string is interpreted as the system
default encoding.</para>

</refsection>
</doc:refentry>
<xsl:param name="textdata.default.encoding"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tex.math.delims">
<refmeta xmlns="">
<refentrytitle>tex.math.delims</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>tex.math.delims</refname>
<refpurpose>Should equations output for processing by TeX be
surrounded by math mode delimiters?</refpurpose>
</refnamediv> 



<refsection xmlns=""><info><title>Description</title></info>

<para>For compatibility with DSSSL based DBTeXMath from Allin Cottrell
you should set this parameter to 0.</para>

</refsection>
<refsection xmlns=""><info><title>Related Parameters</title></info>
  <para><parameter>tex.math.in.alt</parameter>,
    <parameter>passivetex.extensions</parameter></para>
</refsection>

<refsection xmlns=""><info><title>See Also</title></info>
  <para>You can also use the <tag class="xmlpi">dbtex delims</tag> processing
    instruction to control whether delimiters are output.</para>
</refsection>
<refsection xmlns=""><info><title>More information</title></info>
  <para>For how-to documentation on embedding TeX equations and
    generating output from them, see
    <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="TexMath.html">DBTeXMath</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="tex.math.delims" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tex.math.file">
<refmeta xmlns="">
<refentrytitle>tex.math.file</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>tex.math.file</refname>
<refpurpose>Name of temporary file for generating images from equations</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Name of auxiliary file for TeX equations. This file can be
processed by dvi2bitmap to get bitmap versions of equations for HTML
output.</para>

</refsection>
<refsection xmlns=""><info><title>Related Parameters</title></info>
  <para><parameter>tex.math.in.alt</parameter>,
    <parameter>tex.math.delims</parameter>,
  </para>
</refsection>
<refsection xmlns=""><info><title>More information</title></info>
  <para>For how-to documentation on embedding TeX equations and
    generating output from them, see
    <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="TexMath.html">DBTeXMath</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="tex.math.file">tex-math-equations.tex</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="tex.math.in.alt">
<refmeta xmlns="">
<refentrytitle>tex.math.in.alt</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo> 
<refmiscinfo class="other" otherclass="value">plain</refmiscinfo>
<refmiscinfo class="other" otherclass="value">latex</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>tex.math.in.alt</refname>
<refpurpose>TeX notation used for equations</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If you want type math directly in TeX notation in equations,
this parameter specifies notation used. Currently are supported two
values -- <literal>plain</literal> and <literal>latex</literal>. Empty
value means that you are not using TeX math at all.</para>

<para>Preferred way for including TeX alternative of math is inside of
<tag>textobject</tag> element. Eg.:</para>

<programlisting>&lt;inlineequation&gt;
&lt;inlinemediaobject&gt;
&lt;imageobject&gt;
&lt;imagedata fileref="eq1.gif"/&gt;
&lt;/imageobject&gt;
&lt;textobject&gt;&lt;phrase&gt;E=mc squared&lt;/phrase&gt;&lt;/textobject&gt;
&lt;textobject role="tex"&gt;&lt;phrase&gt;E=mc^2&lt;/phrase&gt;&lt;/textobject&gt;
&lt;/inlinemediaobject&gt;
&lt;/inlineequation&gt;</programlisting>

<para>If you are using <tag>graphic</tag> element, you can
store TeX inside <tag>alt</tag> element:</para>

<programlisting>&lt;inlineequation&gt;
&lt;alt role="tex"&gt;a^2+b^2=c^2&lt;/alt&gt;
&lt;graphic fileref="a2b2c2.gif"/&gt;  
&lt;/inlineequation&gt;</programlisting>

<para>If you want use this feature, you should process your FO with
PassiveTeX, which only supports TeX math notation. When calling
stylsheet, don't forget to specify also
passivetex.extensions=1.</para>

<para>If you want equations in HTML, just process generated file
<filename>tex-math-equations.tex</filename> by TeX or LaTeX. Then run
dvi2bitmap program on result DVI file. You will get images for
equations in your document.</para>

<warning>
  <para>This feature is useful for print/PDF output only if you
    use the obsolete and now unsupported PassiveTeX XSL-FO
    engine.</para>
</warning>

</refsection>

<refsection xmlns=""><info><title>Related Parameters</title></info>
  <para><parameter>tex.math.delims</parameter>,
    <parameter>passivetex.extensions</parameter>,
    <parameter>tex.math.file</parameter></para>
</refsection>
<refsection xmlns=""><info><title>More information</title></info>
  <para>For how-to documentation on embedding TeX equations and
    generating output from them, see
    <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="TexMath.html">DBTeXMath</link>.</para>
</refsection>
</doc:refentry>
<xsl:param name="tex.math.in.alt"/>
  
<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="textinsert.extension">
  <refmeta xmlns="">
    <refentrytitle>textinsert.extension</refentrytitle>
    <refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
  </refmeta>
  <refnamediv xmlns="">
    <refname>textinsert.extension</refname>
    <refpurpose>Enables the textinsert extension element</refpurpose>
  </refnamediv>
  
  <refsection xmlns=""><info><title>Description</title></info>
    <para>The textinsert extension element inserts the contents of
      a file into the result tree (as text).</para>
    <note>
      <para>To use the textinsert extension element, you must use
        either Saxon or Xalan as your XSLT processor (it doesn’t
        work with xsltproc), along with either the DocBook Saxon
        extensions or DocBook Xalan extensions (for more
        information about those extensions, see <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InstallingAProcessor.html#SaxonExtensions">DocBook Saxon Extensions</link> and <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InstallingAProcessor.html#XalanExtensions">DocBook Xalan Extensions</link>), and you must set both
        the <parameter>use.extensions</parameter> and
        <parameter>textinsert.extension</parameter> parameters to
        <literal>1</literal>.</para>
      <para>As an alternative to using the textinsert element,
        consider using an Xinclude element with the
        <literal>parse="text"</literal> attribute and value
        specified, as detailed in <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="ExternalCode.html#XIncludeCode">Using XInclude for text inclusions</link>.</para>
    </note>
  </refsection>
  <refsection xmlns=""><info><title>See Also</title></info>
    <para>You can also use the <tag class="xmlpi">dbhtml-include href</tag> processing
      instruction to insert external files — both files containing
      plain text and files with markup content (including HTML
      content).</para>
  </refsection>
  <refsection xmlns=""><info><title>More information</title></info>
    <para>For how-to documentation on inserting contents of
      external code files and other text files into output, see
      <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="ExternalCode.html">External code files</link>.</para>
    <para>For guidelines on inserting contents of
      HTML files into output, see <link xmlns:xlink="http://www.w3.org/1999/xlink" role="tcg" xlink:href="InsertExtHtml.html">Inserting external HTML code</link>.</para>
  </refsection>
</doc:refentry>
<xsl:param name="textinsert.extension" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.list.type">
<refmeta xmlns="">
<refentrytitle>toc.list.type</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">list</refmiscinfo>
<refmiscinfo class="other" otherclass="value">dl</refmiscinfo>
<refmiscinfo class="other" otherclass="value">ul</refmiscinfo>
<refmiscinfo class="other" otherclass="value">ol</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>toc.list.type</refname>
<refpurpose>Type of HTML list element to use for Tables of Contents</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When an automatically generated Table of Contents (or List of Titles)
is produced, this HTML element will be used to make the list.
</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.list.type">dl</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.section.depth">
<refmeta xmlns="">
<refentrytitle>toc.section.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>toc.section.depth</refname>
<refpurpose>How deep should recursive <tag>section</tag>s appear
in the TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the depth to which recursive sections should appear in the
TOC.
</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.section.depth">2</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="toc.max.depth">
<refmeta xmlns="">
<refentrytitle>toc.max.depth</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">integer</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>toc.max.depth</refname>
<refpurpose>How many levels should be created for each TOC?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Specifies the maximal depth of TOC on all levels.</para>

</refsection>
</doc:refentry>
<xsl:param name="toc.max.depth">8</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="ulink.target">
<refmeta xmlns="">
<refentrytitle>ulink.target</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>ulink.target</refname>
<refpurpose>The HTML anchor target for ULinks</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>ulink.target</parameter> is non-zero, its value will
be used for the <literal>target</literal> attribute
on anchors generated for <tag>ulink</tag>s.</para>

</refsection>
</doc:refentry>
<xsl:param name="ulink.target">_top</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.embed.for.svg">
<refmeta xmlns="">
<refentrytitle>use.embed.for.svg</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.embed.for.svg</refname>
<refpurpose>Use HTML <tag>embed</tag> for SVG?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, an <tag>embed</tag> element will be created for
SVG figures. An <tag>object</tag> is <emphasis>always</emphasis> created,
this parameter merely controls whether or not an additional <tag>embed</tag>
is generated inside the <tag>object</tag>.</para>

<para>On the plus side, this may be more portable among browsers and plug-ins.
On the minus side, it isn't valid HTML.</para>

</refsection>
</doc:refentry>
<xsl:param name="use.embed.for.svg" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.extensions">
<refmeta xmlns="">
<refentrytitle>use.extensions</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.extensions</refname>
<refpurpose>Enable extensions</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, extensions may be used. Each extension is
further controlled by its own parameter. But if
<parameter>use.extensions</parameter> is zero, no extensions will
be used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="use.extensions" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.id.as.filename">
<refmeta xmlns="">
<refentrytitle>use.id.as.filename</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.id.as.filename</refname>
<refpurpose>Use ID value of chunk elements as the filename?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If <parameter>use.id.as.filename</parameter>
is non-zero, the filename of chunk elements that have IDs will be
derived from the ID value.
</para>

</refsection>
</doc:refentry>
<xsl:param name="use.id.as.filename" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.local.olink.style"> 
<refmeta xmlns=""> 
<refentrytitle>use.local.olink.style</refentrytitle> 
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo> 
</refmeta> 
<refnamediv xmlns=""> 
<refname>use.local.olink.style</refname> 
<refpurpose>Process olinks using xref style of current
document</refpurpose> 
</refnamediv> 
 
<refsection xmlns=""><info><title>Description</title></info> 
 
<para>When cross reference data is collected for use by olinks, the data for each potential target includes one field containing a completely assembled cross reference string, as if it were an xref generated in that document. Other fields record the separate title, number, and element name of each target. When an olink is formed to a target from another document, the olink resolves to that preassembled string by default. If the <parameter>use.local.olink.style</parameter> parameter is set to non-zero, then instead the cross
reference string is formed again from the target title, number, and
element name, using the stylesheet processing the targeting document.
Then olinks will match the xref style in the targeting document
rather than in the target document. If  both documents are processed
with the same stylesheet, then the results will be the same.</para> 
</refsection> 
</doc:refentry>
<xsl:param name="use.local.olink.style" select="0"/> 

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.role.as.xrefstyle">
<refmeta xmlns="">
<refentrytitle>use.role.as.xrefstyle</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.role.as.xrefstyle</refname>
<refpurpose>Use <tag class="attribute">role</tag> attribute for
<tag class="attribute">xrefstyle</tag> on <tag>xref</tag>?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the <tag class="attribute">role</tag> attribute on
<tag>xref</tag> will be used to select the cross reference style.
The <link xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="http://www.oasis-open.org/docbook/">DocBook
Technical Committee</link> recently added an
<tag class="attribute">xrefstyle</tag> attribute for this purpose.
If the <tag class="attribute">xrefstyle</tag> attribute
is present, <tag class="attribute">role</tag> will be ignored, regardless
of this setting.</para>

<para>Until an official DocBook release that includes the new
attribute, this flag allows <tag class="attribute">role</tag>
to serve that purpose.</para>

</refsection>

<refsection xmlns=""><info><title>Example</title></info>

<para>The following small stylesheet shows how to configure the
stylesheets to make use of the cross reference style:</para>

<programlisting>&lt;?xml version="1.0"?&gt;
&lt;xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0"&gt;

&lt;xsl:import href="../xsl/html/docbook.xsl"/&gt;

&lt;xsl:output method="html"/&gt;

&lt;xsl:param name="local.l10n.xml" select="document('')"/&gt;
&lt;l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0"&gt;
  &lt;l:l10n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0" language="en"&gt;
   &lt;l:context name="xref"&gt;
      &lt;l:template name="chapter" style="title" text="Chapter %n, %t"/&gt;
      &lt;l:template name="chapter" text="Chapter %n"/&gt;
    &lt;/l:context&gt;
  &lt;/l:l10n&gt;
&lt;/l:i18n&gt;

&lt;/xsl:stylesheet&gt;</programlisting>

<para>With this stylesheet, the cross references in the following document:</para>

<programlisting>&lt;?xml version="1.0" encoding="utf-8"?&gt;
&lt;!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.2//EN"
                  "http://www.oasis-open.org/docbook/xml/4.2/docbookx.dtd"&gt;
&lt;book id="book"&gt;&lt;title&gt;Book&lt;/title&gt;

&lt;preface&gt;
&lt;title&gt;Preface&lt;/title&gt;

&lt;para&gt;Normal: &lt;xref linkend="ch1"/&gt;.&lt;/para&gt;
&lt;para&gt;Title: &lt;xref xrefstyle="title" linkend="ch1"/&gt;.&lt;/para&gt;

&lt;/preface&gt;

&lt;chapter id="ch1"&gt;
&lt;title&gt;First Chapter&lt;/title&gt;

&lt;para&gt;Irrelevant.&lt;/para&gt;

&lt;/chapter&gt;
&lt;/book&gt;</programlisting>

<para>will appear as:</para>

<informalexample>
<para>Normal: Chapter 1.</para>
<para>Title: Chapter 1, <emphasis>First Chapter</emphasis>.</para>
</informalexample>
</refsection>

</doc:refentry>
<xsl:param name="use.role.as.xrefstyle" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.role.for.mediaobject">
<refmeta xmlns="">
<refentrytitle>use.role.for.mediaobject</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.role.for.mediaobject</refname>
<refpurpose>Use <tag class="attribute">role</tag> attribute 
value for selecting which of several objects within a mediaobject to use.
</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, the <tag class="attribute">role</tag> attribute on
<tag>imageobject</tag>s or other objects within a <tag>mediaobject</tag> container will be used to select which object will be
used.
</para>
<para>
The order of selection when then parameter is non-zero is:
</para>
<orderedlist>
<listitem>
    <para>If the stylesheet parameter <parameter>preferred.mediaobject.role</parameter> has a value, then the object whose role equals that value is selected.</para>
</listitem>
<listitem>
<para>Else if an object's role attribute has a value of
<literal>html</literal> for HTML processing or
<literal>fo</literal> for FO output, then the first
of such objects is selected.
</para>
</listitem>
<listitem>
<para>Else the first suitable object is selected.</para>
</listitem>
</orderedlist>
<para>
If the value of 
<parameter>use.role.for.mediaobject</parameter>
is zero, then role attributes are not considered
and the first suitable object
with or without a role value is used.
</para>
</refsection>
</doc:refentry>
<xsl:param name="use.role.for.mediaobject" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="use.svg">
<refmeta xmlns="">
<refentrytitle>use.svg</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>use.svg</refname>
<refpurpose>Allow SVG in the result tree?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, SVG will be considered an acceptable image format. SVG
is passed through to the result tree, so correct rendering of the resulting
diagram depends on the formatter (FO processor or web browser) that is used
to process the output from the stylesheet.</para>

</refsection>
</doc:refentry>
<xsl:param name="use.svg" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.as.table">
<refmeta xmlns="">
<refentrytitle>variablelist.as.table</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>variablelist.as.table</refname>
<refpurpose>Format <tag>variablelist</tag>s as tables?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>If non-zero, <tag>variablelist</tag>s will be formatted as
tables. A processing instruction exists to specify a particualar width for the 
column containing the <tag>term</tag>s:   
<tag class="xmlpi">dbhtml term-width=".25in"</tag></para>

<para>You can override this setting with a processing instruction as the
child of <tag>variablelist</tag>: <tag class="xmlpi">dbhtml
list-presentation="table"</tag> or <tag class="xmlpi">dbhtml
list-presentation="list"</tag>.</para>

<para>This parameter only applys to the HTML transformations. In the
FO case, proper list markup is robust enough to handle the formatting.
But see also <parameter>variablelist.as.blocks</parameter>.</para>

<programlisting>  &lt;variablelist&gt;
        &lt;?dbhtml list-presentation="table"?&gt;
        &lt;?dbhtml term-width="1.5in"?&gt;
        &lt;?dbfo list-presentation="list"?&gt;
        &lt;?dbfo term-width="1in"?&gt;
        &lt;varlistentry&gt;
          &lt;term&gt;list&lt;/term&gt;
          &lt;listitem&gt;
                &lt;para&gt;
                  Formatted as a table even if variablelist.as.table is set to 0.
                &lt;/para&gt;
          &lt;/listitem&gt;
        &lt;/varlistentry&gt;
  &lt;/variablelist&gt;</programlisting>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.as.table" select="0"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.term.separator">
<refmeta xmlns="">
<refentrytitle>variablelist.term.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>variablelist.term.separator</refname>
<refpurpose>Text to separate <tag>term</tag>s within a multi-term
<tag>varlistentry</tag></refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>When a <tag>varlistentry</tag> contains multiple <tag>term</tag>
elements, the string specified in the value of the
<parameter>variablelist.term.separator</parameter> parameter is placed
after each <tag>term</tag> except the last.</para>

<note>
  <para>To generate a line break between multiple <tag>term</tag>s in
  a <tag>varlistentry</tag>, set a non-zero value for the
  <parameter>variablelist.term.break.after</parameter> parameter. If
  you do so, you may also want to set the value of the
  <parameter>variablelist.term.separator</parameter> parameter to an
  empty string (to suppress rendering of the default comma and space
  after each <tag>term</tag>).</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.term.separator">, </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="variablelist.term.break.after">
<refmeta xmlns="">
<refentrytitle>variablelist.term.break.after</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>variablelist.term.break.after</refname>
<refpurpose>Generate line break after each <tag>term</tag> within a
multi-term <tag>varlistentry</tag>?</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>Set a non-zero value for the
<parameter>variablelist.term.break.after</parameter> parameter to
generate a line break between <tag>term</tag>s in a
multi-term <tag>varlistentry</tag>.</para>

<note>
<para>If you set a non-zero value for
<parameter>variablelist.term.break.after</parameter>, you may also
want to set the value of the
<parameter>variablelist.term.separator</parameter> parameter to an
empty string (to suppress rendering of the default comma and space
after each <tag>term</tag>).</para>
</note>

</refsection>
</doc:refentry>
<xsl:param name="variablelist.term.break.after">0</xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.with.number.and.title">
<refmeta xmlns="">
<refentrytitle>xref.with.number.and.title</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">boolean</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>xref.with.number.and.title</refname>
<refpurpose>Use number and title in cross references</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>A cross reference may include the number (for example, the number of
an example or figure) and the <tag>title</tag> which is a required child of some
targets. This parameter inserts both the relevant number as well as
the title into the link. </para>

</refsection>
</doc:refentry>
<xsl:param name="xref.with.number.and.title" select="1"/>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.label-title.separator">
<refmeta xmlns="">
<refentrytitle>xref.label-title.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>xref.label-title.separator</refname>
<refpurpose>Punctuation or space separating label from title in xref</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both label and title,
then the value of this parameter is inserted between
label and title in the output.  
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.label-title.separator">: </xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.label-page.separator">
<refmeta xmlns="">
<refentrytitle>xref.label-page.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>xref.label-page.separator</refname>
<refpurpose>Punctuation or space separating label from page number in xref</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both label and page
but no title,
then the value of this parameter is inserted between
label and page number in the output.  
If a title is included, then other separators are used.
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.label-page.separator"><xsl:text> </xsl:text></xsl:param>

<doc:refentry xmlns:doc="http://nwalsh.com/xsl/documentation/1.0" id="xref.title-page.separator">
<refmeta xmlns="">
<refentrytitle>xref.title-page.separator</refentrytitle>
<refmiscinfo class="other" otherclass="datatype">string</refmiscinfo>
</refmeta>
<refnamediv xmlns="">
<refname>xref.title-page.separator</refname>
<refpurpose>Punctuation or space separating title from page number in xref</refpurpose>
</refnamediv>



<refsection xmlns=""><info><title>Description</title></info>

<para>
This parameter allows you to control the punctuation of certain
types of generated cross reference text.
When cross reference text is generated for an 
<tag class="element">xref</tag> or 
<tag class="element">olink</tag> element
using an <tag class="attribute">xrefstyle</tag> attribute
that makes use of the <literal>select:</literal> feature,
and the selected components include both title and page number,
then the value of this parameter is inserted between
title and page number in the output.  
</para>

</refsection>
</doc:refentry>
<xsl:param name="xref.title-page.separator"><xsl:text> </xsl:text></xsl:param>

</xsl:stylesheet>