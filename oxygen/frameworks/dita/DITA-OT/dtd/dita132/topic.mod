<!--
 | (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ELEMENTS DITA Topic//EN"
 |
 | Release history (vrm):
 |   1.0.0 Initial release on developerWorks, March 2001 (dita00.zip)
 |   1.0.1 fix 1 on developerWorks, October 2001 (dita01.zip)
 |   1.0.2 consolidated redesign December 2001
 |   1.0.3 fix 1, dtd freeze for UCD-1 January 2002
 |   1.1.0 Release 1 March 2002 (dita10.zip)
 |   1.1.1 Release 1.1 December 2002
 |   1.1.2 Release 1.2 June 2003
 |   1.1.3 Release 1.3 March 2004: bug fixes and map updates
 |   1.1.3a bug fix: cut keyword def from meta_xml; paste into topic.mod unchanged, put into map.mod with no tm
 *-->
<!ENTITY DTDVersion 'V1.1.3' >



<!-- 
 | Processing Notes:
 | - The class attribute has an impliable value to allow generalization (being able to maintain the
 |   "history" of what an element was derived from when generalized); the memory allows either
 |   respecialization back to original form, or possibly a more useful migration into a different
 |   domain or infotyped topic.
 |
 | - Links and xrefs have these documented target types (for @type):
 |    link types: topic | concept | task | reference | external | local
 |    xref types: same as link, plus: fig | figgroup | table | li | fn | section
 |
 | - The relcolwidth attribute takes full, relative specifications with no units.
 |   That is, "85* 15*" is valid; "85 15" is not.
 |
 +-->

<!-- =========================================================================== -->
<!-- COMMON ENTITY DECLARATIONS ================================================ -->
<!-- =========================================================================== -->
<!-- ============ definitions of declared elements ============ -->
<!ENTITY % topicDefns PUBLIC "-//IBM//ENTITIES DITA Topic Definitions//EN" "topic_defn.ent">
  %topicDefns;


<!-- Phrase or inline elements of various classes -->
<!ENTITY % basic.ph             "%ph;|%term;|%xref;|%cite;|%q;|%boolean;|%state;|%keyword;|%tm;">

<!-- Elements common to most body-like contexts -->
<!ENTITY % basic.block          "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
   <!-- class groupings to preserve in a schema -->

<!ENTITY % basic.phandblock     "%basic.ph; | %basic.block;">


<!-- Exclusions: models modified by removing excluded content -->
<!ENTITY % basic.ph.noxref      "%ph;|%term;|              %q;|%boolean;|%state;|%keyword;|%tm;">
<!ENTITY % basic.ph.notm        "%ph;|%term;|%xref;|%cite;|%q;|%boolean;|%state;|%keyword;">


<!ENTITY % basic.block.notbl     "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;">
<!ENTITY % basic.block.nonote    "%p;|%lq;|       %dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.nopara    "    %lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.nolq      "%p;|     %note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.notbnofg  "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|      %image;|%object;">
<!ENTITY % basic.block.notbfgobj "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|      %image;">


<!-- Inclusions: defined sets that can be added into appropriate models -->
<!ENTITY % txt.incl             '%draft-comment;|%required-cleanup;|%fn;|%indextermref;|%indexterm;'>

<!-- Predefined content model groups, based on the previous, element-only categories: -->
<!-- txt.incl is appropriate for any mixed content definitions (those that have PCDATA) -->
<!-- the context for blocks is implicitly an InfoMaster "containing_division" -->
<!ENTITY % body.cnt             "%basic.block; | %required-cleanup;">
<!ENTITY % section.cnt          "#PCDATA | %basic.ph; | %basic.block; | %title; |  %txt.incl;">
<!ENTITY % section.notitle.cnt  "#PCDATA | %basic.ph; | %basic.block; |             %txt.incl;">
<!ENTITY % listitem.cnt         "#PCDATA | %basic.ph; | %basic.block; |%itemgroup;| %txt.incl;">
<!ENTITY % itemgroup.cnt        "#PCDATA | %basic.ph; | %basic.block; |             %txt.incl;">
<!ENTITY % title.cnt            "#PCDATA | %basic.ph.noxref; | %image;">
<!ENTITY % xreftext.cnt         "#PCDATA | %basic.ph.noxref; | %image;">
<!ENTITY % xrefph.cnt           "#PCDATA | %basic.ph.noxref;">
<!ENTITY % shortquote.cnt       "#PCDATA | %basic.ph;">
<!ENTITY % para.cnt             "#PCDATA | %basic.ph; | %basic.block.nopara; | %txt.incl;">
<!ENTITY % note.cnt             "#PCDATA | %basic.ph; | %basic.block.nonote; | %txt.incl;">
<!ENTITY % longquote.cnt        "#PCDATA | %basic.ph; | %basic.block.nolq;   | %txt.incl;">
<!ENTITY % tblcell.cnt          "#PCDATA | %basic.ph; | %basic.block.notbl;  | %txt.incl;">
<!ENTITY % desc.cnt             "#PCDATA | %basic.ph; | %basic.block.notbfgobj;">
<!ENTITY % ph.cnt               "#PCDATA | %basic.ph; | %image;              | %txt.incl;">
<!ENTITY % fn.cnt               "#PCDATA | %basic.ph; | %basic.block.notbl;">
<!ENTITY % term.cnt             "#PCDATA | %basic.ph; | %image;">
<!ENTITY % defn.cnt             "%listitem.cnt;">
<!ENTITY % pre.cnt              "#PCDATA | %basic.ph; | %txt.incl;">
<!ENTITY % fig.cnt              "%basic.block.notbnofg; | %simpletable;">
<!ENTITY % words.cnt            "#PCDATA | %keyword; | %term;">

<!-- COMMON ENTITY DECLARATIONS =================================== -->
<!-- for use within the DTD and supported topics; these will NOT work
     outside of this DTD or dtds that specialize from it! -->
<!ENTITY nbsp "&#160;">


<!-- NOTATION DECLARATIONS =================================== -->
<!-- DITA uses the direct reference model; notations may be added later as required -->


<!-- STRUCTURAL MEMBERS ======================================================== -->
  <!-- things that can be nested under topic after body - redefined when specializing -->
<!ENTITY % topicreftypes 'topic | concept | task | reference | external | local'>
<!ENTITY % info-types     'topic'> <!-- include zone -->


<!-- COMMON ATTLIST SETS ========================================== -->

<!-- imply datatypes for particular attribute values -->

<!ENTITY % date-format   'CDATA'>


<!-- these are common for some classes of resources and exhibits -->

<!ENTITY % rel-atts      'type CDATA #IMPLIED
                          role (parent|child|sibling|friend|next|previous|cousin|ancestor|descendant|sample|external|other) #IMPLIED
                          otherrole CDATA #IMPLIED'
>
<!ENTITY % display-atts  'scale (50|60|70|80|90|100|110|120|140|160|180|200) #IMPLIED
                          frame (top | bottom |topbot | all | sides | none) #IMPLIED
                          expanse (page|column|textline) #IMPLIED'
>
<!ENTITY % select-atts   'platform CDATA #IMPLIED
                          product CDATA #IMPLIED
                          audience CDATA #IMPLIED
                          otherprops CDATA #IMPLIED
                          importance ( obsolete | deprecated | optional | default | low | normal | high | recommended | required | urgent ) #IMPLIED
                          rev CDATA #IMPLIED
                          status (new|changed|deleted|unchanged) #IMPLIED'
>

<!ENTITY % id-atts       'id NMTOKEN #IMPLIED
                          conref CDATA #IMPLIED'
>
<!ENTITY % univ-atts     '%id-atts;
                          %select-atts;
                          translate (yes|no) #IMPLIED
                          xml:lang NMTOKEN #IMPLIED'
>

<!ENTITY % global-atts    'xtrc CDATA #IMPLIED
                           xtrf CDATA #IMPLIED'
>

<!-- http://www.w3.org/TR/REC-xml#sec-lang-tag -->
<!--  proposed content: Internet RFC 1766 'Tags for the identification of Language' -->
<!--  and ISO 639-1 (two-character codes) -->


<!-- TYPED TOPICS (semantic and structural specialization) ========================= -->

<!ENTITY % topic-info-types "%info-types;">
<!ENTITY included-domains "">

<!--  infotype 'topic'
 | Topic is the archetype from which other typed topics may be derived.
 | Its body has completely optional content, which allows topic to be used as a titled container
 | role: migration target for XHTML, other hierarchically structured source
 *-->
<!--doc:The <topic> element is the top-level DITA element for a single-subject topic or article. Other top-level DITA elements that are more content-specific are <concept>, <task>, <reference>, and <glossary>.
Category: Topic elements-->
<!ELEMENT topic          (%title;, (%titlealts;)?, (%shortdesc;)?, (%prolog;)?, %body;, (%related-links;)?, (%topic-info-types;)* )>
<!ATTLIST topic           id ID #REQUIRED
                          conref CDATA #IMPLIED
                          %select-atts;
                          outputclass CDATA #IMPLIED
                          xml:lang NMTOKEN #IMPLIED
                          DTDVersion CDATA #FIXED "&DTDVersion;"
                          domains CDATA "&included-domains;"
>

<!--doc:The <title> element contains a heading or label for the main parts of a topic, including the topic as a whole, its sections and examples, and its labelled content, such as figures and tables. Beginning with DITA 1.1, the element may also be used to provide a title for a map.
Category: Topic elements-->
<!ELEMENT title          (%title.cnt;)* > <!-- this is referenced inside CALS table -->
<!ATTLIST title           %id-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The alternate title element (<titlealts>) is optional, but can occur after the topic title. Two elements can be inserted as sub-elements of <titlealts>: navigation title <navtitle> and search title <searchtitle>.
Category: Topic elements-->
<!ELEMENT titlealts      ((%navtitle;)?,(%searchtitle;)?)>
<!ATTLIST titlealts       %id-atts;
>
<!--doc:The navigation title (<navtitle>) element is one of a set of alternate titles that can be included inside the <titlealts> element. This navigation title may differ from the first level heading that shows in the main browser window. Use <navtitle> when the actual title of the topic isn't appropriate for use in navigation panes or online contents (for example, because the actual title is too long).
Category: Topic elements-->
<!ELEMENT navtitle       (%words.cnt;)*>
<!ATTLIST navtitle        %id-atts;
>
<!--doc:When your DITA topic is transformed to XHTML, the <searchtitle> element is used to create a title element at the top of the resulting HTML file. This title is normally used in search result summaries by some search engines, such as that in Eclipse (http://eclipse.org); if not set, the XHTML's title element defaults to the source topic's title content (which may not be as well optimized for search summaries)
Category: Topic elements-->
<!ELEMENT searchtitle    (%words.cnt;)*>
<!ATTLIST searchtitle     %id-atts;
>
<!--doc:The short description (<shortdesc>) element occurs between the topic title and the topic body, as the initial paragraph-like content of a topic, or it can be embedded in an abstract element. The short description, which represents the purpose or theme of the topic, is also intended to be used as a link preview and for searching. When used within a DITA map, the short description of the <topicref> can be used to override the short description in the topic.
Category: Topic elements-->
<!ELEMENT shortdesc      (%title.cnt;)* >
<!ATTLIST shortdesc       %id-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <body> element is the container for the main content of a <topic>.
Category: Topic elements-->
<!ELEMENT body           (%body.cnt; | %section; | %example;)* >
<!ATTLIST body            %id-atts;
                          translate (yes|no) #IMPLIED
                          xml:lang NMTOKEN #IMPLIED
                          outputclass CDATA #IMPLIED>

<!--doc:The <no-topic-nesting> element is a placeholder in the DITA architecture. It is not actually used by the default DITA document types; it is for use only when creating a validly customized document type where the information designer wants to eliminate the ability to nest topics. Not intended for use by authors, and has no associated output processing.
Category: Specialization elements-->
<!ELEMENT no-topic-nesting EMPTY
>
<!--doc:The <section> element represents an organizational division in a topic. Sections are used to organize subsets of information that are directly related to the topic. For example, the titles Reference Syntax, Example and Properties might represent section-level discourse within a topic about a command-line process—the content in each section relates uniquely to the subject of that topic. Multiple sections within a single topic do not represent a hierarchy, but rather peer divisions of that topic. Sections cannot be nested. A section may have an optional title.
Category: Topic elements-->
<!ELEMENT section         (%section.cnt;)* >
<!ATTLIST section         spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The <example> element is a section with the specific role of containing examples that illustrate or support the current topic. The <example> element has the same content model as <section>.
Category: Topic elements-->
<!ELEMENT example         (%section.cnt;)* >
<!ATTLIST example         spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!-- desc is used in context with figure and table titles and also for
     content models within linkgroup and object (for accessibility) -->
<!--doc:The <desc> element contains the description of the current element. A description should provide more information than the title. This is its behavior in fig/table/linklist, for example. In xref/link, it provides a description of the target; processors that support it may choose to display this as hover help. In object, it contains alternate content for use when in contexts that cannot display the object.
Category: Body elements-->
<!ELEMENT desc           (%desc.cnt;)* >
<!ATTLIST desc            %id-atts;
                          outputclass CDATA #IMPLIED
>


<!-- PROLOG (metadata for topics) =================================== -->


<!-- TYPED DATA ELEMENTS: ======================================================= -->
<!-- typed content definitions  -->
<!-- typed, localizable content -->



<!--doc:The <prolog> element contains information about the topic as an whole (for example, author information or subject category) that is either entered by the author or machine-maintained. Much of the metadata inside the <prolog> will not be displayed with the topic on output, but may be used by processes that generate search indexes or customize navigation.
Category: Prolog elements-->
<!ELEMENT prolog         ((%author;)*,(%source;)?,(%publisher;)?,(%copyright;)*,(%critdates;)?,(%permissions;)?,(%metadata;)*, (%resourceid;)*)>
<!--doc:The <metadata> section of the prolog contains information about a topic such as audience and product information. Metadata can be used by computational processes to select particular topics or to prepare search indexes or to customize navigation. Elements inside of <metadata> provide information about the content and subject of a topic; prolog elements outside of <metadata> provide lifecycle information for the content unit (such as the author or copyright), which are unrelated to the subject.
Category: Prolog elements-->
<!ELEMENT metadata       ((%audience;)*,(%category;)*,(%keywords;)*,(%prodinfo;)*,(%othermeta;)*) >
<!ATTLIST metadata        mapkeyref CDATA #IMPLIED
>



<!-- =========================================================================== -->
<!-- BASIC DOCUMENT ELEMENT DECLARATIONS (rich text) =========================== -->
<!-- =========================================================================== -->

<!-- Base form: Paragraph -->
<!--doc:A paragraph element (<p>) is a block of text containing a single main idea.
Category: Body elements-->
<!ELEMENT p              (%para.cnt;)*>
<!ATTLIST p               %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Note -->
<!--doc:A <note> element contains information, differentiated from the main text, which expands on or calls attention to a particular point.
Category: Body elements-->
<!ELEMENT note           (%note.cnt;)*>
<!ATTLIST note            type (note|tip|fastpath|restriction|important|remember|attention|caution|danger|other) #IMPLIED
                          spectitle CDATA #IMPLIED
                          othertype CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>



<!-- Base form: Excerpt -->
<!--doc:The long quote (<lq>) element indicates content quoted from another source. Use the quote element <q> for short, inline quotations, and long quote <lq> for quotations that are too long for inline use, following normal guidelines for quoting other sources. You can store a URL to the source of the quotation in the href attribute; the href value may point to a DITA topic.
Category: Body elements-->
<!ELEMENT lq             (%longquote.cnt;)*>
<!ATTLIST lq              href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          type (external|internal|bibliographic) #IMPLIED
                          reftitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Quoted text -->
<!--doc:A quotation element (<q>) indicates content quoted from another source. This element is used for short quotes which are displayed inline. Use the long quote element (<lq>) for quotations that should be set off from the surrounding text.
Category: Body elements-->
<!ELEMENT q              (%shortquote.cnt;)* > <!-- q=quote, lq=long quote -->
<!ATTLIST q               %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Simple List -->
<!--doc:The simple list (<sl>) element contains a simple list of items of short, phrase-like content, such as in documenting the materials in a kit or package.
Category: Body elements-->
<!ELEMENT sl             (%sli;)+>
<!ATTLIST sl              compact (yes|no) #IMPLIED
                          spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: List Item -->
<!--doc:A simple list item (<sli>) is a single item in a simple list <sl>. Simple list items have phrase or text content, adequate for describing package contents, for example. When a DITA topic is formatted for output, the items of a simple list are placed each on its own line, with no other prefix such as a number (as in an ordered list) or bullet (as in an unordered list).
Category: Body elements-->
<!ELEMENT sli             (%ph.cnt;)*>
<!ATTLIST sli              %univ-atts;
                          outputclass CDATA #IMPLIED
>


<!-- Base form: Unordered List -->
<!--doc:In an unordered list (<ul>), the order of the list items is not significant. List items are typically styled on output with a "bullet" character, depending on nesting level.
Category: Body elements-->
<!ELEMENT ul             (%li;)+>
<!ATTLIST ul              compact (yes|no) #IMPLIED
                          spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Ordered List -->
<!--doc:An ordered list (<ol>) is a list of items sorted by sequence or order of importance.
Category: List elements-->
<!ELEMENT ol             (%li;)+>
<!ATTLIST ol              compact (yes|no) #IMPLIED
                          spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: List Item -->
<!--doc:A list (<li>) item is a single item in an ordered <ol> or unordered <ul> list. When a DITA topic is formatted for output, numbers and alpha characters are usually output with list items in ordered lists, while bullets and dashes are usually output with list items in unordered lists.
Category: Body elements-->
<!ELEMENT li             (%listitem.cnt;)*>
<!ATTLIST li              %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Item Group -->
<!--doc:The <itemgroup> element is reserved for use in specializations of DITA. As a container element, it can be used to sub-divide or organize elements that occur inside a list item, definition, or parameter definition.
Category: Specialization elements-->
<!ELEMENT itemgroup      (%itemgroup.cnt;)*>
<!ATTLIST itemgroup       %univ-atts;
                          outputclass CDATA #IMPLIED
>


<!-- Base form: Definition List -->
<!--doc:A definition list (<dl>) is a list of terms and corresponding definitions. The term (<dt>) is usually flush left. The description or definition (<dd>) is usually either indented and on the next line, or on the same line to the right of the term.
Category: Body elements-->
<!ELEMENT dl             ((%dlhead;)?, (%dlentry;)+) >
<!ATTLIST dl              compact (yes|no) #IMPLIED
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!--doc:The <dlhead> element contains optional headings for the term and description columns in a definition list. The definition list heading contains a heading <dthd> for the column of terms and an optional heading <ddhd>for the column of descriptions.
Category: Body elements-->
<!ELEMENT dlhead         ((%dthd;)?,(%ddhd;)?)>
<!ATTLIST dlhead          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The definition term heading (<dthd>) element is contained in a definition list head (<dlhead>) and provides an optional heading for the column of terms in a description list.
Category: Body elements-->
<!ELEMENT dthd           (%title.cnt;)*>     <!-- heading for dt and dd -->
<!ATTLIST dthd            %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The definition descriptions heading (<ddhd>) element contains an optional heading or title for a column of descriptions or definitions in a definition list
Category: Body elements-->
<!ELEMENT ddhd           (%title.cnt;)*>
<!ATTLIST ddhd            %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:In a definition list, each list item is defined by the definition list entry (<dlentry>) element. The definition list entry element includes a term <dt> and one or more definitions or descriptions <dd> of that term.
Category: Body elements-->
<!ELEMENT dlentry        ((%dt;)+,(%dd;)+) >
<!ATTLIST dlentry         %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The definition term <dt> element contains a term in a definition list entry.
Category: Body elements-->
<!ELEMENT dt             (%term.cnt;)*> <!-- defining term -->
<!ATTLIST dt              keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The definition description (<dd>) element contains the description of a term in a definition list entry.
Category: Body elements-->
<!ELEMENT dd             (%defn.cnt;)* >   <!-- description -->
<!ATTLIST dd              %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Figure -->
<!--doc:The figure (<fig>) element is a display context (sometimes called an exhibit) with an optional title for a wide variety of content. Most commonly, the figure element contains an image element (a graphic or artwork), but it can contain several kinds of text objects as well. A title is placed inside the figure element to provide a caption to describe the content.
Category: Body elements-->
<!ELEMENT fig            ((%title;)?, (%desc;)?, (%figgroup; | %fig.cnt;)*)>
<!ATTLIST fig             %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The <figgroup> element is used only for specialization at this time. Figure groups can be used to contain multiple cross-references, footnotes or keywords, but not multipart images. Multipart images in DITA should be represented by a suitable media type displayed by the <object> element.
Category: Body elements-->
<!ELEMENT figgroup       ((%title;)?, (%figgroup; | %xref; | %fn; | %ph; | %keyword;)*)>
<!ATTLIST figgroup       %univ-atts;
                         outputclass CDATA #IMPLIED
>

<!-- Base form: Preformatted Text -->
<!--doc:The preformatted element (<pre>) preserves line breaks and spaces entered manually by the author in the content of the element, and also presents the content in a monospaced type font (depending on your output formatting processor). Do not use <pre> when a more semantically specific element is appropriate, such as <codeblock>.
Category: Body elements-->
<!ELEMENT pre            (%pre.cnt;)*>
<!ATTLIST pre             %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          xml:space (preserve) #FIXED 'preserve'
>

<!-- Base form: Line Respecting Text -->
<!--doc:The <lines> element may be used to represent dialogs, lists, text fragments, and so forth. The <lines> element is similar to <pre> in that hard line breaks are preserved, but the font style is not set to monospace, and extra spaces inside the lines are not preserved.
Category: Body elements-->
<!ELEMENT lines          (%pre.cnt;)*>
<!ATTLIST lines           %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          xml:space (preserve) #FIXED 'preserve'
>

<!-- Base form: Base Phrase Types -->

<!--doc:The <keyword> element identifies a keyword or token, such as a single value from an enumerated list, the name of a command or parameter, product name, or a lookup key for a message.
Category: Body elements-->
<!ELEMENT keyword        (#PCDATA | tm)*>
<!ATTLIST keyword         keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <term> element identifies words that may have or require extended definitions or explanations. In future development of DITA, for example, terms might provide associative linking to matching glossary entries.
Category: Specialization elements-->
<!ELEMENT term           (#PCDATA | %tm;)*>
<!ATTLIST term            keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The phrase (<ph>) element is used to organize content for reuse or conditional processing (for example, when part of a paragraph applies to a particular audience). It can be used by specializations of DITA to create semantic markup for content at the phrase level, which then allows (but does not require) specific processing or formatting.
Category: Body elements-->
<!ELEMENT ph             (%ph.cnt;)*>
<!ATTLIST ph              keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The trademark (<tm>) element in DITA is used to markup and identify a term or phrase that is trademarked. Trademarks include registered trademarks, service marks, slogans and logos.
Category: Miscellaneous elements-->
<!ELEMENT tm             (#PCDATA | %tm;)*>
<!ATTLIST tm
                          trademark CDATA           #IMPLIED
                          tmowner   CDATA           #IMPLIED
                          tmtype   (tm|reg|service) #REQUIRED
                          tmclass   CDATA           #IMPLIED
>
<!--doc:The <boolean> element is used to express one of two opposite values, such as yes or no, on or off, true or false, high or low, and so forth. The element itself is empty; the value of the element is stored in its state attribute, and the semantic associated with the value is typically in a specialized name derived from this element.
Category: Specialization elements-->
<!ELEMENT boolean        EMPTY>
<!ATTLIST boolean         state (yes|no) #REQUIRED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!-- a state can have a name and a string value, even if empty or indeterminate -->
<!-- note that "state" is distinguished from element "meta," intended for more general metadescription -->
<!--doc:The <state> element specifies a name/value pair whenever it is necessary to represent a named state that has a variable value. The element is primarily intended for use in specializations to represent specific states (like logic circuit states, chemical reaction states, airplane instrumentation states, and so forth).
Category: Specialization elements-->
<!ELEMENT state          EMPTY>
<!ATTLIST state           name CDATA #REQUIRED
                          value CDATA #REQUIRED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Image Data -->
<!--doc:Include artwork or images in a DITA topic by using the <image> element. The <image> element has optional attributes that indicate whether the placement of the included graphic or artwork should be inline (like a button or icon) or on a separate line for a larger image. There are also optional attributes that indicate the size to which the included graphic or artwork should be scaled. An href attribute is required on the image element, as this attribute creates a pointer to the image, and allows the output formatting processor to bring the image into the text flow. To make the intent of the image more accessible for users using screen readers or text-only readers, always include a description of the image's content in the alt element.
Category: Body elements-->
<!ELEMENT image          (%alt;)?>
<!ATTLIST image           href       CDATA           #REQUIRED
                          keyref     NMTOKEN         #IMPLIED
                          alt        CDATA           #IMPLIED
                          longdescref CDATA          #IMPLIED
                          height     NMTOKEN         #IMPLIED
                          width      NMTOKEN         #IMPLIED
                          align      CDATA           #IMPLIED
                          placement  (inline|break)  "inline"
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The alt element provides alternate text for an image. It is equivalent to the alt attribute on the image element; the attribute is deprecated, so the alt element should be used instead. As an element, alt provides direct text entry within an XML editor and is more easily accessed than an attribute for translation.
Category: Body elements-->
<!ELEMENT alt            (%words.cnt;)*>
<!ATTLIST alt             %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Streaming/Executable Data -->
<!--doc:DITA's <object> element corresponds to the HTML <object> element.
Category: Body elements-->
<!ELEMENT object         ((%desc;)?, (%param;)*)>
<!ATTLIST object
                          declare     (declare)      #IMPLIED
                          classid     CDATA          #IMPLIED
                          codebase    CDATA          #IMPLIED
                          data        CDATA          #IMPLIED
                          type        CDATA          #IMPLIED
                          codetype    CDATA          #IMPLIED
                          archive     CDATA          #IMPLIED
                          standby     CDATA          #IMPLIED
                          height      NMTOKEN        #IMPLIED
                          width       NMTOKEN        #IMPLIED
                          usemap      CDATA          #IMPLIED
                          name        CDATA          #IMPLIED
                          tabindex    NMTOKEN        #IMPLIED
                          longdescref CDATA          #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The parameter (<param>) element specifies a set of values that may be required by an <object> at runtime. Any number of <param> elements may appear in the content of an object in any order, but must be placed at the start of the content of the enclosing object. This element is comparable to the XHMTL <param> element.
Category: Body elements-->
<!ELEMENT param          EMPTY>
<!ATTLIST param
                          name        CDATA          #REQUIRED
                          id          ID             #IMPLIED
                          value       CDATA          #IMPLIED
                          valuetype   (data|ref|object) #IMPLIED

                          type        CDATA          #IMPLIED
>

<!-- Base form: Simple Table -->
<!--doc:The <simpletable> element is used for tables that are regular in structure and do not need a caption. Choose the simple table element when you want to show information in regular rows and columns. For example, multi-column tabular data such as phone directory listings or parts lists are good candidates for simpletable. Another good use of simpletable is for information that seems to beg for a "three-part definition list"—just use the keycol attribute to indicate which column represents the "key" or term-like column of your structure.
Category: Table elements-->
<!ELEMENT simpletable    ((%sthead;)?, (%strow;)+) >
<!ATTLIST simpletable     relcolwidth CDATA #IMPLIED
                          keycol NMTOKEN #IMPLIED
                          refcols NMTOKENS #IMPLIED
                          %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The simpletable header (<sthead>) element contains the table's header row. The header row is optional in a simple table.
Category: Table elements-->
<!ELEMENT sthead         (%stentry;)+>
<!ATTLIST sthead          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The <simpletable> row (<strow>) element specifies a row in a simple table.
Category: Table elements-->
<!ELEMENT strow          (%stentry;)*>
<!ATTLIST strow           %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The simpletable entry (<stentry>) element represents a single table cell, like <entry> in <table>. You can place any number of stentry cells in either an <sthead> element (for headings) or <strow> element (for rows of data).
Category: Table elements-->
<!ELEMENT stentry        (%tblcell.cnt;)*>
<!ATTLIST stentry         %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Review Comments Block -->
<!--doc:The <draft-comment> element allows simple review and discussion of topic contents within the marked-up content. Use the <draft-comment> element to ask a question or make a comment that you would like others to review. To indicate the source of the draft comment or the status of the comment, use the author, time or disposition attributes.
Category: Miscellaneous elements-->
<!ELEMENT draft-comment  (#PCDATA | %basic.phandblock;)*>
<!ATTLIST draft-comment   author CDATA #IMPLIED
                          time CDATA #IMPLIED
                          disposition (issue|open|accepted|rejected|deferred|duplicate|reopened|unassigned|completed) #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Required Cleanup Block -->
<!--doc:A <required-cleanup> element is used as a placeholder for migrated elements that cannot be appropriately tagged without manual intervention. As the element name implies, the intent for authors is to clean up the contained material and eventually get rid of the <required-cleanup> element. Authors should not insert this element into documents.
Category: Specialization elements-->
<!ELEMENT required-cleanup ANY >
<!ATTLIST required-cleanup remap CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Footnote -->
<!--doc:Use footnote (<fn>) to annotate text with notes that are not appropriate for inclusion in line or to indicate the source for facts or other material used in the text.
Category: Miscellaneous elements-->
<!ELEMENT fn             (%fn.cnt;)*> <!--footnote -->
<!ATTLIST fn              callout CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Index Entry -->

<!--doc:An <indexterm> element allows the author to indicate that a certain word or phrase should produce an index entry in the generated index.
Category: Miscellaneous elements-->
<!-- <!ELEMENT indexterm      (#PCDATA|indexterm)*> -->   <!-- Index entry -->
<!-- <!ATTLIST indexterm       keyref NMTOKEN #IMPLIED
                          %univ-atts;
> -->
<!--doc:This element is not completely defined, and is reserved for future use.
Category: Miscellaneous elements-->
<!ELEMENT indextermref   EMPTY>               <!-- Index term reference -->
<!ATTLIST indextermref    keyref NMTOKEN #REQUIRED
                          %univ-atts;
>

<!-- Base form: Citation (from a bibliographic source) -->
<!--doc:The <cite> element is used when you need a bibliographic citation that refers to a book or article. It specifically identifies the title of the resource.
Category: Body elements-->
<!ELEMENT cite           (%xrefph.cnt;)* >
<!ATTLIST cite            keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!-- Base form: Cross Reference/Link -->
<!--doc:Use the cross-reference (<xref>) element to link to a different location within the current topic, or a different topic within the same help system, or to external sources, such as Web pages, or to a location in another topic. The href attribute on the <xref> element provides the location of the target.
Category: Body elements-->
<!ELEMENT xref           (%xreftext.cnt;)*>
<!ATTLIST xref            href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          type   CDATA  #IMPLIED
                          %univ-atts;
                          format        CDATA   #IMPLIED
                          scope (local | peer | external) #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!-- ================ links grouping ================ -->

<!--doc:The related information links of a topic (<related-links> element) are stored in a special section following the body of the topic. After a topic is processed into it final output form, the related links are usually displayed at the end of the topic, although some Web-based help systems might display them in a separate navigation frame.
Category: Topic elements-->
<!ELEMENT related-links  (%link; | %linklist; | %linkpool;)+>
<!ATTLIST related-links   %rel-atts;
                          %select-atts;
                          format        CDATA   #IMPLIED
                          scope (local | peer | external) #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!--doc:The <link> element defines a relationship to another topic. Links represent the types and roles of topics in a web of information, and therefore represent navigational links within that web. Links are typically sorted on output based on their attributes. The optional container elements for link (<linkpool> and <linklist>) allow authors to define groups with common attributes, or to preserve the authored sequence of links on output. Links placed in a <linkpool> may be rearranged for display purposes (combined with other local or map-based links); links in a <linklist> should be displayed in the order they are defined. Refer to those elements for additional explanation.
Category: Related Links elements-->
<!ELEMENT link           ((%linktext;)?, (%desc;)?)>
<!ATTLIST link            href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          %rel-atts;
                          %select-atts;
                          format        CDATA   #IMPLIED
                          scope (local | peer | external) #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The <linktext> element provides the literal label or line of text for a link. In most cases, the text of a link can be resolved during processing by cross reference with the target resource. Use the <linktext> element only when the target cannot be reached, such as when it is a peer or external link, or the target is local but not in DITA format. When used inside a topic, it will be used as the text for the specified link; when used within a map, it will be used as the text for generated links that point to the specified topic.
Category: Related Links elements-->
<!ELEMENT linktext       (%words.cnt;)*>
<!--doc:The <linklist> element defines an author-arranged group of links. Within <linklist>, the organization of links on final output is in the same order as originally authored in the DITA topic.
Category: Related Links elements-->
<!ELEMENT linklist       ((%title;)?, (%desc;)?,(%linklist; | %link;)*,(%linkinfo;)?)>
<!ATTLIST linklist        collection-type (unordered|sequence|choice|tree|family) #IMPLIED
                          duplicates (yes|no) #IMPLIED
                          mapkeyref CDATA #IMPLIED
                          %rel-atts;
                          %select-atts;
                          spectitle CDATA #IMPLIED
                          format        CDATA   #IMPLIED
                          scope (local | peer | external) #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The <linkinfo> element allows you to place a descriptive paragraph following a list of links in a <linklist> element.
Category: Related Links elements-->
<!ELEMENT linkinfo       (%desc.cnt;)*>
<!--doc:The <linkpool> element defines a group of links that have common characteristics, such as type or audience or source. When links are not in a <linklist> (that is, they are in <related-links> or <linkpool> elements), the organization of links on final output is determined by the output process, not by the order that the links actually occur in the DITA topic.
Category: Related Links elements-->
<!ELEMENT linkpool       (%linkpool; | %link;)*> <!-- for now -->
<!ATTLIST linkpool        collection-type (unordered|sequence|choice|tree|family) #IMPLIED
                          duplicates (yes|no) #IMPLIED
                          mapkeyref CDATA #IMPLIED
                          %rel-atts;
                          %select-atts;
                          format        CDATA   #IMPLIED
                          scope (local | peer | external) #IMPLIED
                          outputclass CDATA #IMPLIED
>


<!-- ==================== include sections ======================= -->
<!-- ======== Table elements ======== -->
<!ENTITY % tableXML PUBLIC "-//IBM//ELEMENTS DITA CALS Tables//EN" "tbl_xml.mod">
  %tableXML;

<!-- ======= MetaData elements, plus keyword and indexterm ======= -->
<!ENTITY % metaXML PUBLIC "-//IBM//ELEMENTS DITA Metadata//EN" "meta_xml.mod">
  %metaXML;

<!-- ============ Specialization of declared elements ============ -->
<!ENTITY % topicClasses  PUBLIC "-//IBM//ENTITIES DITA Topic Class//EN" "topic_class.ent">
  %topicClasses;
