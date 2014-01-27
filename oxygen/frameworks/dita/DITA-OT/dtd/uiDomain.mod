<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA User Interface Domain                        -->
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
PUBLIC "-//OASIS//ELEMENTS DITA User Interface Domain//EN"
      Delivered as file "uiDomain.mod"                             -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the User Interface Domain          -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Corrected LONG NAME for screen             -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

  
<!ENTITY % uicontrol   "uicontrol"                                   >
<!ENTITY % wintitle    "wintitle"                                    >
<!ENTITY % menucascade "menucascade"                                 >
<!ENTITY % shortcut    "shortcut"                                    >
<!ENTITY % screen      "screen"                                      >


<!-- ============================================================= -->
<!--                    UI KEYWORD TYPES ELEMENT DECLARATIONS      -->
<!-- ============================================================= -->


<!--                    LONG NAME: User Interface Control          -->
<!--doc:The user interface control (<uicontrol>) element is used to mark up names of buttons, entry fields, menu items, or other objects that allow the user to control the interface. Use the <uicontrol> element inside a <menucascade> element to identify a sequence of menu choices in a nested menu, such as File New. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.
Category: User interface elements-->
<!ELEMENT uicontrol     (%words.cnt; | %image; | %shortcut;)*        >
<!ATTLIST uicontrol       
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Window Title                    -->
<!--doc:The window title <wintitle> element can be used to mark up names of windows or dialogs, or other user interface elements at the same level of grouping, including wizard titles, wizard page titles, and window pane titles. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.
Category: User interface elements-->
<!ELEMENT wintitle      (#PCDATA)                                    >
<!ATTLIST wintitle        
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >



<!--                    LONG NAME: Menu Cascade                    -->
<!--doc:The <menucascade> element is used to document a series of menu choices. The <menucascade> element contains one or more user interface control (<uicontrol>) elements, for example: Start > Programs > Accessories > Notepad. If there is more than one <uicontrol> element, the formatter shows connecting characters between the menu items to represent the menu cascade. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.
Category: User interface elements-->
<!ELEMENT menucascade   (%uicontrol;)+                               >
<!ATTLIST menucascade     
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Short Cut                       -->
<!--doc:The <shortcut> element identifies a keyboard shortcut for a menu or window action. This element is part of the DITA user interface domain, a special set of DITA elements designed to document user interface tasks, concepts and reference information.
Category: User interface elements-->
<!ELEMENT shortcut      (#PCDATA)                                    >
<!ATTLIST shortcut        
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Text Screen Capture             -->
<!--doc:The <screen> element contains or refers to a textual representation of a computer screen or user interface panel (window).
Category: User interface elements-->
<!ELEMENT screen        (#PCDATA | %basic.ph.notm; | %txt.incl; |
                         %data.elements.incl; | 
                         %foreign.unknown.incl;)*                    >
<!ATTLIST screen          
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             xml:space  (preserve)               #FIXED 'preserve'
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->
             

<!ATTLIST menucascade %global-atts;  class CDATA "+ topic/ph ui-d/menucascade "  >
<!ATTLIST screen      %global-atts;  class CDATA "+ topic/pre ui-d/screen "      >
<!ATTLIST shortcut    %global-atts;  class CDATA "+ topic/keyword ui-d/shortcut ">
<!ATTLIST uicontrol   %global-atts;  class CDATA "+ topic/ph ui-d/uicontrol "    >
<!ATTLIST wintitle    %global-atts;  class CDATA "+ topic/keyword ui-d/wintitle ">

 
<!-- ================== End DITA User Interface Domain =========== -->
