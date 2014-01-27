<!--
 |  (C) Copyright IBM Corporation 2001, 2005. All Rights Reserved.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ELEMENTS DITA Programming Domain//EN"
 |
 | Release history (vrm):
 |   1.0.0 Initial release on developerWorks, March 2001 (dita00.zip)
 |   1.0.1 fix 1 on developerWorks, October 2001 (dita01.zip)
 |   1.0.2 consolidated redesign December 2001
 |   1.0.3 fix 1, dtd freeze for UCD-1 January 2002
 |   1.1.0 Release 1 March 2002
 |   1.1.1 Release 1.1 December 2002
 |   1.1.2 Release 1.2 June 2003
 |   1.1.3 Release 1.3 March 2004: bug fixes and map updates
 |   1.1.3a bug fixes: converted words.cnt back to PCDATA for option, parmname, apiname, kwd
 |                     (elements derived from keyword must have content models in kind)
 *-->

<!ENTITY % codeph "codeph">
<!ENTITY % codeblock "codeblock">
<!ENTITY % option "option">
<!ENTITY % kwd "kwd">
<!ENTITY % var "var">
<!ENTITY % parmname "parmname">
<!ENTITY % synph "synph">
<!ENTITY % oper "oper">
<!ENTITY % delim "delim">
<!ENTITY % sep "sep">
<!ENTITY % apiname "apiname">

<!ENTITY % parml "parml">
<!ENTITY % plentry "plentry">
<!ENTITY % pt "pt">
<!ENTITY % pd "pd">

<!ENTITY % syntaxdiagram "syntaxdiagram">
<!ENTITY % synblk "synblk">
<!ENTITY % groupseq "groupseq">
<!ENTITY % groupchoice "groupchoice">
<!ENTITY % groupcomp "groupcomp">
<!ENTITY % fragment "fragment">
<!ENTITY % fragref "fragref">
<!ENTITY % synnote "synnote">
<!ENTITY % synnoteref "synnoteref">
<!ENTITY % repsep "repsep">


<!-- provide an alternative set of univ-atts that allows importance to be redefined locally-->
<!ENTITY % univ-atts-no-importance
                         '%id-atts;
                          platform CDATA #IMPLIED
                          product CDATA #IMPLIED
                          audience CDATA #IMPLIED
                          otherprops CDATA #IMPLIED
                          rev CDATA #IMPLIED
                          status (new|changed|deleted|unchanged) #IMPLIED
                          translate (yes|no) #IMPLIED
                          xml:lang NMTOKEN #IMPLIED'
>



