<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Concept                                      -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Concept//EN"
      Delivered as file "concept.mod"                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for Concepts                                      -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Removed old declaration for                -->
<!--                    conceptClasses entity                      -->
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


<!ENTITY % concept-info-types "%info-types;">


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->
 

<!ENTITY % concept     "concept"                                     >
<!ENTITY % conbody     "conbody"                                     >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains ""                                         >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Concept                         -->
<!--doc:The <concept> element is the top-level element for a topic that answers the question what is? Concepts provide background information that users must know before they can successfully work with a product or interface. Often, a concept is an extended definition of a major abstraction such as a process or function. It might also have an example or a graphic, but generally the structure of a concept is fairly simple.
Category: Concept elements-->
<!ELEMENT concept       ((%title;), (%titlealts;)?,
                         (%shortdesc; | %abstract;)?, 
                         (%prolog;)?, (%conbody;)?, (%related-links;)?,
                         (%concept-info-types;)* )                   >
<!ATTLIST concept        
             id         ID                               #REQUIRED
             conref     CDATA                            #IMPLIED
             %select-atts;
             %localization-atts;
             %arch-atts;
             outputclass 
                        CDATA                            #IMPLIED
             domains    CDATA                "&included-domains;"    >


<!--                    LONG NAME: Concept Body                    -->
<!--doc:The <conbody> element is the main body-level element for a concept. Like the <body> element of a general <topic>, <conbody> allows paragraphs, lists, and other elements as well as sections and examples. But <conbody> has a constraint that a section or an example can be followed only by other sections or examples.
Category: Concept elements-->
<!ELEMENT conbody       ((%body.cnt;)*, (%section;|%example;)* )     >
<!ATTLIST conbody         
             %id-atts;
             %localization-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST concept     %global-atts;  class CDATA "- topic/topic concept/concept ">
<!ATTLIST conbody     %global-atts;  class CDATA "- topic/body  concept/conbody ">

 
<!-- ================== End DITA Concept  ======================== -->




