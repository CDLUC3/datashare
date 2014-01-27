<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Common Elements                              -->
<!--  VERSION:   1.1                                               -->
<!--  DATE:      November 2006                                     -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identifier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA Common Elements//EN"
      Delivered as file "commonElements.mod"                       -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for content elements used in both      -->
<!--             topics and maps.                                  -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             June 2006                                         -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2006.06.06 RDA: Add data element                           -->
<!--    2006.06.07 RDA: Add @scale to image                        -->
<!--    2006.06.07 RDA: Add index-base element                     -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
<!--    2006.06.07 RDA: Add unknown element                        -->
<!--    2006.06.14 RDA: Add dir attribute to localization-atts     -->
<!--    2006.11.30 RDA: Add -dita-use-conref-target to enumerated  -->
<!--                      attributes                               -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->

<!ENTITY % commonDefns   PUBLIC 
                       "-//OASIS//ENTITIES DITA Common Elements//EN" 
                       "commonElements.ent"                          >
%commonDefns;

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->


<!--                   Phrase/inline elements of various classes   -->
<!ENTITY % basic.ph    "%ph; | %term; | %xref; | %cite; | %q; |
                        %boolean; | %state; | %keyword; | %tm;"      >

<!--                   Elements common to most body-like contexts  -->
<!ENTITY % basic.block "%p; | %lq; | %note; | %dl; | %ul; | %ol;|  
                        %sl; | %pre; | %lines; | %fig; | %image; | 
                        %object; |  %table; | %simpletable;">

<!-- class groupings to preserve in a schema -->

<!ENTITY % basic.phandblock     "%basic.ph; | %basic.block;"         >


<!-- Exclusions: models modified by removing excluded content      -->
<!ENTITY % basic.ph.noxref
                      "%ph;|%term;|              %q;|%boolean;|%state;|%keyword;|%tm;">
<!ENTITY % basic.ph.notm
                      "%ph;|%term;|%xref;|%cite;|%q;|%boolean;|%state;|%keyword;     ">


<!ENTITY % basic.block.notbl
                      "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;">
<!ENTITY % basic.block.nonote
                      "%p;|%lq;|       %dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.nopara
                      "    %lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.nolq
                      "%p;|     %note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|%fig;|%image;|%object;|%table;|%simpletable;">
<!ENTITY % basic.block.notbnofg
                      "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|      %image;|%object;">
<!ENTITY % basic.block.notbfgobj
                      "%p;|%lq;|%note;|%dl;|%ul;|%ol;|%sl;|%pre;|%lines;|      %image;">


<!-- Inclusions: defined sets that can be added into appropriate models -->
<!ENTITY % txt.incl             '%draft-comment;|%required-cleanup;|%fn;|%indextermref;|%indexterm;'>

<!-- Metadata elements intended for specialization -->
<!ENTITY % data.elements.incl   "%data;|%data-about;"                >
<!ENTITY % foreign.unknown.incl "%foreign;|%unknown;"                >

<!-- Predefined content model groups, based on the previous, element-only categories: -->
<!-- txt.incl is appropriate for any mixed content definitions (those that have PCDATA) -->
<!-- the context for blocks is implicitly an InfoMaster "containing_division" -->
<!ENTITY % listitem.cnt         "#PCDATA | %basic.ph; | %basic.block; |%itemgroup;| %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % itemgroup.cnt        "#PCDATA | %basic.ph; | %basic.block; |             %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % title.cnt            "#PCDATA | %basic.ph.noxref; | %image; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % xreftext.cnt         "#PCDATA | %basic.ph.noxref; | %image; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % xrefph.cnt           "#PCDATA | %basic.ph.noxref; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % shortquote.cnt       "#PCDATA | %basic.ph; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % para.cnt             "#PCDATA | %basic.ph; | %basic.block.nopara; | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % note.cnt             "#PCDATA | %basic.ph; | %basic.block.nonote; | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % longquote.cnt        "#PCDATA | %basic.ph; | %basic.block.nolq;   | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % tblcell.cnt          "#PCDATA | %basic.ph; | %basic.block.notbl;  | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % desc.cnt             "#PCDATA | %basic.ph; | %basic.block.notbfgobj; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % ph.cnt               "#PCDATA | %basic.ph; | %image;              | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % fn.cnt               "#PCDATA | %basic.ph; | %basic.block.notbl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % term.cnt             "#PCDATA | %basic.ph; | %image; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % defn.cnt             "#PCDATA | %basic.ph; | %basic.block; |%itemgroup;| %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % pre.cnt              "#PCDATA | %basic.ph; | %txt.incl; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % fig.cnt              "%basic.block.notbnofg; | %simpletable; | %xref; | %fn;| %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % words.cnt            "#PCDATA | %keyword; | %term; | %data.elements.incl; | %foreign.unknown.incl;">
<!ENTITY % data.cnt             "%words.cnt;|%image;|%object;|%ph;|%title;">

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->

