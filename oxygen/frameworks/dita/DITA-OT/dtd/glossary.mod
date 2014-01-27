<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Glossary                                     -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Glossary//EN"
      Delivered as file "glossary.mod"                             -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for Glossary topics                               -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             June 2006                                         -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2006.                    -->
<!--             All Rights Reserved.                              -->
<!--  UPDATES:                                                     -->
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


<!ENTITY % glossentry-info-types "no-topic-nesting">


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->
 

<!ENTITY % glossentry  "glossentry"                                  >
<!ENTITY % glossterm   "glossterm"                                   >
<!ENTITY % glossdef    "glossdef"                                    >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains ""                                         >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Glossary Entry                  -->
<!--doc:The <glossentry> element defines a single sense of a glossary term. The expected book processing is to sort and group the glossary entries based on the localized term so a back-of-the-book glossary can contain a collated list of terms with the definitions of the senses of the terms indented under the terms. The glossary can have a different organization in different languages depending on the translation of the terms. One possible online processing is to associate a hotspot for mentions of terms in <term> elements and display the definition on hover or click. Glossary entries for different term senses can be reused independently of one another.
Category: Glossentry elements-->
<!ELEMENT glossentry     ((%glossterm;), (%glossdef;), 
                          (%related-links;)?,
                          (%glossentry-info-types;)* )               >
<!ATTLIST glossentry        
             id         ID                               #REQUIRED
             conref     CDATA                            #IMPLIED
             %select-atts;
             %localization-atts;
             %arch-atts;
             outputclass 
                        CDATA                            #IMPLIED
             domains    CDATA                "&included-domains;"    >


<!--                    LONG NAME: Glossary Term                   -->
<!--doc:The <glossterm> element specifies the preferred term associated with a definition of a sense. If the same term has multiple senses, create a separate <glossentry> topic for each sense.
Category: Glossentry elements-->
<!ELEMENT glossterm     (%title.cnt;)*                               >
<!ATTLIST glossterm         
             %id-atts;
             %localization-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             outputclass 
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Glossary Definition             -->
<!--doc:The <glossdef> element specifies the definition of one sense of a term. If a term has multiple senses, create a separate <glossentry> topic to define each sense.
Category: Glossentry elements-->
<!ELEMENT glossdef      (%section.notitle.cnt; | %shortdesc;)*       >
<!ATTLIST glossdef         
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST glossentry  %global-atts;  class CDATA "- topic/topic concept/concept glossentry/glossentry ">
<!ATTLIST glossterm   %global-atts;  class CDATA "- topic/title concept/title glossentry/glossterm ">
<!ATTLIST glossdef    %global-atts;  class CDATA "- topic/abstract concept/abstract glossentry/glossdef ">

 
<!-- ================== End DITA Glossary ======================== -->




