<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Utilities Domain                             -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Utilities Domain//EN"
      Delivered as file "utilitiesDomain.mod"                      -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the DITA Utilities Domain          -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Updated these comments to match template   -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
<!--    2006.06.14 RDA: Move univ-atts-translate-no into topic.mod -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->

<!ENTITY % imagemap    "imagemap"                                    >
<!ENTITY % area        "area"                                        >
<!ENTITY % shape       "shape"                                       >
<!ENTITY % coords      "coords"                                      >


<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->


<!--                    Provide an alternative univ-atts that sets 
                        translate to default 'no'                  -->
<!-- Now uses the definition from topic.mod                        -->
<!--<!ENTITY % univ-atts-translate-no
            '%id-atts;
             %select-atts;
             translate  (yes | no | 
                         -dita-use-conref-target)        "no"
             xml:lang   NMTOKEN                          #IMPLIED
             dir       (ltr | rtl | lro | rlo | 
                        -dita-use-conref-target)         #IMPLIED'   >-->


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS for IMAGEMAP          -->
<!-- ============================================================= -->


<!--                    LONG NAME: Imagemap                        -->
<!--doc:The imagemap element supports the basic functionality of the HTML client-side image map markup. Imagemap allows you to designate a linkable area or region over an image, allowing a link in that region to display another topic.
Category: Utilities elements-->
<!ELEMENT imagemap      ((%image;), (%area;)+)                       >           
<!ATTLIST imagemap        
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Hoptspot Area Description       -->
<!--doc:The area element supports the basic functionality of the HTML image map markup.
Category: Utilities elements-->
<!ELEMENT area          ((%shape;), (%coords;), (%xref;))            >
<!ATTLIST area         
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Shape of the Hotspot            -->
<!--doc:The shape element defines the shape of a linkable area in an imagemap.
Category: Utilities elements-->
<!ELEMENT shape         (#PCDATA)                                    >
<!ATTLIST shape           
             keyref     CDATA                            #IMPLIED
             %univ-atts-translate-no;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Coordinates of the Hotspot      -->
<!--doc:The coords element specifies the coordinates of the linkable region in an imagemap area.
Category: Utilities elements-->
<!ELEMENT coords        (%words.cnt;)*                               >
<!ATTLIST coords          
             keyref     CDATA                            #IMPLIED
             %univ-atts-translate-no;
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->


<!ATTLIST imagemap %global-atts;  class CDATA "+ topic/fig ut-d/imagemap " >
<!ATTLIST area     %global-atts;  class CDATA "+ topic/figgroup ut-d/area ">
<!ATTLIST shape    %global-atts;  class CDATA "+ topic/keyword ut-d/shape ">
<!ATTLIST coords   %global-atts;  class CDATA "+ topic/ph ut-d/coords "    >

 
<!-- ================== End Utilities Domain ====================== -->