<!-- Copied into metaDecl.mod -->
<!--<!ENTITY % date-format 'CDATA'                                       >-->

<!ENTITY % display-atts  
            'scale     (50|60|70|80|90|100|110|120|140|160|
                        180|200|-dita-use-conref-target)   #IMPLIED
             frame     (top | bottom |topbot | all |
                        sides | none | 
                        -dita-use-conref-target)           #IMPLIED
             expanse   (page | column | textline | 
                        -dita-use-conref-target)           #IMPLIED' >

<!-- Provide a default of no attribute extensions -->
<!ENTITY % props-attribute-extensions " ">
<!ENTITY % base-attribute-extensions  " ">

<!ENTITY % filter-atts
            'props      CDATA                              #IMPLIED
             platform   CDATA                              #IMPLIED
             product    CDATA                              #IMPLIED
             audience   CDATA                              #IMPLIED
             otherprops CDATA                              #IMPLIED
             %props-attribute-extensions;                          ' >

<!ENTITY % select-atts   
            '%filter-atts;
             base       CDATA                              #IMPLIED
             %base-attribute-extensions;
             importance 
                       (obsolete | deprecated | optional | 
                        default | low | normal | high | 
                        recommended | required | urgent | 
                        -dita-use-conref-target )          #IMPLIED
             rev        CDATA                              #IMPLIED
             status    (new | changed | deleted | 
                        unchanged | 
                        -dita-use-conref-target)           #IMPLIED' >

<!ENTITY % id-atts  
            'id         NMTOKEN                            #IMPLIED
             conref     CDATA                              #IMPLIED' >

<!-- Attributes related to localization that are used everywhere   -->
<!ENTITY % localization-atts  
            'translate (yes | no | 
                        -dita-use-conref-target)           #IMPLIED
             xml:lang   NMTOKEN                            #IMPLIED
             dir       (ltr | rtl | lro | rlo | 
                        -dita-use-conref-target)           #IMPLIED' >
<!-- The following entity should be used when defaulting a new
     element to translate="no", so that other (or new) localization
     attributes will always be included.   -->
<!ENTITY % localization-atts-translate-no  
            'translate (yes | no | 
                        -dita-use-conref-target)           "no"
             xml:lang   NMTOKEN                            #IMPLIED
             dir       (ltr | rtl | lro | rlo | 
                        -dita-use-conref-target)           #IMPLIED' >
             
<!ENTITY % univ-atts     
            '%id-atts;
             %select-atts;
             %localization-atts;' >
<!ENTITY % univ-atts-translate-no     
            '%id-atts;
             %select-atts;
             %localization-atts-translate-no;' >

<!ENTITY % global-atts    
            'xtrc       CDATA                              #IMPLIED
             xtrf       CDATA                              #IMPLIED'>
             
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->

<!--                    LONG NAME: Data About                      -->
<!--doc:The <data-about> element identifies the subject of a property when the subject isn't associated with the context in which the property is specified. The property itself is expressed by the <data> element. The <data-about> element handles exception cases where a property must be expressed somewhere other than inside the actual subject of the property. The <data-about> element is particularly useful as a basis for specialization in combination with the <data> element.
Category: Miscellaneous elements-->
<!ELEMENT data-about  ((%data;), (%data;|%data-about;)*)>
<!ATTLIST data-about  %univ-atts;
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)        #IMPLIED
             outputclass
                        CDATA                            #IMPLIED    >

<!ENTITY % data-element-atts
            '%univ-atts;
             name       CDATA                            #IMPLIED
             datatype   CDATA                            #IMPLIED
             value      CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)        #IMPLIED
             outputclass
                        CDATA                            #IMPLIED'   >
             
<!--                    LONG NAME: Data element                    -->
<!--doc:The <data> element represents a property within a DITA topic or map. While the <data> element can be used directly to capture properties, it is particularly useful as a basis for specialization. Default processing treats the property values as an unknown kind of metadata, but custom processing can match the name attribute or specialized element to format properties as sidebars or other adornments or to harvest properties for automated processing.
Category: Miscellaneous elements-->
<!ELEMENT data    (%data.cnt;)*>
<!ATTLIST data    %data-element-atts;                                >

