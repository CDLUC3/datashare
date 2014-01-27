<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Highlight Domain                             -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Highlight Domain//EN"
      Delivered as file "highlightDomain.mod"                      -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization attributes     -->
<!--             for Highlight Domain                              -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Corrected descriptive names for all        -->
<!--                    elements except bold                       -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % b           "b"                                           >
<!ENTITY % i           "i"                                           >
<!ENTITY % u           "u"                                           >     
<!ENTITY % tt          "tt"                                          >
<!ENTITY % sup         "sup"                                         >
<!ENTITY % sub         "sub"                                         >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Bold                            -->
<!--doc:The bold (<b>) element is used to apply bold highlighting to the content of the element. Use this element only when there is not some other more proper element. For example, for specific items such as GUI controls, use the <uicontrol> element. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT b             (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST b              
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Underlined                      -->
<!--doc:The underline (<u>) element is used to apply underline highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT u             (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST u              
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Italic                          -->
<!--doc:The italic (<i>) element is used to apply italic highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT i             (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST i             
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Teletype (monospaced)           -->
<!--doc:The teletype (<tt>) element is used to apply monospaced highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT tt            (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST tt            
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Superscript                     -->
<!--doc:The superscript (<sup>) element indicates that text should be superscripted, or vertically raised in relationship to the surrounding text. Superscripts are usually a smaller font than the surrounding text. Use this element only when there is not some other more proper tag. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT sup           (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST sup          
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Subscript                       -->
<!--doc:A subscript (<sub>) indicates that text should be subscripted, or placed lower in relationship to the surrounding text. Subscripted text is often a smaller font than the surrounding text. Formatting may vary depending on your output process. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT sub           (#PCDATA | %basic.ph; | %data.elements.incl; |
                         %foreign.unknown.incl;)*                    >
<!ATTLIST sub           
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST b           %global-atts;  class CDATA "+ topic/ph hi-d/b "  >
<!ATTLIST i           %global-atts;  class CDATA "+ topic/ph hi-d/i "  >
<!ATTLIST sub         %global-atts;  class CDATA "+ topic/ph hi-d/sub ">
<!ATTLIST sup         %global-atts;  class CDATA "+ topic/ph hi-d/sup ">
<!ATTLIST tt          %global-atts;  class CDATA "+ topic/ph hi-d/tt " >
<!ATTLIST u           %global-atts;  class CDATA "+ topic/ph hi-d/u "  >


<!-- ================== DITA Highlight Domain ==================== -->
