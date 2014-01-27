<!--  
 |  (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ENTITIES DITA Metadata//EN"
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
 |   1.1.3a architecture: introduced tm into keyword to support conrefing of product names
 |          bug fix: cut keyword def from meta_xml; paste into topic.mod unchanged, put into map.mod with no tm
 *-->

<!ENTITY % author "author">
<!ENTITY % source "source">
<!ENTITY % publisher "publisher">
<!ENTITY % copyright "copyright">
<!ENTITY % copyryear "copyryear">
<!ENTITY % copyrholder "copyrholder">
<!ENTITY % critdates "critdates">
<!ENTITY % created "created">
<!ENTITY % revised "revised">
<!ENTITY % permissions "permissions">
<!ENTITY % category "category">
<!ENTITY % audience "audience">
<!ENTITY % keywords "keywords">
<!ENTITY % prodinfo "prodinfo">
<!ENTITY % prodname "prodname">
<!ENTITY % vrmlist "vrmlist">
<!ENTITY % vrm "vrm">
<!ENTITY % brand "brand">
<!ENTITY % series "series">
<!ENTITY % platform "platform">
<!ENTITY % prognum "prognum">
<!ENTITY % featnum "featnum">
<!ENTITY % component "component">
<!ENTITY % othermeta "othermeta">
<!ENTITY % resourceid "resourceid">
<!ENTITY % indexterm "indexterm">


<!--doc:The <author> metadata element contains the name of the topic's author.
Category: Prolog elements-->
<!ELEMENT author         (%words.cnt;)*>
<!ATTLIST author          href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          type (creator|contributor) #IMPLIED
>
<!--doc:The <source> element contains a reference to a resource from which the present topic is derived, either completely or in part. The element can contain a description of the resource; the href reference can be a string or a URL that points to it.
Category: Prolog elements-->
<!ELEMENT source         (%words.cnt;)*>
<!ATTLIST source          href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
>
<!--doc:The <publisher> metadata element contains the name of the person, company, or organization responsible for making the content or subject of the topic available.
Category: Prolog elements-->
<!ELEMENT publisher      (%words.cnt;)*>
<!ATTLIST publisher       href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          %select-atts;
>
<!--doc:The <copyright> element is used for a single copyright entry. It includes the copyright years and the copyright holder. Multiple <copyright> statements are allowed.
Category: Prolog elements-->
<!ELEMENT copyright      ((%copyryear;)+,%copyrholder;)>
<!ATTLIST copyright       type (primary|secondary) #IMPLIED>
<!--doc:The <copyryear> element contains the copyright year as specified by the year attribute.
Category: Prolog elements-->
<!ELEMENT copyryear      EMPTY>
<!ATTLIST copyryear       year %date-format; #REQUIRED
                          %select-atts;
>
<!--doc:The copyright holder (<copyrholder>) element names the entity that holds legal rights to the material contained in the topic.
Category: Prolog elements-->
<!ELEMENT copyrholder    (%words.cnt;)*>

<!-- all attributes within critdates need to take ISO date format -->
<!--doc:The <critdates> element contains the critical dates in a document life cycle, such as the creation date and multiple revision dates.
Category: Prolog elements-->
<!ELEMENT critdates      (%created;,(%revised;)*)>
<!--doc:The <created> element specifies the document creation date using the date attribute.
Category: Prolog elements-->
<!ELEMENT created        EMPTY>
<!ATTLIST created         date     %date-format; #REQUIRED
                          golive   %date-format; #IMPLIED
                          expiry   %date-format; #IMPLIED
>
<!--doc:The <revised> element in the prolog is used to maintain tracking dates that are important in a topic development cycle, such as the last modification date, the original availability date, and the expiration date.
Category: Prolog elements-->
<!ELEMENT revised        EMPTY>
<!ATTLIST revised         modified %date-format; #REQUIRED
                          golive   %date-format; #IMPLIED
                          expiry   %date-format; #IMPLIED
                          %select-atts;
>
<!--doc:The <permissions> prolog element can indicate any preferred controls for access to a topic. Topics can be filtered based on the permissions element. This capability depends on your output formatting process.
Category: Prolog elements-->
<!ELEMENT permissions    EMPTY>

<!ATTLIST permissions     view (internal|classified|all|entitled) #REQUIRED
>
<!-- metadata grouping -->
<!--doc:The <category> element can represent any category by which a topic might be classified for retrieval or navigation; for example, the categories could be used to group topics in a generated navigation bar. Topics can belong to multiple categories.
Category: Prolog elements-->
<!ELEMENT category       (%words.cnt;)*>
<!ATTLIST category        %select-atts;
>
<!--doc:The <audience> metadata element indicates, through the value of its type attribute, the intended audience for a topic. Since a topic can have multiple audiences, you can include multiple audience elements. For each audience you specify, you can identify the high-level task (job) they are trying to accomplish and the level of experience (experiencelevel) expected. The audience element may be used to provide a more detailed definition of values used throughout the map or topic on the audience attribute.
Category: Prolog elements-->
<!ELEMENT audience       EMPTY>
<!ATTLIST audience        type (user|purchaser|administrator|programmer|executive|services|other) #IMPLIED
                          othertype CDATA #IMPLIED
                          job (installing|customizing|administering|programming|using|maintaining|troubleshooting|evaluating|planning|migrating|other) #IMPLIED
                          otherjob CDATA #IMPLIED
                          experiencelevel (novice|general|expert) #IMPLIED
                          name NMTOKEN #IMPLIED
                          %select-atts;
>
<!--doc:The <keywords> element contains a list of key words (using <indexterm> or <keyword> markup) that can be used by a search engine.
Category: Prolog elements-->
<!ELEMENT keywords       (%indexterm;|%keyword;)*>
<!ATTLIST keywords        %id-atts;
                          %select-atts;
>
<!--doc:The <prodinfo> metadata element in the prolog contains information about the product or products that are the subject matter of the current topic. The prodinfo element may be used to provide a more detailed definition of values used throughout the map or topic on the product attribute.
Category: Prolog elements-->
<!ELEMENT prodinfo       (%prodname;,%vrmlist;,(%brand;|%series;|%platform;|%prognum;|%featnum;|%component;)*)>
<!ATTLIST prodinfo        %select-atts;
>
<!--doc:The <prodname> metadata element contains the name of the product that is supported by the information in this topic.
Category: Prolog elements-->
<!ELEMENT prodname       (%words.cnt;)*>  <!-- applications may validate the content of these dataphrase elements -->
<!--doc:The <vrmlist> element contains a set of <vrm> elements for logging the version, release, and modification information for multiple products or versions of products to which the topic applies.
Category: Prolog elements-->
<!ELEMENT vrmlist        (%vrm;)+>
<!--doc:The vrm empty element contains information about a single product's version, modification, and release, to which the current topic applies.
Category: Prolog elements-->
<!ELEMENT vrm            EMPTY>
<!ATTLIST vrm             version CDATA #REQUIRED
                          release CDATA #IMPLIED
                          modification CDATA #IMPLIED
>
<!--doc:The <brand> element indicates the manufacturer or brand associated with the product described by the parent <prodinfo> element.
Category: Prolog elements-->
<!ELEMENT brand          (%words.cnt;)*>
<!--doc:The <series> metadata element contains information about the product series that the topic supports.
Category: Prolog elements-->
<!ELEMENT series         (%words.cnt;)*>
<!--doc:The <platform> metadata element contains a description of the operating system and/or hardware related to the product being described by the <prodinfo> element. The platform element may be used to provide a more detailed definition of values used throughout the map or topic on the platform attribute.
Category: Prolog elements-->
<!ELEMENT platform       (%words.cnt;)*>
<!--doc:The <prognum> metadata element identifies the program number of the associated program product. This is typically an order number or a product tracking code that could be replaced by an order number when a product completes development.
Category: Prolog elements-->
<!ELEMENT prognum        (%words.cnt;)*>
<!--doc:The <featnum> element contains the feature number of a product in the metadata.
Category: Prolog elements-->
<!ELEMENT featnum        (%words.cnt;)*>
<!--doc:The <component> element describes the component of the product that this topic is concerned with. For example, a product might be made up of many components, each of which is installable separately. Components might also be shared by several products so that the same component is available for installation with many products. An implementation may (but need not) use this identification to check cross-component dependencies when some components are installed, but not others. An implementation may also (but need not) use the identification make sure that topics are hidden, removed, or flagged in some way when the component they describe isn't installed.
Category: Prolog elements-->
<!ELEMENT component      (%words.cnt;)*>


<!--doc:The <othermeta> element can be used to identify properties not otherwise included in <metadata> and assign name/content values to those properties. The name attribute identifies the property and the content attribute specifies the property's value. The values in this attribute are output as HTML metadata elements, and have no defined meaning for other possible outputs such as PDF.
Category: Prolog elements-->
<!ELEMENT othermeta      EMPTY > <!-- needs to be HTML-equiv, at least -->
<!ATTLIST othermeta       name CDATA #REQUIRED
                          content CDATA #REQUIRED
                          translate-content (yes|no) #IMPLIED
                          %select-atts;
>

<!--doc:The <resourceid> element provides an identifier for applications that require them in a particular format, when the normal id attribute of the topic can't be used. Each resourceid entry should be unique. It is one of the metadata elements that can be included within the prolog of a topic, along with document tracking and product information, etc. The element has no content, but takes an id attribute and an appname attribute.
Category: Prolog elements-->
<!ELEMENT resourceid     EMPTY>
<!ATTLIST resourceid     id CDATA #REQUIRED
                         appname CDATA #IMPLIED
>

<!--doc:An <indexterm> element allows the author to indicate that a certain word or phrase should produce an index entry in the generated index.
Category: Miscellaneous elements-->
<!ELEMENT indexterm      (%words.cnt;|%indexterm;)*>   <!-- Index entry -->
<!ATTLIST indexterm       keyref NMTOKEN #IMPLIED
                          %univ-atts;
>

<!--specialization attributes-->

<!ATTLIST author %global-atts; class CDATA "- topic/author ">
<!ATTLIST source %global-atts; class CDATA "- topic/source ">
<!ATTLIST publisher %global-atts; class CDATA "- topic/publisher ">
<!ATTLIST copyright %global-atts; class CDATA "- topic/copyright ">
<!ATTLIST copyryear %global-atts; class CDATA "- topic/copyryear ">
<!ATTLIST copyrholder %global-atts; class CDATA "- topic/copyrholder ">
<!ATTLIST critdates %global-atts; class CDATA "- topic/critdates ">
<!ATTLIST created %global-atts; class CDATA "- topic/created ">
<!ATTLIST revised %global-atts; class CDATA "- topic/revised ">
<!ATTLIST permissions %global-atts; class CDATA "- topic/permissions ">
<!ATTLIST category %global-atts; class CDATA "- topic/category ">
<!ATTLIST audience %global-atts; class CDATA "- topic/audience ">
<!ATTLIST keywords %global-atts; class CDATA "- topic/keywords ">
<!ATTLIST prodinfo %global-atts; class CDATA "- topic/prodinfo ">
<!ATTLIST prodname %global-atts; class CDATA "- topic/prodname ">
<!ATTLIST vrmlist %global-atts; class CDATA "- topic/vrmlist ">
<!ATTLIST vrm %global-atts; class CDATA "- topic/vrm ">
<!ATTLIST brand %global-atts; class CDATA "- topic/brand ">
<!ATTLIST series %global-atts; class CDATA "- topic/series ">
<!ATTLIST platform %global-atts; class CDATA "- topic/platform ">
<!ATTLIST prognum %global-atts; class CDATA "- topic/prognum ">
<!ATTLIST featnum %global-atts; class CDATA "- topic/featnum ">
<!ATTLIST component %global-atts; class CDATA "- topic/component ">
<!ATTLIST othermeta %global-atts; class CDATA "- topic/othermeta ">
<!ATTLIST resourceid %global-atts; class CDATA "- topic/resourceid ">
<!ATTLIST indexterm %global-atts; class CDATA "- topic/indexterm ">