<!--                    LONG NAME: Unknown element                 -->
<!--doc:The <unknown> element is an open extension that allows information architects to incorporate xml fragments that do not necessarily fit into an existing DITA use case. The base processing for <unknown> is to suppress unless otherwise instructed.
Category: Specialization elements-->
<!ELEMENT unknown ANY>
<!ATTLIST unknown
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Foreign content element         -->
<!--doc:The <foreign> element is an open extension that allows information architects to incorporate existing standard vocabularies for non-textual content. like MathML and SVG, as inline objects. If <foreign> contains more than one alternative content element, they will all be processed. Specialization of <foreign> should be implemented as a domain, but for those looking for more control over the content can implement foreign vocabulary as an element specialization.
Category: Specialization elements-->
<!ELEMENT foreign ANY>
<!ATTLIST foreign
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Title                           -->
<!--                    This is referenced inside CALS table       -->
<!--doc:The <title> element contains a heading or label for the main parts of a topic, including the topic as a whole, its sections and examples, and its labelled content, such as figures and tables. Beginning with DITA 1.1, the element may also be used to provide a title for a map.
Category: Topic elements-->
<!ELEMENT title         (%title.cnt;)*                               > 
<!ATTLIST title         
             %id-atts;
             %localization-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Short Description               -->
<!--doc:The short description (<shortdesc>) element occurs between the topic title and the topic body, as the initial paragraph-like content of a topic, or it can be embedded in an abstract element. The short description, which represents the purpose or theme of the topic, is also intended to be used as a link preview and for searching. When used within a DITA map, the short description of the <topicref> can be used to override the short description in the topic.
Category: Topic elements-->
<!ELEMENT shortdesc     (%title.cnt;)*                               >
<!ATTLIST shortdesc    
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Description                     -->
<!--                    Desc is used in context with figure and 
                        table titles and also for content models 
                        within linkgroup and object (for 
                        accessibility)                             -->
<!--doc:The <desc> element contains the description of the current element. A description should provide more information than the title. This is its behavior in fig/table/linklist, for example. In xref/link, it provides a description of the target; processors that support it may choose to display this as hover help. In object, it contains alternate content for use when in contexts that cannot display the object.
Category: Body elements-->
<!ELEMENT desc          (%desc.cnt;)*                                >
<!ATTLIST desc           
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!-- ============================================================= -->
<!--                    BASIC DOCUMENT ELEMENT DECLARATIONS        -->
<!--                    (rich text)                                -->
<!-- ============================================================= -->

<!--                    LONG NAME: Paragraph                       -->
<!--doc:A paragraph element (<p>) is a block of text containing a single main idea.
Category: Body elements-->
<!ELEMENT p             (%para.cnt;)*                                >
<!ATTLIST p              
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Note                            -->
<!--doc:A <note> element contains information, differentiated from the main text, which expands on or calls attention to a particular point.
Category: Body elements-->
<!ELEMENT note          (%note.cnt;)*                                >
<!ATTLIST note            
             type       (note | tip | fastpath | restriction |
                         important | remember| attention|
                         caution | danger | other | 
                         -dita-use-conref-target)        #IMPLIED             
             spectitle  CDATA                            #IMPLIED
             othertype  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Long Quote (Excerpt)            -->
<!--doc:The long quote (<lq>) element indicates content quoted from another source. Use the quote element <q> for short, inline quotations, and long quote <lq> for quotations that are too long for inline use, following normal guidelines for quoting other sources. You can store a URL to the source of the quotation in the href attribute; the href value may point to a DITA topic.
Category: Body elements-->
<!ELEMENT lq            (%longquote.cnt;)*                           >
<!ATTLIST lq              
             href       CDATA                           #IMPLIED
             keyref     CDATA                           #IMPLIED
             type       (external | internal | 
                         bibliographic | 
                         -dita-use-conref-target)       #IMPLIED
             reftitle   CDATA                           #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Quoted text                     -->
