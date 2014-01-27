<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Map                                          -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Map//EN"
      Delivered as file "map.mod"                                  -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Maps                      -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Corrected public ID in the comment above   -->
<!--    2005.11.15 RDA: Removed old declaration for topicreftypes  -->
<!--                      entity                                   -->
<!--    2006.06.06 RDA: Removed default locktitle="yes" from       -->
<!--                      %topicref-atts-no-toc;                   -->
<!--                    Remove keyword declaration                 -->
<!--                    Add reference to commonElements            -->
<!--                    Add title element to map                   -->
<!--                    Add data element to topicmeta              -->
<!--                    Remove shortdesc declaration               -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
<!--    2006.06.14 RDA: Add dir attribute to localization-atts     -->
<!--    2006.06.14 RDA: Add outputclass attribute to most elemetns -->
<!--    2006.11.30 RDA: Add -dita-use-conref-target to enumerated  -->
<!--                      attributes                               -->
<!--    2006.11.30 RDA: Remove #FIXED from DITAArchVersion         -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ARCHITECTURE ENTITIES                       -->
<!-- ============================================================= -->

<!-- default namespace prefix for DITAArchVersion attribute can be
     overridden through predefinition in the document type shell   -->
<!ENTITY % DITAArchNSPrefix
                       "ditaarch"                                    >

<!-- must be instanced on each topic type                          -->
<!ENTITY % arch-atts "
             xmlns:%DITAArchNSPrefix; 
                        CDATA                              #FIXED
                       'http://dita.oasis-open.org/architecture/2005/'
             %DITAArchNSPrefix;:DITAArchVersion
                        CDATA                              '1.1'"    >

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % map         "map"                                         >
<!ENTITY % anchor      "anchor"                                      >
<!ENTITY % linktext    "linktext"                                    >
<!ENTITY % navref      "navref"                                      >
<!ENTITY % relcell     "relcell"                                     >
<!ENTITY % relcolspec  "relcolspec"                                  >
<!ENTITY % relheader   "relheader"                                   >
<!ENTITY % relrow      "relrow"                                      >
<!ENTITY % reltable    "reltable"                                    >
<!ENTITY % searchtitle "searchtitle"                                 >
<!ENTITY % shortdesc   "shortdesc"                                   >
<!ENTITY % topicmeta   "topicmeta"                                   >
<!ENTITY % topicref    "topicref"                                    >


<!-- ============================================================= -->
<!--                    ENTITY DECLARATIONS FOR ATTRIBUTE VALUES   -->
<!-- ============================================================= -->


<!--                    DATE FORMAT                                -->
<!-- Copied into metaDecl.mod -->
<!--<!ENTITY % date-format  'CDATA'                               >-->


<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->


<!ENTITY % topicref-atts 
            'collection-type 
                        (choice | unordered |
                         sequence | family | 
                         -dita-use-conref-target)         #IMPLIED
             type       CDATA                             #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)         #IMPLIED
             locktitle  (yes | no | 
                         -dita-use-conref-target)         #IMPLIED
             format     CDATA                             #IMPLIED
             linking    (none | normal | 
                         sourceonly | targetonly |
                         -dita-use-conref-target)         #IMPLIED
             toc        (yes | no | 
                         -dita-use-conref-target)         #IMPLIED
             print      (yes | no | printonly | 
                         -dita-use-conref-target)         #IMPLIED
             search     (yes | no | 
                         -dita-use-conref-target)         #IMPLIED
             chunk      CDATA                             #IMPLIED'  >


<!ENTITY % topicref-atts-no-toc 
            'collection-type
                        (choice | unordered | 
                         sequence | family |
                         -dita-use-conref-target)         #IMPLIED
             type       CDATA                             #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)         #IMPLIED
             locktitle  (yes | no |
                         -dita-use-conref-target)         #IMPLIED
             format     CDATA                             #IMPLIED
             linking    (targetonly | sourceonly | 
                         normal | none | 
                         -dita-use-conref-target)         #IMPLIED
             toc        (yes | no | 
                         -dita-use-conref-target)         "no"
             print      (yes | no | printonly | 
                         -dita-use-conref-target)         #IMPLIED
             search     (yes | no | 
                         -dita-use-conref-target)         #IMPLIED
             chunk      CDATA                             #IMPLIED'  >



<!-- ============================================================= -->
<!--                    MODULES CALLS                              -->
<!-- ============================================================= -->


<!--                      Content elements common to map and topic -->
<!ENTITY % commonElements      PUBLIC 
"-//OASIS//ELEMENTS DITA Common Elements//EN" "commonElements.mod"   >
%commonElements;

<!--                      MetaData Elements                        -->
<!ENTITY % metaXML      PUBLIC 
"-//OASIS//ELEMENTS DITA Metadata//EN" "metaDecl.mod"                >
%metaXML;
  
