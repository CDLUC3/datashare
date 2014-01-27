<!--  
 |  (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ELEMENTS DITA Highlight Domain//EN"
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
 *-->

<!ENTITY % b "b">
<!ENTITY % i "i">
<!ENTITY % u "u">
<!ENTITY % tt "tt">
<!ENTITY % sup "sup">
<!ENTITY % sub "sub">


<!-- Base form: Single Effect Formatting Phrases -->
<!--doc:The bold (<b>) element is used to apply bold highlighting to the content of the element. Use this element only when there is not some other more proper element. For example, for specific items such as GUI controls, use the <uicontrol> element. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT b              (#PCDATA | %basic.ph;)* >
<!ATTLIST b               %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The underline (<u>) element is used to apply underline highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT u              (#PCDATA | %basic.ph;)* >
<!ATTLIST u               %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The italic (<i>) element is used to apply italic highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT i              (#PCDATA | %basic.ph;)* >
<!ATTLIST i               %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The teletype (<tt>) element is used to apply monospaced highlighting to the content of the element.
Category: Typographic elements-->
<!ELEMENT tt             (#PCDATA | %basic.ph;)* >
<!ATTLIST tt              %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The superscript (<sup>) element indicates that text should be superscripted, or vertically raised in relationship to the surrounding text. Superscripts are usually a smaller font than the surrounding text. Use this element only when there is not some other more proper tag. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT sup            (#PCDATA | %basic.ph;)* >
<!ATTLIST sup             %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:A subscript (<sub>) indicates that text should be subscripted, or placed lower in relationship to the surrounding text. Subscripted text is often a smaller font than the surrounding text. Formatting may vary depending on your output process. This element is part of the DITA highlighting domain.
Category: Typographic elements-->
<!ELEMENT sub            (#PCDATA | %basic.ph;)* >
<!ATTLIST sub             %univ-atts;
                          outputclass CDATA #IMPLIED
>


<!ATTLIST b           %global-atts; class CDATA "+ topic/ph hi-d/b ">
<!ATTLIST u           %global-atts; class CDATA "+ topic/ph hi-d/u ">
<!ATTLIST i           %global-atts; class CDATA "+ topic/ph hi-d/i ">
<!ATTLIST tt          %global-atts; class CDATA "+ topic/ph hi-d/tt ">
<!ATTLIST sup         %global-atts; class CDATA "+ topic/ph hi-d/sup ">
<!ATTLIST sub         %global-atts; class CDATA "+ topic/ph hi-d/sub ">