<!--doc:A quotation element (<q>) indicates content quoted from another source. This element is used for short quotes which are displayed inline. Use the long quote element (<lq>) for quotations that should be set off from the surrounding text.
Category: Body elements-->
<!ELEMENT q             (%shortquote.cnt;)*                          >
<!ATTLIST q              
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Simple List                     -->
<!--doc:The simple list (<sl>) element contains a simple list of items of short, phrase-like content, such as in documenting the materials in a kit or package.
Category: Body elements-->
<!ELEMENT sl            (%sli;)+                                     >
<!ATTLIST sl            
             compact    (yes | no | 
                         -dita-use-conref-target)        #IMPLIED
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Simple List Item                -->
<!--doc:A simple list item (<sli>) is a single item in a simple list <sl>. Simple list items have phrase or text content, adequate for describing package contents, for example. When a DITA topic is formatted for output, the items of a simple list are placed each on its own line, with no other prefix such as a number (as in an ordered list) or bullet (as in an unordered list).
Category: Body elements-->
<!ELEMENT sli           (%ph.cnt;)*                                  >
<!ATTLIST sli             
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Unordered List                  -->
<!--doc:In an unordered list (<ul>), the order of the list items is not significant. List items are typically styled on output with a "bullet" character, depending on nesting level.
Category: Body elements-->
<!ELEMENT ul            (%li;)+                                      >
<!ATTLIST ul            
             compact    (yes | no | 
                         -dita-use-conref-target)        #IMPLIED
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Ordered List                    -->
<!--doc:An ordered list (<ol>) is a list of items sorted by sequence or order of importance.
Category: List elements-->
<!ELEMENT ol            (%li;)+                                      >
<!ATTLIST ol              
             compact    (yes | no | 
                         -dita-use-conref-target)        #IMPLIED
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: List Item                       -->
<!--doc:A list (<li>) item is a single item in an ordered <ol> or unordered <ul> list. When a DITA topic is formatted for output, numbers and alpha characters are usually output with list items in ordered lists, while bullets and dashes are usually output with list items in unordered lists.
Category: Body elements-->
<!ELEMENT li            (%listitem.cnt;)*                            >
<!ATTLIST li             
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Item Group                      -->
<!--doc:The <itemgroup> element is reserved for use in specializations of DITA. As a container element, it can be used to sub-divide or organize elements that occur inside a list item, definition, or parameter definition.
Category: Specialization elements-->
<!ELEMENT itemgroup     (%itemgroup.cnt;)*                           >
<!ATTLIST itemgroup       
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Definition List                 -->
<!--doc:A definition list (<dl>) is a list of terms and corresponding definitions. The term (<dt>) is usually flush left. The description or definition (<dd>) is usually either indented and on the next line, or on the same line to the right of the term.
Category: Body elements-->
<!ELEMENT dl            ((%dlhead;)?, (%dlentry;)+)                  >
<!ATTLIST dl              
             compact    (yes | no | 
                         -dita-use-conref-target)        #IMPLIED
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Definition List Head            -->
<!--doc:The <dlhead> element contains optional headings for the term and description columns in a definition list. The definition list heading contains a heading <dthd> for the column of terms and an optional heading <ddhd>for the column of descriptions.
Category: Body elements-->
<!ELEMENT dlhead        ((%dthd;)?, (%ddhd;)? )                      >
<!ATTLIST dlhead        
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Term Header                     -->
<!--doc:The definition term heading (<dthd>) element is contained in a definition list head (<dlhead>) and provides an optional heading for the column of terms in a description list.
Category: Body elements-->
<!ELEMENT dthd          (%title.cnt;)*                               >
<!ATTLIST dthd           
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Definition Header               -->
<!--doc:The definition descriptions heading (<ddhd>) element contains an optional heading or title for a column of descriptions or definitions in a definition list
Category: Body elements-->
<!ELEMENT ddhd          (%title.cnt;)*                               >
<!ATTLIST ddhd           
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Definition List Entry           -->
<!--doc:In a definition list, each list item is defined by the definition list entry (<dlentry>) element. The definition list entry element includes a term <dt> and one or more definitions or descriptions <dd> of that term.
Category: Body elements-->
<!ELEMENT dlentry       ((%dt;)+, (%dd;)+ )                          >
<!ATTLIST dlentry       
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >



<!--                    LONG NAME: Definition Term                 -->  
<!--doc:The definition term <dt> element contains a term in a definition list entry.
Category: Body elements-->
<!ELEMENT dt            (%term.cnt;)*                                >
<!ATTLIST dt            
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Definition Description          -->
<!--doc:The definition description (<dd>) element contains the description of a term in a definition list entry.
Category: Body elements-->
<!ELEMENT dd            (%defn.cnt;)*                                >
<!ATTLIST dd           
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Figure                          -->
<!--doc:The figure (<fig>) element is a display context (sometimes called an exhibit) with an optional title for a wide variety of content. Most commonly, the figure element contains an image element (a graphic or artwork), but it can contain several kinds of text objects as well. A title is placed inside the figure element to provide a caption to describe the content.
Category: Body elements-->
<!ELEMENT fig           ((%title;)?, (%desc;)?, 
                         (%figgroup; | %fig.cnt;)* )                 >
