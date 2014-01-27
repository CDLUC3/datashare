<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA DITA Programming Domain                      -->
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
PUBLIC "-//OASIS//ELEMENTS DITA Programming Domain//EN"
      Delivered as file "programmingDomain.mod"                    -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Declaring the elements and specialization         -->
<!--             attributes for the Programming Domain             -->
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
<!--    2005.11.15 RDA: Corrected Long Names for syntax groups,    -->
<!--                    codeph, and kwd                            -->
<!--    2005.11.15 RDA: Corrected the "Delivered as" system ID     -->
<!--    2006.06.07 RDA: Make universal attributes universal        -->
<!--                      (DITA 1.1 proposal #12)                  -->
<!--    2006.11.30 RDA: Add -dita-use-conref-target to enumerated  -->
<!--                      attributes                               -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->


<!ENTITY % apiname      "apiname"                                    >
<!ENTITY % codeblock    "codeblock"                                  >
<!ENTITY % codeph       "codeph"                                     >
<!ENTITY % delim        "delim"                                      >
<!ENTITY % kwd          "kwd"                                        >
<!ENTITY % oper         "oper"                                       >
<!ENTITY % option       "option"                                     >
<!ENTITY % parmname     "parmname"                                   >
<!ENTITY % sep          "sep"                                        >
<!ENTITY % synph        "synph"                                      >
<!ENTITY % var          "var"                                        >

<!ENTITY % parml        "parml"                                      >
<!ENTITY % pd           "pd"                                         >
<!ENTITY % plentry      "plentry"                                    >
<!ENTITY % pt           "pt"                                         >

<!ENTITY % fragment     "fragment"                                   >
<!ENTITY % fragref      "fragref"                                    >
<!ENTITY % groupchoice  "groupchoice"                                >
<!ENTITY % groupcomp    "groupcomp"                                  >
<!ENTITY % groupseq     "groupseq"                                   >
<!ENTITY % repsep       "repsep"                                     >
<!ENTITY % synblk       "synblk"                                     >
<!ENTITY % synnote      "synnote"                                    >
<!ENTITY % synnoteref   "synnoteref"                                 >
<!ENTITY % syntaxdiagram 
                        "syntaxdiagram"                              >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Universal Attributes Local
                                   Importance                      -->
<!--                    Povide an alternative set of univ-atts that 
                        allows importance to be redefined locally  -->
<!ENTITY % univ-atts-no-importance
            '%id-atts;
             %filter-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             rev        CDATA                            #IMPLIED
             status     (new | changed | deleted |
                         unchanged | 
                         -dita-use-conref-target)        #IMPLIED
             %localization-atts;                                 '   > 


<!--                    LONG NAME: Code Phrase                     -->
<!--doc:The code phrase (<codeph>) element represents a snippet of code within the main flow of text. The code phrase is displayed in a monospaced font for emphasis. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT codeph        (#PCDATA | %basic.ph.notm; | 
                         %data.elements.incl; | 
                         %foreign.unknown.incl;)*                    >
<!ATTLIST codeph      
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Code Block                      -->
<!--doc:The <codeblock> element represents lines of program code. Like the <pre> element, content of this element has preserved line endings and is output in a monospaced font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT codeblock     (#PCDATA | %basic.ph.notm; | %txt.incl; |
                         %data.elements.incl; | 
                         %foreign.unknown.incl;)*                    >
<!ATTLIST codeblock       
             %display-atts;
             spectitle  CDATA                            #IMPLIED
             xml:space  (preserve)                #FIXED 'preserve'
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Option                          -->
<!--doc:The <option> element describes an option that can be used to modify a command (or something else, like a configuration). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT option        (#PCDATA)                                    >
<!ATTLIST  option       keyref CDATA #IMPLIED
                        %univ-atts;
                        outputclass CDATA #IMPLIED                   >


<!--                    LONG NAME: Variable                        -->
<!--doc:Within a syntax diagram, the <var> element defines a variable for which the user must supply content, such as their user name or password. It is represented in output in an italic font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT var           (%words.cnt;)*                               >
<!ATTLIST var         
             importance (optional | required | default | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter Name                  -->
<!--doc:When referencing the name of an application programming interface parameter within the text flow of your topic, use the parameter name (<parmname>) element to markup the parameter. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT parmname      (#PCDATA)                                    >
<!ATTLIST parmname
             keyref      CDATA #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Phrase                   -->
<!--doc:The syntax phrase (<synph>) element is a container for syntax definition elements. It is used when a complete syntax diagram is not needed, but some of the syntax elements, such as kwd, oper, delim, are used within the text flow of the topic content. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synph         (#PCDATA | %codeph; | %option; | %parmname; |
                         %var; | %kwd; | %oper; | %delim; | %sep; | 
                         %synph;)*                                   >
<!ATTLIST  synph   
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Operator                        -->
<!--doc:The operator (<oper>) element defines an operator within a syntax definition. Typical operators are equals (=), plus (+) or multiply (*). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT oper          (%words.cnt;)*                               >
<!ATTLIST oper            
             importance (optional | required | default | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Delimiter                       -->
<!--doc:Within a syntax diagram, the delimiter (<delim>) element defines a character marking the beginning or end of a section or part of the complete syntax. Typical delimiter characters are the parenthesis, comma, tab, vertical bar or other special characters. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT delim         (%words.cnt;)*                               >
<!ATTLIST delim           
             importance (optional | required | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;
             outputclass
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Separator                       -->
<!--doc:The separator (<sep>) element defines a separator character that is inline with the content of a syntax diagram. The separator occurs between keywords, operators or groups in a syntax definition. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT sep           (%words.cnt;)*                               >
<!ATTLIST sep             
             importance (optional | required | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: API Name                        -->
<!--doc:The <apiname> element provides the name of an application programming interface (API) such as a Java class name or method name. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT apiname       (#PCDATA)                                    >
<!ATTLIST apiname         
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter List                  -->
<!--doc:The parameter list (<parml>) element contains a list of terms and definitions that describes the parameters in an application programming interface. This is a special kind of definition list that is designed for documenting programming parameters. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT parml         (%plentry;)+                                 >
<!ATTLIST parml           
             compact    (yes | no |
                         -dita-use-conref-target)        #IMPLIED
             spectitle  CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter List Entry            -->
<!--doc:The parameter list entry element (<plentry>) contains one or more parameter terms and definitions (pd and pt). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT plentry       ((%pt;)+, (%pd;)+)                           >
<!ATTLIST plentry       
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter Term                  -->
<!--doc:A parameter term, within a parameter list entry, is enclosed by the <pt> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT pt            (%term.cnt;)*                                > 
<!ATTLIST pt           
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Parameter Description           -->
<!--doc:A parameter definition, within a parameter list entry, is enclosed by the <pd> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT pd            (%defn.cnt;)*                                >
<!ATTLIST pd             
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Diagram                  -->
<!--doc:The syntax diagram (<syntaxdiagram>) element is the main container for all the syntax elements that make up a syntax definition. The syntax diagram represents the syntax of a statement from a computer language, or a command, function call or programming language statement. Traditionally, the syntax diagram is formatted with railroad tracks that connect the units of the syntax together, but this presentation may differ depending on the output media. The syntax diagram element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT syntaxdiagram ((%title;)?,
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref; | %fragment; | %synblk; |
                          %synnote; | %synnoteref;)* )               >
<!ATTLIST syntaxdiagram   
             %display-atts;
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Block                    -->
<!--doc:The syntax block (<synblk>) element organizes small pieces of a syntax definition into a larger piece. The syntax block element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synblk        ((%title;)?, 
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref; | %fragment;| %synnote; |
                          %synnoteref;)* )                           >
<!ATTLIST synblk
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Sequence Group                  -->
<!--doc:The <groupseq> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. Within the syntax definition, groups of keywords, delimiters and other syntax units act as a combined unit, and they occur in a specific sequence, as delimited by the <groupseq> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupseq      ((%title;)?, (%repsep;)?,
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref; | %kwd; | %var; | %delim; | 
                          %oper; | %sep; | %synnote; | 
                          %synnoteref;)* )                           >
<!ATTLIST groupseq        
             importance (optional | required | default |
                         -dita-use-conref-target)    
                                                         #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Choice Group                    -->
<!--doc:The <groupchoice> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. A group choice specifies that the user must make a choice about which part of the syntax to use. Groups are often nested. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupchoice   ((%title;)?, (%repsep;)?,
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref;| %kwd; | %var; | %delim; |
                          %oper; | %sep; | %synnote; | 
                          %synnoteref;)* )                           > 
<!ATTLIST  groupchoice     
             importance (optional | required | default | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Composite group                 -->
<!--doc:The <groupcomp> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. The group composite means that the items that make up the syntax diagram will be formatted close together rather than being separated by a horizontal or vertical line, which is the usual formatting method. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupcomp     ((%title;)?, (%repsep;)?,
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref; | %kwd; | %var; | %delim; |
                          %oper; | %sep; | %synnote; | 
                          %synnoteref;)* )                           > 
<!ATTLIST  groupcomp       
             importance (optional | required | default | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Fragment                        -->
<!--doc:Within a syntax definition, a <fragment> is a labeled subpart of the syntax. The <fragment> element allows breaking out logical chunks of a large syntax diagram into named fragments. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT fragment      ((%title;)?, 
                         (%groupseq; | %groupchoice; | %groupcomp; |
                          %fragref; | %synnote; | %synnoteref;)* )   >
<!ATTLIST fragment        
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >
  


<!--                    LONG NAME: Fragment Reference              -->
<!--doc:The fragment reference (<fragref>) element provides a logical reference to a syntax definition fragment so that you can reference a syntax fragment multiple times, or pull a large section of syntax out of line for easier reading. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT fragref       (%xrefph.cnt;)*><!--xref-->
<!ATTLIST fragref         
             href       CDATA                            #IMPLIED
             importance (optional | required | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Diagram Note             -->
<!--doc:The syntax note (<synnote>) element contains a note (similar to a footnote) within a syntax definition group or fragment. The syntax note explains aspects of the syntax that cannot be expressed in the markup itself. The note will appear at the bottom of the syntax diagram instead of at the bottom of the page. The syntax block element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synnote       (#PCDATA | %basic.ph;)*                      >     
<!ATTLIST synnote        
             callout    CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Note Reference           -->
<!--doc:The syntax note (<synnoteref>) reference element references a syntax note element (<synnote>) that has already been defined elsewhere in the syntax diagram. The same notation can be used in more than one syntax definition. The syntax note reference element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synnoteref     EMPTY >
<!ATTLIST synnoteref      
             href       CDATA                            #IMPLIED
             %univ-atts;                                  
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Repeat Separator                -->
<!--doc:The repeat separator (<repsep>) element in a syntax diagram defines a group of syntax elements that can (or should) be repeated. If the <repsep> element contains a separator character, such as a plus (+), this indicates that the character must be used between repetitions of the syntax elements. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT repsep         (%words.cnt;)*                              >
<!ATTLIST repsep          
            importance  (optional | required | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!--                    LONG NAME: Syntax Keyword                  -->
<!--doc:The <kwd> element defines a keyword within a syntax diagram. A keyword must be typed or output, either by the user or application, exactly as specified in the syntax definition. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT kwd           (#PCDATA)                                    >
<!ATTLIST kwd             
             keyref     CDATA                            #IMPLIED
             importance (optional | required | default | 
                         -dita-use-conref-target)        #IMPLIED
             %univ-atts-no-importance;                             
             outputclass 
                        CDATA                            #IMPLIED    >


<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->
             

<!ATTLIST  apiname    %global-atts; class CDATA "+ topic/keyword pr-d/apiname "  >
<!ATTLIST  codeblock  %global-atts; class CDATA "+ topic/pre pr-d/codeblock "    >
<!ATTLIST  codeph     %global-atts; class CDATA "+ topic/ph pr-d/codeph "        >
<!ATTLIST  delim      %global-atts; class CDATA "+ topic/ph pr-d/delim "         >
<!ATTLIST  fragment   %global-atts; class CDATA "+ topic/figgroup pr-d/fragment ">
<!ATTLIST  fragref    %global-atts; class CDATA "+ topic/xref pr-d/fragref "     >
<!ATTLIST  groupchoice 
                      %global-atts; class CDATA "+ topic/figgroup pr-d/groupchoice ">
<!ATTLIST  groupcomp  %global-atts; class CDATA "+ topic/figgroup pr-d/groupcomp ">
<!ATTLIST  groupseq   %global-atts; class CDATA "+ topic/figgroup pr-d/groupseq ">
<!ATTLIST  kwd        %global-atts; class CDATA "+ topic/keyword pr-d/kwd "      >
<!ATTLIST  oper       %global-atts; class CDATA "+ topic/ph pr-d/oper "          >
<!ATTLIST  option     %global-atts; class CDATA "+ topic/keyword pr-d/option "   >
<!ATTLIST  parml      %global-atts; class CDATA "+ topic/dl pr-d/parml "         >
<!ATTLIST  parmname   %global-atts; class CDATA "+ topic/keyword pr-d/parmname " >
<!ATTLIST  pd         %global-atts; class CDATA "+ topic/dd pr-d/pd "            >
<!ATTLIST  plentry    %global-atts; class CDATA "+ topic/dlentry pr-d/plentry "  >
<!ATTLIST  pt         %global-atts; class CDATA "+ topic/dt pr-d/pt "            >
<!ATTLIST  repsep     %global-atts; class CDATA "+ topic/ph pr-d/repsep "        >
<!ATTLIST  sep        %global-atts; class CDATA "+ topic/ph pr-d/sep "           >
<!ATTLIST  synblk     %global-atts; class CDATA "+ topic/figgroup pr-d/synblk "  >
<!ATTLIST  synnote    %global-atts; class CDATA "+ topic/fn pr-d/synnote "       >
<!ATTLIST  synnoteref %global-atts; class CDATA "+ topic/xref pr-d/synnoteref "  >
<!ATTLIST  synph      %global-atts; class CDATA "+ topic/ph pr-d/synph "         >
<!ATTLIST  syntaxdiagram 
                      %global-atts; class CDATA "+ topic/fig pr-d/syntaxdiagram ">
<!ATTLIST  var        %global-atts; class CDATA "+ topic/ph pr-d/var "           >


<!-- ================== End Programming Domain  ====================== -->
