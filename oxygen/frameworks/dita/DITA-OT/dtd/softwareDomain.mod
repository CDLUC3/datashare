<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Software Domain                              -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Software Domain//EN"
      Delivered as file "softwareDomain.mod"                       -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the Software Domain                -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2001                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2001, 2004.         -->
<!--             All Rights Reserved.                              -->
<!--                                                               -->
<!--  UPDATES:                                                     -->
<!--    2005.11.15 RDA: Corrected the PURPOSE in this comment      -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->


<!ENTITY % msgph       "msgph"                                       >
<!ENTITY % msgblock    "msgblock"                                    >
<!ENTITY % msgnum      "msgnum"                                      >
<!ENTITY % cmdname     "cmdname"                                     >
<!ENTITY % varname     "varname"                                     >
<!ENTITY % filepath    "filepath"                                    >
<!ENTITY % userinput   "userinput"                                   >
<!ENTITY % systemoutput 
                       "systemoutput"                                >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Message Phrase                  -->
<!--doc:The message phrase (<msgph>) element contains the text content of a message produced by an application or program. It can also contain the variable name (varname) element to illustrate where variable text content can occur in the message. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT msgph         (%words.cnt;)*                               >
<!ATTLIST msgph          
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Message Block                   -->
<!--doc:The message block (<msgblock>) element contains a multi-line message or set of messages. The message block can contain multiple message numbers and message descriptions, each enclosed in a <msgnum> and <msgph> element. It can also contain the message content directly. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT msgblock      (%words.cnt;)*                               >
<!ATTLIST msgblock        
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    
             xml:space  (preserve)                #FIXED "preserve"  >


<!--                    LONG NAME: Message Number                  -->
<!--doc:The message number (<msgnum>) element contains the number of a message produced by an application or program. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT msgnum         (#PCDATA)                                   >
<!ATTLIST msgnum          
             keyref      CDATA                           #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Command Name                    -->
<!--doc:The command name (<cmdname>) element specifies the name of a command when it is part of a software discussion. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT cmdname       (#PCDATA)                                    >
<!ATTLIST cmdname       
             keyref      CDATA                           #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Variable Name                   -->
<!--doc:The variable name (<varname>) element defines a variable that must be supplied to a software application. The variable name element is very similar to the variable (var) element, but variable name is used outside of syntax diagrams. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT varname       (#PCDATA)                                    >
<!ATTLIST varname         
             keyref      CDATA                           #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: File Path                       -->
<!--doc:The <filepath> element indicates the name and optionally the location of a referenced file by specifying the directory containing the file, and other directories that may precede it in the system hierarchy. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT filepath      (%words.cnt;)*                               >
<!ATTLIST filepath       
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: User Input                      -->
<!--doc:The user input (<userinput>) element represens the text a user should input in response to a program or system prompt. This element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT userinput     (%words.cnt;)*                               >
<!ATTLIST userinput      
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: System Output                   -->
<!--doc:The system output (<systemoutput>) element represents computer output or responses to a command or situation. A generalized element, it represents any kind of output from the computer, so the author may wish to choose more specific markup, such as msgph, for messages from the application. The system output element is part of the DITA software domain, a special set of DITA elements designed to document software tasks, concepts and reference information.
Category: Software elements-->
<!ELEMENT systemoutput  (%words.cnt;)*                               >
<!ATTLIST systemoutput   
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >
             

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->
             

<!ATTLIST cmdname     %global-atts;  class CDATA "+ topic/keyword sw-d/cmdname ">
<!ATTLIST filepath    %global-atts;  class CDATA "+ topic/ph sw-d/filepath "    >
<!ATTLIST msgblock    %global-atts;  class CDATA "+ topic/pre sw-d/msgblock "   >
<!ATTLIST msgnum      %global-atts;  class CDATA "+ topic/keyword sw-d/msgnum " >
<!ATTLIST msgph       %global-atts;  class CDATA "+ topic/ph sw-d/msgph "       >
<!ATTLIST systemoutput
                      %global-atts;  class CDATA "+ topic/ph sw-d/systemoutput ">
<!ATTLIST userinput   %global-atts;  class CDATA "+ topic/ph sw-d/userinput "   >
<!ATTLIST varname     %global-atts;  class CDATA "+ topic/keyword sw-d/varname ">

 
<!-- ================== End Software Domain ====================== -->