<!ATTLIST fig          
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Figure Group                    -->
<!--doc:The <figgroup> element is used only for specialization at this time. Figure groups can be used to contain multiple cross-references, footnotes or keywords, but not multipart images. Multipart images in DITA should be represented by a suitable media type displayed by the <object> element.
Category: Body elements-->
<!ELEMENT figgroup      ((%title;)?, 
                         (%figgroup; | %xref; | %fn; | %ph; | 
                          %keyword;)* )                              >
<!ATTLIST figgroup     
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Preformatted Text               -->
<!--doc:The preformatted element (<pre>) preserves line breaks and spaces entered manually by the author in the content of the element, and also presents the content in a monospaced type font (depending on your output formatting processor). Do not use <pre> when a more semantically specific element is appropriate, such as <codeblock>.
Category: Body elements-->
<!ELEMENT pre           (%pre.cnt;)*                                 >                                
<!ATTLIST pre          
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             xml:space  (preserve)               #FIXED 'preserve'
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Line Respecting Text            -->
<!--doc:The <lines> element may be used to represent dialogs, lists, text fragments, and so forth. The <lines> element is similar to <pre> in that hard line breaks are preserved, but the font style is not set to monospace, and extra spaces inside the lines are not preserved.
Category: Body elements-->
<!ELEMENT lines         (%pre.cnt;)*                                 >
<!ATTLIST lines           
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             xml:space  (preserve)               #FIXED 'preserve'
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!-- ============================================================= -->
<!--                   BASE FORM PHRASE TYPES                      -->
<!-- ============================================================= -->