<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->

<!ENTITY included-domains ""                                         >
  
<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->





<!--                    LONG NAME: Map                             -->
<!--doc:The <map> element is used to define a map which describes the relationships among a set of resources, such as DITA topics. Maps consist of references to topics and other resources organized into hierarchies, groups, and tables. Maps provide a way to express these relationships in a single common format that can be used for different outputs.
Category: Map elements-->
<!ELEMENT  map          ((%title;)?, (%topicmeta;)?, 
                         (%navref;|%anchor;|%topicref;|%reltable;|
                          %data.elements.incl;)* )                   >
<!ATTLIST  map 
             title      CDATA                             #IMPLIED
             id         ID                                #IMPLIED
             conref     CDATA                             #IMPLIED
             anchorref  CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %localization-atts;
             %arch-atts;
             domains    CDATA                  "&included-domains;" 
             %topicref-atts;
             %select-atts;                                           >


<!--                    LONG NAME: Navigation Reference            -->
<!--doc:The <navref> represents a pointer to another map which should be preserved as a transcluding link rather than resolved. Output formats that support such linking will integrate the target when displaying the referencing map to an end user.
Category: Map elements-->
<!ELEMENT  navref       EMPTY                                        >
<!ATTLIST  navref
             %univ-atts;
             outputclass 
                        CDATA                             #IMPLIED
             mapref     CDATA                             #IMPLIED   >


<!--                    LONG NAME: Topic Reference                 -->
<!--doc:The <topicref> element identifies a topic (such as a concept, task, or reference) or other resource. A <topicref> can contain other<topicref> elements, allowing you to express navigation or table-of-contents hierarchies, as well as implying relationships between the containing <topicref> and its children. You can set the collection-type of a container <topicref> to determine how its children are related to each other. You can also express relationships among <topicref>s using group and table structures (using <topicgroup> and <reltable>). Relationships end up expressed as links in the output (with each participant in a relationship having links to the other participants by default).
Category: Map elements-->
<!ELEMENT  topicref     ((%topicmeta;)?, 
                         (%topicref; | %navref; | %anchor; |
                          %data.elements.incl;)* )                   >
<!ATTLIST  topicref
             navtitle   CDATA                             #IMPLIED
             href       CDATA                             #IMPLIED
             keyref     CDATA                             #IMPLIED
             query      CDATA                             #IMPLIED
             copy-to    CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;                                             >


<!--                    LONG NAME: Anchor                          -->
<!--doc:The <anchor> element is used for runtime integration of navigation. It provides an integration point that another map can point to in order to insert its navigation into the current navigation tree. For those familiar with Eclipse help systems, this serves the same purpose as the <anchor> element in that system. It may not be supported for all output formats.
Category: Map elements-->
<!ELEMENT  anchor       EMPTY                                        >
<!ATTLIST  anchor
             outputclass 
                        CDATA                             #IMPLIED
             %localization-atts;
             id         ID                                #REQUIRED   
             conref     CDATA                             #IMPLIED    
             %select-atts;                                           >


<!--                    LONG NAME: Relationship Table              -->
<!--doc:The relationship table (<reltable>) defines relationships between topics, based on the familiar table model of rows (<relrow>), columns (<relheader>), and cells (<relcell>). The <relcell> elements can contain <topicref> elements, which are then related to other <topicref> elements in the same row (although not necessarily in the same cell). By default, the contents of a <reltable> element are not output for navigation or TOC purposes, and are used only to define relationships that can be expressed as topic-to-topic links.
Category: Map elements-->
<!ELEMENT  reltable     ((%topicmeta;)?, (%relheader;)?, 
                         (%relrow;)+)                                >
<!ATTLIST  reltable        
             title      CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts-no-toc;
             %univ-atts;                                             >


<!--                    LONG NAME: Relationship Header             -->
<!--doc:The <relheader> element is a row of column definitions (<relcolspec> elements) in a relationship table. Each table can have only one set of column definitions.
Category: Map elements-->
<!ELEMENT  relheader    (%relcolspec;)+                              >
<!ATTLIST  relheader
             %univ-atts;                                             >        


<!--                    LONG NAME: Relationship Column Specification
                                                                   -->
<!--doc:A column definition in the relationship table. You can use <relcolspec> column definitions to set defaults for the attributes of <topicref> elements in the column. For example, you can set type="concept" to treat all untyped <topicref> elements in the column as concepts.
Category: Map elements-->
<!ELEMENT  relcolspec   (%topicmeta;)?                               >
<!ATTLIST  relcolspec
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;                                             >


<!--                    LONG NAME: Relationship Table Row          -->
<!--doc:A <relrow> is a row in the relationship table. This creates a relationship between the cells in the row, which will end up expressed as links among the <topicref> elements in the cells.
Category: Map elements-->
<!ELEMENT relrow        (%relcell;)*                                 >
<!ATTLIST relrow
             outputclass 
                        CDATA                             #IMPLIED
             %univ-atts;                                             >


