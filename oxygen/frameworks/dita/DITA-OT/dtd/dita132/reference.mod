<!--
 |  (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ELEMENTS DITA Reference//EN"
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
 |   1.1.3a bug fix: revised "DTDVersion" to match release version (consistency);
 |                   revised refbody attlist to match other infotype's body attlists (consistency)
 *-->

<!ENTITY DTDVersion 'V1.1.3' >



<!-- ============ Specialization of declared elements ============ -->
<!ENTITY % referenceClasses SYSTEM "reference_class.ent">
<!--%referenceClasses;-->

<!ENTITY % refbody "refbody">
<!ENTITY % refsyn "refsyn">
<!ENTITY % properties "properties">
<!ENTITY % property "property">
<!ENTITY % proptype "proptype">
<!ENTITY % propvalue "propvalue">
<!ENTITY % propdesc "propdesc">
<!ENTITY % prophead "prophead">
<!ENTITY % proptypehd "proptypehd">
<!ENTITY % propvaluehd "propvaluehd">
<!ENTITY % propdeschd "propdeschd">

<!ENTITY % reference-info-types "%info-types;">
<!ENTITY included-domains "">

<!--doc:The <reference> element defines a top-level container for a reference topic. Reference topics document programming constructs or facts about a product. Examples of reference topics include language elements, class descriptions, commands, functions, statements, protocols, types, declarators, operands, and API information, which provide quick access to facts, but no explanation of concepts or procedures. Reference topics have the same high-level structure as any other topic type, with a title, short description, and body. Within the body, reference topics are typically organized into one or more sections, property lists, and tables. The reference topic type provides general rules that apply to all kinds of reference information, using elements like <refsyn> for syntax or signatures, and <properties> for lists of properties and values.
Category: Reference elements-->
<!ELEMENT reference      (%title;, (%titlealts;)?, (%shortdesc;)?, (%prolog;)?, %refbody;, (%related-links;)?, (%reference-info-types;)* )>
<!ATTLIST reference       id ID #REQUIRED
                          conref CDATA #IMPLIED
                          %select-atts;
                          outputclass CDATA #IMPLIED
                          xml:lang NMTOKEN #IMPLIED
                          DTDVersion CDATA #FIXED "&DTDVersion;"
                          domains CDATA "&included-domains;"
>

<!--doc:The <refbody> element is a container for the main content of the reference topic. Reference topics limit the body structure to tables (both simple and standard), property lists, syntax sections, and generic sections and examples, in any sequence or number.
Category: Reference elements-->
<!ELEMENT refbody        ((%section; | %refsyn; | %example; | %table; | %simpletable; | %properties;)*)>
<!ATTLIST refbody         %id-atts;
                          translate (yes|no) #IMPLIED
                          xml:lang NMTOKEN #IMPLIED
                          outputclass CDATA #IMPLIED
>


    <!-- unique sections:  -->
<!--doc:The <refsyn> element is a special section inside a reference topic. The section often contains syntax or signature content (for example, a command-line utility's calling syntax, or an API's signature). The <refsyn> contains a brief, possibly diagrammatic description of the subject's interface or high-level structure.
Category: Reference elements-->
<!ELEMENT refsyn         (%section.cnt;)* > <!-- syntax content -->
<!ATTLIST refsyn          spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <properties> element gives a list of properties for the subject of the current topic, for example whether a class is public or protected. Each property can include the type, value, and a description. The typical rendering is usually in a table-like format. To represent multiple values for a type, just create additional property elements and use only the <propvalue> element (and <propdesc> when needed) for each successive value.
Category: Reference elements-->
<!ELEMENT properties     ((%prophead;)?, (%property;)+)>
<!ATTLIST properties      relcolwidth CDATA #IMPLIED
                          keycol NMTOKEN #IMPLIED
                          refcols NMTOKENS #IMPLIED
                          %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!--doc:The prophead element supports regular headings for the properties element.
Category: Reference elements-->
<!ELEMENT prophead       ((%proptypehd;)?, (%propvaluehd;)?, (%propdeschd;)?)>
<!ATTLIST prophead        %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The proptypehd element supports regular headings for the type column of a properties table.
Category: Reference elements-->
<!ELEMENT proptypehd     (%tblcell.cnt;)*>
<!ATTLIST proptypehd      %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The propvaluehd element supports regular headings for the value column of a properties table.
Category: Reference elements-->
<!ELEMENT propvaluehd    (%tblcell.cnt;)*>
<!ATTLIST propvaluehd     %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The propdeschd element supports regular headings for the description column of a properties table.
Category: Reference elements-->
<!ELEMENT propdeschd     (%tblcell.cnt;)*>
<!ATTLIST propdeschd      %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>


<!--doc:The <property> element represents a property of the current topic's subject. For example, if the current topic is a class, the property might show that the class is protected rather than public. It contains three optional elements: type, value, and description.
Category: Reference elements-->
<!ELEMENT property       ((%proptype;)?, (%propvalue;)?, (%propdesc;)?)>
<!ATTLIST property        %univ-atts;
                          outputclass CDATA #IMPLIED

>
<!--doc:The proptype element describes the type of property.
Category: Reference elements-->
<!ELEMENT proptype       (%ph.cnt;)*>
<!ATTLIST proptype        %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The <propvalue> element indicates the value or values for the current property type. You can put values in separate rows if they need separate descriptions, and just leave the <proptype> element blank.
Category: Reference elements-->
<!ELEMENT propvalue      (%ph.cnt;)*>
<!ATTLIST propvalue       %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The <propdesc> element is used to provide a short description of the property type and its listed values (or just the value).
Category: Reference elements-->
<!ELEMENT propdesc       (%desc.cnt;)*>
<!ATTLIST propdesc        %univ-atts;
                          specentry CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>




<!--specialization attributes-->

<!ATTLIST reference   %global-atts; class  CDATA "- topic/topic       reference/reference ">
<!ATTLIST refbody     %global-atts; class  CDATA "- topic/body        reference/refbody ">
<!ATTLIST refsyn      %global-atts; class  CDATA "- topic/section     reference/refsyn ">
<!ATTLIST properties  %global-atts; class  CDATA "- topic/simpletable reference/properties ">
<!ATTLIST property    %global-atts; class  CDATA "- topic/strow       reference/property ">
<!ATTLIST proptype    %global-atts; class  CDATA "- topic/stentry     reference/proptype ">
<!ATTLIST propvalue   %global-atts; class  CDATA "- topic/stentry     reference/propvalue ">
<!ATTLIST propdesc    %global-atts; class  CDATA "- topic/stentry     reference/propdesc ">

<!ATTLIST prophead    %global-atts; class  CDATA "- topic/sthead      reference/prophead ">
<!ATTLIST proptypehd  %global-atts; class  CDATA "- topic/stentry     reference/proptypehd ">
<!ATTLIST propvaluehd %global-atts; class  CDATA "- topic/stentry     reference/propvaluehd ">
<!ATTLIST propdeschd  %global-atts; class  CDATA "- topic/stentry     reference/propdeschd ">