<!--                    LONG NAME: Keyword                         -->
<!--doc:The <keyword> element identifies a keyword or token, such as a single value from an enumerated list, the name of a command or parameter, product name, or a lookup key for a message.
Category: Body elements-->
<!ELEMENT keyword       (#PCDATA | %tm;)*                            >
<!ATTLIST keyword       
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                           #IMPLIED     >


<!--                    LONG NAME: Term                            -->
<!--doc:The <term> element identifies words that may have or require extended definitions or explanations. In future development of DITA, for example, terms might provide associative linking to matching glossary entries.
Category: Specialization elements-->
<!ELEMENT term          (#PCDATA | %tm;)*                            >
<!ATTLIST term          
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Phrase                          -->
<!--doc:The phrase (<ph>) element is used to organize content for reuse or conditional processing (for example, when part of a paragraph applies to a particular audience). It can be used by specializations of DITA to create semantic markup for content at the phrase level, which then allows (but does not require) specific processing or formatting.
Category: Body elements-->
<!ELEMENT ph            (%ph.cnt;)*                                  >  
<!ATTLIST ph              
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Trade Mark                      -->
<!--doc:The trademark (<tm>) element in DITA is used to markup and identify a term or phrase that is trademarked. Trademarks include registered trademarks, service marks, slogans and logos.
Category: Miscellaneous elements-->
<!ELEMENT tm            (#PCDATA | %tm;)*                            >
<!ATTLIST tm
             %univ-atts;
             trademark  CDATA                           #IMPLIED
             tmowner    CDATA                           #IMPLIED
             tmtype     (tm | reg | service | 
                         -dita-use-conref-target)       #REQUIRED
             tmclass    CDATA                           #IMPLIED     >


<!--                    LONG NAME: Boolean  (deprecated)           -->
<!--doc:The <boolean> element is used to express one of two opposite values, such as yes or no, on or off, true or false, high or low, and so forth. The element itself is empty; the value of the element is stored in its state attribute, and the semantic associated with the value is typically in a specialized name derived from this element.
Category: Specialization elements-->
<!ELEMENT boolean       EMPTY                                        >
<!ATTLIST boolean           
             state      (yes | no | 
                         -dita-use-conref-target)        #REQUIRED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: State                           -->
<!--                    A state can have a name and a string value, 
                        even if empty or indeterminate             -->
<!--doc:The <state> element specifies a name/value pair whenever it is necessary to represent a named state that has a variable value. The element is primarily intended for use in specializations to represent specific states (like logic circuit states, chemical reaction states, airplane instrumentation states, and so forth).
Category: Specialization elements-->
<!ELEMENT state         EMPTY                                        >
<!ATTLIST state          
             name       CDATA                            #REQUIRED
             value      CDATA                            #REQUIRED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Image Data                      -->
<!--doc:Include artwork or images in a DITA topic by using the <image> element. The <image> element has optional attributes that indicate whether the placement of the included graphic or artwork should be inline (like a button or icon) or on a separate line for a larger image. There are also optional attributes that indicate the size to which the included graphic or artwork should be scaled. An href attribute is required on the image element, as this attribute creates a pointer to the image, and allows the output formatting processor to bring the image into the text flow. To make the intent of the image more accessible for users using screen readers or text-only readers, always include a description of the image's content in the alt element.
Category: Body elements-->
<!ELEMENT image         (%alt;)?                                     >
<!ATTLIST image           
             href       CDATA                            #REQUIRED
             keyref     NMTOKEN                          #IMPLIED
             alt        CDATA                            #IMPLIED
             longdescref 
                        CDATA                            #IMPLIED
             height     NMTOKEN                          #IMPLIED
             width      NMTOKEN                          #IMPLIED
             align      CDATA                            #IMPLIED
             scale      NMTOKEN                          #IMPLIED
             placement  (inline | break | 
                         -dita-use-conref-target)        "inline"
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Alternate text                  -->
<!--doc:The alt element provides alternate text for an image. It is equivalent to the alt attribute on the image element; the attribute is deprecated, so the alt element should be used instead. As an element, alt provides direct text entry within an XML editor and is more easily accessed than an attribute for translation.
Category: Body elements-->
<!ELEMENT alt            (%words.cnt;)*>
<!ATTLIST alt             %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--                    LONG NAME: Object (Streaming/Executable 
                                   Data)                           -->
<!-- The longdescre attribute is an error which appeared in the
     original DTD implementation of OASIS DITA. It is an error that
     is not part of the standard. It was left here to provide time
     to change documents, but it will be removed at a later date.
     The longdescref (with ending F) should be used instead.       -->
<!--doc:DITA's <object> element corresponds to the HTML <object> element.
Category: Body elements-->
<!ELEMENT object        ((%desc;)?, (%param;)*, 
                         (%foreign.unknown.incl;)*)                  >
<!ATTLIST object
             declare    (declare)                        #IMPLIED
             classid    CDATA                            #IMPLIED
             codebase   CDATA                            #IMPLIED
             data       CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             codetype   CDATA                            #IMPLIED
             archive    CDATA                            #IMPLIED
             standby    CDATA                            #IMPLIED
             height     NMTOKEN                          #IMPLIED
             width      NMTOKEN                          #IMPLIED
             usemap     CDATA                            #IMPLIED
             name       CDATA                            #IMPLIED
             tabindex   NMTOKEN                          #IMPLIED
             longdescref
                        CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    
             longdescre CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter                       -->
<!--doc:The parameter (<param>) element specifies a set of values that may be required by an <object> at runtime. Any number of <param> elements may appear in the content of an object in any order, but must be placed at the start of the content of the enclosing object. This element is comparable to the XHMTL <param> element.
Category: Body elements-->
<!ELEMENT param         EMPTY>
<!ATTLIST param
             %univ-atts;
             name       CDATA                            #REQUIRED
             value      CDATA                            #IMPLIED
             valuetype  (data | ref | object | 
                         -dita-use-conref-target)        #IMPLIED
             type       CDATA                            #IMPLIED    >  


<!--                    LONG NAME: Simple Table                    -->
<!--doc:The <simpletable> element is used for tables that are regular in structure and do not need a caption. Choose the simple table element when you want to show information in regular rows and columns. For example, multi-column tabular data such as phone directory listings or parts lists are good candidates for simpletable. Another good use of simpletable is for information that seems to beg for a "three-part definition list"—just use the keycol attribute to indicate which column represents the "key" or term-like column of your structure.
Category: Table elements-->
<!ELEMENT simpletable   ((%sthead;)?, (%strow;)+)                    >
<!ATTLIST simpletable     
             relcolwidth 
                        CDATA                            #IMPLIED
             keycol     NMTOKEN                          #IMPLIED
             refcols    NMTOKENS                         #IMPLIED
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Simple Table Head               -->
<!--doc:The simpletable header (<sthead>) element contains the table's header row. The header row is optional in a simple table.
Category: Table elements-->
<!ELEMENT sthead        (%stentry;)+                                 >
<!ATTLIST sthead     
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Simple Table Row                -->
<!--doc:The <simpletable> row (<strow>) element specifies a row in a simple table.
Category: Table elements-->
<!ELEMENT strow         (%stentry;)*                                 >
<!ATTLIST strow        
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Simple Table Cell (entry)       -->
<!--doc:The simpletable entry (<stentry>) element represents a single table cell, like <entry> in <table>. You can place any number of stentry cells in either an <sthead> element (for headings) or <strow> element (for rows of data).
Category: Table elements-->
<!ELEMENT stentry       (%tblcell.cnt;)*                             >
<!ATTLIST stentry 
             specentry  CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Review Comments Block           -->
<!--doc:The <draft-comment> element allows simple review and discussion of topic contents within the marked-up content. Use the <draft-comment> element to ask a question or make a comment that you would like others to review. To indicate the source of the draft comment or the status of the comment, use the author, time or disposition attributes.
Category: Miscellaneous elements-->
<!ELEMENT draft-comment (#PCDATA | %basic.phandblock; | 
                         %data.elements.incl; | 
                         %foreign.unknown.incl;)*                    >
<!ATTLIST draft-comment   
             author     CDATA                            #IMPLIED
             time       CDATA                            #IMPLIED
             disposition  
                        (issue | open | accepted | rejected |
                         deferred| duplicate | reopened |
                         unassigned | completed | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-translate-no;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Required Cleanup Block          -->
<!--doc:A <required-cleanup> element is used as a placeholder for migrated elements that cannot be appropriately tagged without manual intervention. As the element name implies, the intent for authors is to clean up the contained material and eventually get rid of the <required-cleanup> element. Authors should not insert this element into documents.
Category: Specialization elements-->
<!ELEMENT required-cleanup 
                        ANY                                          >
<!ATTLIST required-cleanup 
             remap      CDATA                            #IMPLIED
             %univ-atts-translate-no;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Footnote                        -->
<!--doc:Use footnote (<fn>) to annotate text with notes that are not appropriate for inclusion in line or to indicate the source for facts or other material used in the text.
Category: Miscellaneous elements-->
<!ELEMENT fn            (%fn.cnt;)*                                  >
<!ATTLIST fn              
             callout    CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Index Term                      -->
<!--doc:An <indexterm> element allows the author to indicate that a certain word or phrase should produce an index entry in the generated index.
Category: Miscellaneous elements-->
<!ELEMENT indexterm     (%words.cnt;|%indexterm;|%index-base;)*      >
<!ATTLIST indexterm
             keyref     CDATA                             #IMPLIED
             start      CDATA                             #IMPLIED
             end        CDATA                             #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Index Base                      -->
<!--doc:The <index-base> element allows indexing extensions to be added by specializing off this element. It does not in itself have any meaning and should be ignored in processing.
Category: Miscellaneous elements-->
<!ELEMENT index-base    (%words.cnt;|%indexterm;)*                   >
<!ATTLIST index-base
             keyref     CDATA                             #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Index term reference            -->
<!--doc:This element is not completely defined, and is reserved for future use.
Category: Miscellaneous elements-->
<!ELEMENT indextermref   EMPTY>
<!ATTLIST indextermref    keyref CDATA #REQUIRED
                          %univ-atts;
>

<!--                    LONG NAME: Citation (bibliographic source) -->
<!--doc:The <cite> element is used when you need a bibliographic citation that refers to a book or article. It specifically identifies the title of the resource.
Category: Body elements-->
<!ELEMENT cite          (%xrefph.cnt;)*                              >
<!ATTLIST cite            
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Cross Reference/Link            -->
<!--doc:Use the cross-reference (<xref>) element to link to a different location within the current topic, or a different topic within the same help system, or to external sources, such as Web pages, or to a location in another topic. The href attribute on the <xref> element provides the location of the target.
Category: Body elements-->
<!ELEMENT xref          (%xreftext.cnt; | %desc;)*                   >
<!ATTLIST xref            
             href       CDATA                            #IMPLIED
             keyref     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             %univ-atts;
             format     CDATA                            #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)        #IMPLIED
             outputclass 
                        CDATA                            #IMPLIED    >


<!ENTITY % tableXML       PUBLIC  
"-//OASIS//ELEMENTS DITA Exchange Table Model//EN" 
"tblDecl.mod"                                                        >
%tableXML;

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->
             
<!ATTLIST alt       %global-atts;  class CDATA "- topic/alt "        >
<!ATTLIST boolean   %global-atts;  class CDATA "- topic/boolean "    >
<!ATTLIST cite      %global-atts;  class CDATA "- topic/cite "       >
<!ATTLIST dd        %global-atts;  class CDATA "- topic/dd "         >
<!ATTLIST data      %global-atts;  class CDATA "- topic/data "       >
<!ATTLIST data-about
                    %global-atts;  class CDATA "- topic/data-about ">
<!ATTLIST ddhd      %global-atts;  class CDATA "- topic/ddhd "       >
<!ATTLIST desc      %global-atts;  class CDATA "- topic/desc "       >
<!ATTLIST dl        %global-atts;  class CDATA "- topic/dl "         >
<!ATTLIST dlentry   %global-atts;  class CDATA "- topic/dlentry "    >
<!ATTLIST dlhead    %global-atts;  class CDATA "- topic/dlhead "     >
<!ATTLIST draft-comment 
                    %global-atts;  class CDATA "- topic/draft-comment ">
<!ATTLIST dt        %global-atts;  class CDATA "- topic/dt "         >
<!ATTLIST dthd      %global-atts;  class CDATA "- topic/dthd "       >
<!ATTLIST fig       %global-atts;  class CDATA "- topic/fig "        >
<!ATTLIST figgroup  %global-atts;  class CDATA "- topic/figgroup "   >
<!ATTLIST fn        %global-atts;  class CDATA "- topic/fn "         >
<!ATTLIST foreign   %global-atts;  class CDATA "- topic/foreign "    >
<!ATTLIST image     %global-atts;  class CDATA "- topic/image "      >
<!ATTLIST indexterm %global-atts;  class CDATA "- topic/indexterm "  >
<!ATTLIST index-base %global-atts;  class CDATA "- topic/index-base ">
<!ATTLIST indextermref 
                    %global-atts;  class CDATA "- topic/indextermref ">
<!ATTLIST itemgroup %global-atts;  class CDATA "- topic/itemgroup "  >
<!ATTLIST keyword   %global-atts;  class CDATA "- topic/keyword "    >
<!ATTLIST li        %global-atts;  class CDATA "- topic/li "         >
<!ATTLIST lines     %global-atts;  class CDATA "- topic/lines "      >
<!ATTLIST lq        %global-atts;  class CDATA "- topic/lq "         >
<!ATTLIST note      %global-atts;  class CDATA "- topic/note "       >
<!ATTLIST object    %global-atts;  class CDATA "- topic/object "     >
<!ATTLIST ol        %global-atts;  class CDATA "- topic/ol "         >
<!ATTLIST p         %global-atts;  class CDATA "- topic/p "          >
<!ATTLIST param     %global-atts;  class CDATA "- topic/param "      >
<!ATTLIST ph        %global-atts;  class CDATA "- topic/ph "         >
<!ATTLIST pre       %global-atts;  class CDATA "- topic/pre "        >
<!ATTLIST q         %global-atts;  class CDATA "- topic/q "          >
<!ATTLIST required-cleanup 
                    %global-atts;  class CDATA "- topic/required-cleanup ">
<!ATTLIST simpletable 
                    %global-atts;  class CDATA "- topic/simpletable ">
<!ATTLIST sl        %global-atts;  class CDATA "- topic/sl "         >
<!ATTLIST sli       %global-atts;  class CDATA "- topic/sli "        >
<!ATTLIST state     %global-atts;  class CDATA "- topic/state "      >
<!ATTLIST stentry   %global-atts;  class CDATA "- topic/stentry "    >
<!ATTLIST sthead    %global-atts;  class CDATA "- topic/sthead "     >
<!ATTLIST strow     %global-atts;  class CDATA "- topic/strow "      >
<!ATTLIST term      %global-atts;  class CDATA "- topic/term "       >
<!ATTLIST title     %global-atts;  class CDATA "- topic/title "      >
<!ATTLIST tm        %global-atts;  class CDATA "- topic/tm "         >
<!ATTLIST ul        %global-atts;  class CDATA "- topic/ul "         >
<!ATTLIST unknown   %global-atts;  class CDATA "- topic/unknown "    >
<!ATTLIST xref      %global-atts;  class CDATA "- topic/xref "       >


<!-- ================== End Common Elements Module  ============== -->