<!--                    LONG NAME: Relationship Table Cell         -->
<!--doc:A <relcell> element is a cell in the relationship table. The <topicref> elements it contains will be related to topicrefs in other cells of the same row. By default, topicrefs in the same cell are not related to each other, unless you change the relcell's collection-type attribute to indicate that they are related.
Category: Map elements-->
<!ELEMENT relcell         ((%topicref;|%data.elements.incl;)*)>
<!ATTLIST relcell
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;                                             >


<!--                    LONG NAME: Topic Metadata                  -->
<!--doc:The <topicmeta> element defines the metadata that applies to a topic when it appears in a map, and to the other topics in the map that are contained by the same element that contains the <topicmeta> element. When creating links, it can also be used to override the title and short description of the topic. In addition, it can be used to add index entries to referenced content using the <keywords> element.
Category: Map elements-->
<!ELEMENT  topicmeta    ((%linktext;)?, (%searchtitle;)?, 
                         (%shortdesc;)?, (%author;)*, (%source;)?, 
                         (%publisher;)?, (%copyright;)*, 
                         (%critdates;)?, (%permissions;)?, 
                         (%audience;)*, (%category;)*, 
                         (%keywords;)*, (%prodinfo;)*, (%othermeta;)*, 
                         (%resourceid;)*, 
                         (%data.elements.incl; | 
                          %foreign.unknown.incl;)*)                  >
<!ATTLIST  topicmeta
             lockmeta   (yes | no | 
                         -dita-use-conref-target)         #IMPLIED
             %univ-atts;                                             >


<!--                    LONG NAME: Link Text                       -->
<!--doc:The <linktext> element provides the literal label or line of text for a link. In most cases, the text of a link can be resolved during processing by cross reference with the target resource. Use the <linktext> element only when the target cannot be reached, such as when it is a peer or external link, or the target is local but not in DITA format. When used inside a topic, it will be used as the text for the specified link; when used within a map, it will be used as the text for generated links that point to the specified topic.
Category: Related Links elements-->
<!ELEMENT  linktext     (%words.cnt;)*                               >
<!ATTLIST  linktext
             outputclass 
                        CDATA                             #IMPLIED
             %univ-atts;                                             >


<!--                    LONG NAME: Search Title                    -->
<!--doc:When your DITA topic is transformed to XHTML, the <searchtitle> element is used to create a title element at the top of the resulting HTML file. This title is normally used in search result summaries by some search engines, such as that in Eclipse (http://eclipse.org); if not set, the XHTML's title element defaults to the source topic's title content (which may not be as well optimized for search summaries)
Category: Topic elements-->
<!ELEMENT  searchtitle  (%words.cnt;)*                               >
<!ATTLIST  searchtitle
             outputclass 
                        CDATA                             #IMPLIED
             %univ-atts;                                             >


<!--                    LONG NAME: Short Description               -->
<!--doc:The short description (<shortdesc>) element occurs between the topic title and the topic body, as the initial paragraph-like content of a topic, or it can be embedded in an abstract element. The short description, which represents the purpose or theme of the topic, is also intended to be used as a link preview and for searching. When used within a DITA map, the short description of the <topicref> can be used to override the short description in the topic.
Category: Topic elements-->
<!--<!ELEMENT  shortdesc    (%words.cnt;)*                        >-->
         

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST map         %global-atts;  class CDATA "- map/map "        >
<!ATTLIST navref      %global-atts;  class CDATA "- map/navref "     >
<!ATTLIST topicref    %global-atts;  class CDATA "- map/topicref "   >
<!ATTLIST anchor      %global-atts;  class CDATA "- map/anchor "     >
<!ATTLIST reltable    %global-atts;  class CDATA "- map/reltable "   >
<!ATTLIST relheader   %global-atts;  class CDATA "- map/relheader "  >
<!ATTLIST relcolspec  %global-atts;  class CDATA "- map/relcolspec " >
<!ATTLIST relrow      %global-atts;  class CDATA "- map/relrow "     >
<!ATTLIST relcell     %global-atts;  class CDATA "- map/relcell "    >
<!ATTLIST topicmeta   %global-atts;  class CDATA "- map/topicmeta "  >
<!ATTLIST linktext    %global-atts;  class CDATA "- map/linktext "   >
<!ATTLIST searchtitle %global-atts;  class CDATA "- map/searchtitle ">

<!-- Shortdesc in topic uses topic/shortdesc so this one must be 
     included, even though the element is common. -->
<!ATTLIST shortdesc   %global-atts;  class CDATA "- map/shortdesc "  >


<!-- ================== End DITA Map ============================= -->