<!--doc:The code phrase (<codeph>) element represents a snippet of code within the main flow of text. The code phrase is displayed in a monospaced font for emphasis. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT codeph         (#PCDATA | %basic.ph.notm;)* >
<!ATTLIST codeph          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The <codeblock> element represents lines of program code. Like the <pre> element, content of this element has preserved line endings and is output in a monospaced font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT codeblock      (#PCDATA | %basic.ph.notm; | %txt.incl;)* >
<!ATTLIST codeblock       %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          xml:space (preserve) #FIXED 'preserve'
>
<!--doc:The <option> element describes an option that can be used to modify a command (or something else, like a configuration). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT option         (#PCDATA)>
<!ATTLIST option          keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:Within a syntax diagram, the <var> element defines a variable for which the user must supply content, such as their user name or password. It is represented in output in an italic font. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT var            (%words.cnt;)*>
<!ATTLIST var             importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>
<!--doc:When referencing the name of an application programming interface parameter within the text flow of your topic, use the parameter name (<parmname>) element to markup the parameter. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT parmname       (#PCDATA)>
<!ATTLIST parmname        keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The syntax phrase (<synph>) element is a container for syntax definition elements. It is used when a complete syntax diagram is not needed, but some of the syntax elements, such as kwd, oper, delim, are used within the text flow of the topic content. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synph          (#PCDATA | %codeph; | %option; | %parmname; |
                          %var; | %kwd; | %oper; | %delim; | %sep; | %synph;)* >
<!-- userinput | cmdname |-->
<!ATTLIST synph           %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:The operator (<oper>) element defines an operator within a syntax definition. Typical operators are equals (=), plus (+) or multiply (*). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT oper           (%words.cnt;)*>
<!ATTLIST oper            importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>
<!--doc:Within a syntax diagram, the delimiter (<delim>) element defines a character marking the beginning or end of a section or part of the complete syntax. Typical delimiter characters are the parenthesis, comma, tab, vertical bar or other special characters. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT delim          (%words.cnt;)*>
<!ATTLIST delim           importance           (optional | required)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>
<!--doc:The separator (<sep>) element defines a separator character that is inline with the content of a syntax diagram. The separator occurs between keywords, operators or groups in a syntax definition. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT sep            (%words.cnt;)*>
<!ATTLIST sep             importance           (optional | required)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>
<!--doc:The <apiname> element provides the name of an application programming interface (API) such as a Java class name or method name. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT apiname        (#PCDATA)>
<!ATTLIST apiname         keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!-- parameter list -->
<!--doc:The parameter list (<parml>) element contains a list of terms and definitions that describes the parameters in an application programming interface. This is a special kind of definition list that is designed for documenting programming parameters. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT parml          (%plentry;)+ >
<!ATTLIST parml           compact (yes|no) #IMPLIED
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>
<!--doc:The parameter list entry element (<plentry>) contains one or more parameter terms and definitions (pd and pt). This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT plentry        ((%pt;)+,(%pd;)+) >
<!ATTLIST plentry         %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:A parameter term, within a parameter list entry, is enclosed by the <pt> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT pt             (%term.cnt;)*> <!--#PCDATA | %basic.ph; | %image;-->
<!ATTLIST pt              keyref NMTOKEN #IMPLIED

                          %univ-atts;
                          outputclass CDATA #IMPLIED
>
<!--doc:A parameter definition, within a parameter list entry, is enclosed by the <pd> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT pd             (%defn.cnt;)* >        <!-- description -->
<!ATTLIST pd              %univ-atts;
                          outputclass CDATA #IMPLIED
>


<!-- Base form: Syntax Diagram -->
<!--doc:The syntax diagram (<syntaxdiagram>) element is the main container for all the syntax elements that make up a syntax definition. The syntax diagram represents the syntax of a statement from a computer language, or a command, function call or programming language statement. Traditionally, the syntax diagram is formatted with railroad tracks that connect the units of the syntax together, but this presentation may differ depending on the output media. The syntax diagram element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT syntaxdiagram  ((%title;)?,(%groupseq;|%groupchoice;|%groupcomp;|%fragref;|%fragment;|%synblk;|%synnote;|%synnoteref;)*)><!--fig-->
<!ATTLIST syntaxdiagram   %display-atts;
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The syntax block (<synblk>) element organizes small pieces of a syntax definition into a larger piece. The syntax block element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synblk         ((%title;)?,(%groupseq;|%groupchoice;|%groupcomp;|%fragref;|%fragment;|
                          %synnote;|%synnoteref;)*)><!--figgroup-->
<!ATTLIST synblk          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <groupseq> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. Within the syntax definition, groups of keywords, delimiters and other syntax units act as a combined unit, and they occur in a specific sequence, as delimited by the <groupseq> element. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupseq       ((%title;)?,(%repsep;)?,(%groupseq;|%groupchoice;|%groupcomp;|%fragref;|
                          %kwd;|%var;|%delim;|%oper;|%sep;|%synnote;|%synnoteref;)*)><!--figgroup-->
<!ATTLIST groupseq        importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <groupchoice> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. A group choice specifies that the user must make a choice about which part of the syntax to use. Groups are often nested. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupchoice    ((%title;)?,(%repsep;)?,(%groupseq;|%groupchoice;|%groupcomp;|%fragref;|
                          %kwd;|%var;|%delim;|%oper;|%sep;|%synnote;|%synnoteref;)*)><!--figgroup-->
<!ATTLIST groupchoice     importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <groupcomp> element is part of the subset of elements that define syntax diagrams in DITA. A group is a logical set of pieces of syntax that go together. The group composite means that the items that make up the syntax diagram will be formatted close together rather than being separated by a horizontal or vertical line, which is the usual formatting method. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT groupcomp      ((%title;)?,(%repsep;)?,(%groupseq;|%groupchoice;|%groupcomp;|%fragref;|
                          %kwd;|%var;|%delim;|%oper;|%sep;|%synnote;|%synnoteref;)*)><!--figgroup-->
<!ATTLIST groupcomp       importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>

<!--doc:Within a syntax definition, a <fragment> is a labeled subpart of the syntax. The <fragment> element allows breaking out logical chunks of a large syntax diagram into named fragments. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT fragment       ((%title;)?, (%groupseq;|%groupchoice;|%groupcomp;|%fragref;|%synnote;|%synnoteref;)*) ><!--figgroup-->
<!ATTLIST fragment        %univ-atts;
                          outputclass CDATA #IMPLIED

>

<!--doc:The fragment reference (<fragref>) element provides a logical reference to a syntax definition fragment so that you can reference a syntax fragment multiple times, or pull a large section of syntax out of line for easier reading. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT fragref        (%xrefph.cnt;)*><!--xref-->
<!ATTLIST fragref         href CDATA #IMPLIED
                          importance           (optional | required)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>

<!--doc:The syntax note (<synnote>) element contains a note (similar to a footnote) within a syntax definition group or fragment. The syntax note explains aspects of the syntax that cannot be expressed in the markup itself. The note will appear at the bottom of the syntax diagram instead of at the bottom of the page. The syntax block element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synnote        (#PCDATA|%basic.ph;)* ><!--fn-->
<!ATTLIST synnote         callout CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED

>

<!--doc:The syntax note (<synnoteref>) reference element references a syntax note element (<synnote>) that has already been defined elsewhere in the syntax diagram. The same notation can be used in more than one syntax definition. The syntax note reference element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT synnoteref     EMPTY ><!--xref-->
<!ATTLIST synnoteref      href CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED

>

<!--doc:The repeat separator (<repsep>) element in a syntax diagram defines a group of syntax elements that can (or should) be repeated. If the <repsep> element contains a separator character, such as a plus (+), this indicates that the character must be used between repetitions of the syntax elements. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT repsep         (%words.cnt;)*><!--ph-->
<!ATTLIST repsep          importance           (optional | required)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>

<!--doc:The <kwd> element defines a keyword within a syntax diagram. A keyword must be typed or output, either by the user or application, exactly as specified in the syntax definition. This element is part of the DITA programming domain, a special set of DITA elements designed to document programming tasks, concepts and reference information.
Category: Programming elements-->
<!ELEMENT kwd            (#PCDATA)>
<!ATTLIST kwd             keyref NMTOKEN #IMPLIED
                          importance           (optional | required | default)  #IMPLIED
                          %univ-atts-no-importance;
                          outputclass CDATA #IMPLIED
>



<!ATTLIST codeph         %global-atts; class CDATA "+ topic/ph pr-d/codeph ">
<!ATTLIST codeblock      %global-atts; class CDATA "+ topic/pre pr-d/codeblock ">
<!ATTLIST option         %global-atts; class CDATA "+ topic/keyword pr-d/option ">
<!ATTLIST var            %global-atts; class CDATA "+ topic/ph pr-d/var ">
<!ATTLIST parmname       %global-atts; class CDATA "+ topic/keyword pr-d/parmname ">
<!ATTLIST synph          %global-atts; class CDATA "+ topic/ph pr-d/synph ">
<!ATTLIST oper           %global-atts; class CDATA "+ topic/ph pr-d/oper ">
<!ATTLIST delim          %global-atts; class CDATA "+ topic/ph pr-d/delim ">
<!ATTLIST sep            %global-atts; class CDATA "+ topic/ph pr-d/sep ">
<!ATTLIST apiname        %global-atts; class CDATA "+ topic/keyword pr-d/apiname ">

<!ATTLIST parml          %global-atts; class CDATA "+ topic/dl pr-d/parml ">
<!ATTLIST plentry        %global-atts; class CDATA "+ topic/dlentry pr-d/plentry ">
<!ATTLIST pt             %global-atts; class CDATA "+ topic/dt pr-d/pt ">
<!ATTLIST pd             %global-atts; class CDATA "+ topic/dd pr-d/pd ">

<!ATTLIST syntaxdiagram  %global-atts; class CDATA "+ topic/fig pr-d/syntaxdiagram ">
<!ATTLIST synblk         %global-atts; class CDATA "+ topic/figgroup pr-d/synblk ">
<!ATTLIST groupseq       %global-atts; class CDATA "+ topic/figgroup pr-d/groupseq ">
<!ATTLIST groupchoice    %global-atts; class CDATA "+ topic/figgroup pr-d/groupchoice ">
<!ATTLIST groupcomp      %global-atts; class CDATA "+ topic/figgroup pr-d/groupcomp ">
<!ATTLIST fragment       %global-atts; class CDATA "+ topic/figgroup pr-d/fragment ">
<!ATTLIST fragref        %global-atts; class CDATA "+ topic/xref pr-d/fragref ">
<!ATTLIST synnote        %global-atts; class CDATA "+ topic/fn pr-d/synnote ">
<!ATTLIST synnoteref     %global-atts; class CDATA "+ topic/xref pr-d/synnoteref ">
<!ATTLIST repsep         %global-atts; class CDATA "+ topic/ph pr-d/repsep ">
<!ATTLIST kwd            %global-atts; class CDATA "+ topic/keyword pr-d/kwd ">
