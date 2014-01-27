<!--
 | (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//Elements DITA Map//EN"
 |
 | Release history (vrm):
 |   1.0.0 Initial release on developerWorks, March 2001 (dita00.zip)
 |   1.0.1 fix 1 on developerWorks, October 2001 (dita01.zip)
 |   1.0.2 consolidated redesign December 2001
 |   1.0.3 fix 1, dtd freeze for UCD-1 January 2002
 |   1.1.0 Release 1 March 2002 (dita10.zip)
 |   1.1.1 Release 1.1 December 2002
 |   1.1.2 Release 1.2 June 2003
 |   1.1.2 Release 1.3 March 2004: bug fixes
 |   1.1.3a bug fix: completed removal of erroneous term/tm inclusion from words.cnt
 |   1.1.3a bug fix: cut keyword def from meta_xml; paste into topic.mod unchanged, put into map.mod with no tm
 |   1.1.3a bug fix: moved keyword declaration to follow meta_xml inclusion (PE reference order issue)
 *-->

<!ENTITY DTDVersion 'V1.1.3' >


<!--element redefinitions -->
<!ENTITY % map         "map">
<!ENTITY % navref      "navref">
<!ENTITY % topicref    "topicref">
<!ENTITY % anchor      "anchor">
<!ENTITY % reltable    "reltable">
<!ENTITY % relheader   "relheader">
<!ENTITY % relcolspec  "relcolspec">
<!ENTITY % relrow      "relrow">
<!ENTITY % relcell     "relcell">
<!ENTITY % topicmeta   "topicmeta">
<!ENTITY % linktext    "linktext">

<!ENTITY % searchtitle "searchtitle">
<!ENTITY % shortdesc   "shortdesc">


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

<!ENTITY % topicreftypes 'topic | concept | task | reference | external | local'>

<!ENTITY % topicref-atts 'collection-type    (choice|unordered|sequence|family) #IMPLIED
  type CDATA #IMPLIED
  scope (local | peer | external) #IMPLIED
  locktitle    (yes|no) #IMPLIED
  format        CDATA   #IMPLIED
  linking (targetonly|sourceonly|normal|none) #IMPLIED
  toc           (yes|no) #IMPLIED
  print         (yes|no) #IMPLIED
  search        (yes|no) #IMPLIED
  chunk         CDATA    #IMPLIED'
>

<!ENTITY % date-format   'CDATA'>

<!ENTITY % topicref-atts-no-toc 'collection-type  (choice|unordered|sequence|family) #IMPLIED
  type CDATA #IMPLIED
  scope (local | peer | external) #IMPLIED
  locktitle    (yes|no) "yes"
  format        CDATA   #IMPLIED
  linking (targetonly|sourceonly|normal|none) #IMPLIED
  toc           (yes|no) "no"
  print         (yes|no) #IMPLIED
  search        (yes|no) #IMPLIED
  chunk         CDATA    #IMPLIED'
>

<!--[20040606.01 DRD: move all keyword definitions from meta_xml.mod into map.mod, with new definitions]-->
<!ENTITY % keyword "keyword">

<!--doc:The <keyword> element identifies a keyword or token, such as a single value from an enumerated list, the name of a command or parameter, product name, or a lookup key for a message.
Category: Body elements-->
<!ELEMENT keyword        (#PCDATA)>
<!ATTLIST keyword         keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!ATTLIST keyword %global-atts; class CDATA "- topic/keyword ">

<!ENTITY % words.cnt            "#PCDATA | %keyword;">


<!ENTITY % metaXML PUBLIC "-//IBM//ELEMENTS DITA Metadata//EN" "meta_xml.mod">
  %metaXML;



<!--doc:The <map> element is used to define a map which describes the relationships among a set of resources, such as DITA topics. Maps consist of references to topics and other resources organized into hierarchies, groups, and tables. Maps provide a way to express these relationships in a single common format that can be used for different outputs.
Category: Map elements-->
<!ELEMENT map ((%topicmeta;)?,(%navref;|%anchor;|%topicref;|%reltable;)*)>
<!ATTLIST map title       CDATA #IMPLIED
                          id        ID    #IMPLIED
                          anchorref CDATA #IMPLIED
                          %topicref-atts;
                          %select-atts;
                          DTDVersion CDATA #FIXED "&DTDVersion;"
                          domains CDATA "&included-domains;"
>

<!--doc:The <navref> represents a pointer to another map which should be preserved as a transcluding link rather than resolved. Output formats that support such linking will integrate the target when displaying the referencing map to an end user.
Category: Map elements-->
<!ELEMENT navref          EMPTY>
<!ATTLIST navref          mapref CDATA #IMPLIED>


<!--doc:The <topicref> element identifies a topic (such as a concept, task, or reference) or other resource. A <topicref> can contain other<topicref> elements, allowing you to express navigation or table-of-contents hierarchies, as well as implying relationships between the containing <topicref> and its children. You can set the collection-type of a container <topicref> to determine how its children are related to each other. You can also express relationships among <topicref>s using group and table structures (using <topicgroup> and <reltable>). Relationships end up expressed as links in the output (with each participant in a relationship having links to the other participants by default).
Category: Map elements-->
<!ELEMENT topicref ((%topicmeta;)?, (%topicref;|%navref;|%anchor;)*)>
<!ATTLIST topicref
  navtitle     CDATA     #IMPLIED
  id           ID        #IMPLIED
  href         CDATA     #IMPLIED
  keyref       CDATA     #IMPLIED
  query        CDATA     #IMPLIED
  conref       CDATA     #IMPLIED
  copy-to      CDATA     #IMPLIED
  %topicref-atts;
  %select-atts;
>

<!--doc:The <anchor> element is used for runtime integration of navigation. It provides an integration point that another map can point to in order to insert its navigation into the current navigation tree. For those familiar with Eclipse help systems, this serves the same purpose as the <anchor> element in that system. It may not be supported for all output formats.
Category: Map elements-->
<!ELEMENT anchor EMPTY>
<!ATTLIST anchor id   ID #REQUIRED>


<!--relationship table-->
<!--doc:The relationship table (<reltable>) defines relationships between topics, based on the familiar table model of rows (<relrow>), columns (<relheader>), and cells (<relcell>). The <relcell> elements can contain <topicref> elements, which are then related to other <topicref> elements in the same row (although not necessarily in the same cell). By default, the contents of a <reltable> element are not output for navigation or TOC purposes, and are used only to define relationships that can be expressed as topic-to-topic links.
Category: Map elements-->
<!ELEMENT reltable    ((%topicmeta;)?, (%relheader;)?, (%relrow;)+) >
<!ATTLIST reltable     title CDATA #IMPLIED
                       %id-atts;
                          %topicref-atts-no-toc;
                          %select-atts;
>


<!--doc:The <relheader> element is a row of column definitions (<relcolspec> elements) in a relationship table. Each table can have only one set of column definitions.
Category: Map elements-->
<!ELEMENT relheader (%relcolspec;)+>

<!--doc:A column definition in the relationship table. You can use <relcolspec> column definitions to set defaults for the attributes of <topicref> elements in the column. For example, you can set type="concept" to treat all untyped <topicref> elements in the column as concepts.
Category: Map elements-->
<!ELEMENT relcolspec (%topicmeta;)?>
<!ATTLIST relcolspec
                          %topicref-atts;
                          %select-atts;
>


<!--doc:A <relrow> is a row in the relationship table. This creates a relationship between the cells in the row, which will end up expressed as links among the <topicref> elements in the cells.
Category: Map elements-->
<!ELEMENT relrow (%relcell;)*>
<!ATTLIST relrow          %id-atts;
                          %select-atts;
>

<!--doc:A <relcell> element is a cell in the relationship table. The <topicref> elements it contains will be related to topicrefs in other cells of the same row. By default, topicrefs in the same cell are not related to each other, unless you change the relcell's collection-type attribute to indicate that they are related.
Category: Map elements-->
<!ELEMENT relcell ((%topicref;)*)>
<!ATTLIST relcell         %id-atts;
                          %topicref-atts;
>


<!--doc:The <topicmeta> element defines the metadata that applies to a topic when it appears in a map, and to the other topics in the map that are contained by the same element that contains the <topicmeta> element. When creating links, it can also be used to override the title and short description of the topic. In addition, it can be used to add index entries to referenced content using the <keywords> element.
Category: Map elements-->
<!ELEMENT topicmeta ((%linktext;)?,(%searchtitle;)?,(%shortdesc;)?,(%author;)*,(%source;)?,(%publisher;)?,(%copyright;)*,(%critdates;)?,(%permissions;)?,(%audience;)*,(%category;)*,(%keywords;)*,(%prodinfo;)*,(%othermeta;)*,(%resourceid;)*)>
<!ATTLIST topicmeta lockmeta (yes|no) #IMPLIED>


<!--doc:The <linktext> element provides the literal label or line of text for a link. In most cases, the text of a link can be resolved during processing by cross reference with the target resource. Use the <linktext> element only when the target cannot be reached, such as when it is a peer or external link, or the target is local but not in DITA format. When used inside a topic, it will be used as the text for the specified link; when used within a map, it will be used as the text for generated links that point to the specified topic.
Category: Related Links elements-->
<!ELEMENT linktext (%words.cnt;)*>
<!--doc:When your DITA topic is transformed to XHTML, the <searchtitle> element is used to create a title element at the top of the resulting HTML file. This title is normally used in search result summaries by some search engines, such as that in Eclipse (http://eclipse.org); if not set, the XHTML's title element defaults to the source topic's title content (which may not be as well optimized for search summaries)
Category: Topic elements-->
<!ELEMENT searchtitle (%words.cnt;)*>
<!--doc:The short description (<shortdesc>) element occurs between the topic title and the topic body, as the initial paragraph-like content of a topic, or it can be embedded in an abstract element. The short description, which represents the purpose or theme of the topic, is also intended to be used as a link preview and for searching. When used within a DITA map, the short description of the <topicref> can be used to override the short description in the topic.
Category: Topic elements-->
<!ELEMENT shortdesc (%words.cnt;)*>



<!--identity-->
<!--@navtitle - the title of the target topic for use in navigation - may be derived (from topic's navtitle or title), or may be locally defined-->
<!--@id - an id for the reference itself - to allow the topicref and its children to be reused by other maps, or elsehere in same map-->

<!--referencing-->
<!--@href - the URL/URI for the target topic eg ..\ref\bigfile.xml#mytopic-->
<!--@keyref - a key that the processor can use to look up the URL/URI for the target-->
<!--@query - lists query criteria, or uses topicref's metadata as criteria; pulls in matching topics under the current one if title is present, or replaces the current location if title is not-->
<!--@conref - pulls in another topicref and its children by URL plus id or just id if local-->


<!--sorting-->
<!--@collection-type - used to identify the kind of grouping for child topicrefs-->
<!--FUTURE: @sortkey - lists criteria for sorting children - won't apply when colltype=sequence; should be able to list multiple criteria -eg @type @title gives order by type but alpha within type-->

<!--metadata-->
<!--@type - the type of the target topic - should match the target's root topic elem or one of its ancestors in its class attribute-->

<!--processing info-->
<!--@locktitle - set to yes if you want the local def of the title to override the target-->
<!--@linking - targetonly means that the current ref will be a target for links generated from the rel, but will not be a source for any of those links (ie, no links based on the context rel will be added to the referenced topic-->

<!--specialization attributes-->
<!ATTLIST map %global-atts; class CDATA "- map/map ">
<!ATTLIST navref %global-atts; class CDATA "- map/navref ">
<!ATTLIST topicref %global-atts; class CDATA "- map/topicref ">
<!ATTLIST anchor %global-atts; class CDATA "- map/anchor ">
<!ATTLIST reltable %global-atts; class CDATA "- map/reltable ">
<!ATTLIST relheader %global-atts; class CDATA "- map/relheader ">
<!ATTLIST relcolspec %global-atts; class CDATA "- map/relcolspec ">
<!ATTLIST relrow %global-atts; class CDATA "- map/relrow ">
<!ATTLIST relcell %global-atts; class CDATA "- map/relcell ">
<!ATTLIST topicmeta %global-atts; class CDATA "- map/topicmeta ">
<!ATTLIST linktext %global-atts; class CDATA "- map/linktext ">
<!ATTLIST searchtitle %global-atts; class CDATA "- map/searchtitle ">
<!ATTLIST shortdesc %global-atts; class CDATA "- map/shortdesc ">
