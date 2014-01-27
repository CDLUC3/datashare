<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Reference                                    -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Reference//EN"
      Delivered as file "reference.mod"                            -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for Reference                          -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Removed old declaration for                -->
<!--                    referenceClasses entity                    -->
<!--    2005.11.15 RDA: Corrected LONG NAME for propdeschd         -->
<!--    2006.06.07 RDA: Added <abstract> element                   -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
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
<!--                   SPECIALIZATION OF DECLARED ELEMENTS         -->
<!-- ============================================================= -->


<!ENTITY % reference-info-types 
                      "%info-types;"                                 >


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % reference   "reference"                                   >
<!ENTITY % refbody     "refbody"                                     >
<!ENTITY % refsyn      "refsyn"                                      >
<!ENTITY % properties  "properties"                                  >
<!ENTITY % property    "property"                                    >
<!ENTITY % proptype    "proptype"                                    >
<!ENTITY % propvalue   "propvalue"                                   >
<!ENTITY % propdesc    "propdesc"                                    >
<!ENTITY % prophead    "prophead"                                    >
<!ENTITY % proptypehd  "proptypehd"                                  >
<!ENTITY % propvaluehd "propvaluehd"                                 >
<!ENTITY % propdeschd  "propdeschd"                                  >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains ""                                         >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Reference                       -->
<!--doc:The <reference> element defines a top-level container for a reference topic. Reference topics document programming constructs or facts about a product. Examples of reference topics include language elements, class descriptions, commands, functions, statements, protocols, types, declarators, operands, and API information, which provide quick access to facts, but no explanation of concepts or procedures. Reference topics have the same high-level structure as any other topic type, with a title, short description, and body. Within the body, reference topics are typically organized into one or more sections, property lists, and tables. The reference topic type provides general rules that apply to all kinds of reference information, using elements like <refsyn> for syntax or signatures, and <properties> for lists of properties and values.
Category: Reference elements-->
<!ELEMENT reference     ((%title;), (%titlealts;)?,
                         (%shortdesc; | %abstract;)?, 
                         (%prolog;)?, (%refbody;)?, (%related-links;)?, 
                         (%reference-info-types;)* )                 >
<!ATTLIST reference
             id         ID                               #REQUIRED
             conref     CDATA                            #IMPLIED
             %select-atts;
             %localization-atts;
             %arch-atts;
             domains    CDATA                  "&included-domains;"
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Reference Body                  -->
<!--doc:The <refbody> element is a container for the main content of the reference topic. Reference topics limit the body structure to tables (both simple and standard), property lists, syntax sections, and generic sections and examples, in any sequence or number.
Category: Reference elements-->
<!ELEMENT refbody       ((%section; | %refsyn; | %example; | %table; | 
                          %simpletable; |  %properties; | 
                          %data.elements.incl; | 
                          %foreign.unknown.incl;)* )                 >
<!ATTLIST refbody         
             %id-atts;
             %localization-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Reference Syntax                -->
<!--doc:The <refsyn> element is a special section inside a reference topic. The section often contains syntax or signature content (for example, a command-line utility's calling syntax, or an API's signature). The <refsyn> contains a brief, possibly diagrammatic description of the subject's interface or high-level structure.
Category: Reference elements-->
<!ELEMENT refsyn        (%section.cnt;)*                             >  
<!ATTLIST refsyn          
             spectitle  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Properties                      -->
<!--doc:The <properties> element gives a list of properties for the subject of the current topic, for example whether a class is public or protected. Each property can include the type, value, and a description. The typical rendering is usually in a table-like format. To represent multiple values for a type, just create additional property elements and use only the <propvalue> element (and <propdesc> when needed) for each successive value.
Category: Reference elements-->
<!ELEMENT properties    ((%prophead;)?, (%property;)+)               >
<!ATTLIST properties      
             relcolwidth 
                        CDATA                           #IMPLIED
             keycol     NMTOKEN                         #IMPLIED
             refcols    NMTOKENS                        #IMPLIED
             spectitle  CDATA                           #IMPLIED
             %display-atts;
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME:  Property Head                  -->
<!--doc:The prophead element supports regular headings for the properties element.
Category: Reference elements-->
<!ELEMENT prophead      ((%proptypehd;)?, (%propvaluehd;)?, 
                         (%propdeschd;)?)                            >
<!ATTLIST prophead       
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Property Type Head              -->
<!--doc:The proptypehd element supports regular headings for the type column of a properties table.
Category: Reference elements-->
<!ELEMENT proptypehd    (%tblcell.cnt;)*                             >
<!ATTLIST proptypehd     
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property Value Head             -->
<!--doc:The propvaluehd element supports regular headings for the value column of a properties table.
Category: Reference elements-->
<!ELEMENT propvaluehd   (%tblcell.cnt;)*                             >
<!ATTLIST propvaluehd     
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property Description Head       -->
<!--doc:The propdeschd element supports regular headings for the description column of a properties table.
Category: Reference elements-->
<!ELEMENT propdeschd    (%tblcell.cnt;)*                             >
<!ATTLIST propdeschd    
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property                        -->
<!--doc:The <property> element represents a property of the current topic's subject. For example, if the current topic is a class, the property might show that the class is protected rather than public. It contains three optional elements: type, value, and description.
Category: Reference elements-->
<!ELEMENT property      ((%proptype;)?, (%propvalue;)?, 
                         (%propdesc;)?)                              >
<!ATTLIST property       
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property Type                   -->
<!--doc:The proptype element describes the type of property.
Category: Reference elements-->
<!ELEMENT proptype      (%ph.cnt;)*                                  >
<!ATTLIST proptype       
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property Value                  -->
<!--doc:The <propvalue> element indicates the value or values for the current property type. You can put values in separate rows if they need separate descriptions, and just leave the <proptype> element blank.
Category: Reference elements-->
<!ELEMENT propvalue     (%ph.cnt;)*                                  >
<!ATTLIST propvalue      
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Property Descrption             -->
<!--doc:The <propdesc> element is used to provide a short description of the property type and its listed values (or just the value).
Category: Reference elements-->
<!ELEMENT propdesc      (%desc.cnt;)*                                >
<!ATTLIST propdesc        
             specentry  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >

             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST reference   %global-atts;  class  CDATA "- topic/topic       reference/reference " >
<!ATTLIST refbody     %global-atts;  class  CDATA "- topic/body        reference/refbody "   >
<!ATTLIST refsyn      %global-atts;  class  CDATA "- topic/section     reference/refsyn "    >
<!ATTLIST properties  %global-atts;  class  CDATA "- topic/simpletable reference/properties ">
<!ATTLIST property    %global-atts;  class  CDATA "- topic/strow       reference/property "  >
<!ATTLIST proptype    %global-atts;  class  CDATA "- topic/stentry     reference/proptype "  >
<!ATTLIST propvalue   %global-atts;  class  CDATA "- topic/stentry     reference/propvalue " >
<!ATTLIST propdesc    %global-atts;  class  CDATA "- topic/stentry     reference/propdesc "  >

<!ATTLIST prophead    %global-atts;  class  CDATA "- topic/sthead      reference/prophead "  >
<!ATTLIST proptypehd  %global-atts;  class  CDATA "- topic/stentry     reference/proptypehd ">
<!ATTLIST propvaluehd %global-atts;  class  CDATA "- topic/stentry     reference/propvaluehd ">
<!ATTLIST propdeschd  %global-atts;  class  CDATA "- topic/stentry     reference/propdeschd ">

 
<!-- ================== End DITA Reference  =========================== -->

