<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    DITA Bookmap                                      -->
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
PUBLIC "-//OASIS//ELEMENTS DITA BookMap//EN" 
      Delivered as file "bookmap.mod"                              -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributes    -->
<!--             for Book Maps                                     -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             March 2004                                        -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2005, 2006.              -->
<!--             (C) Copyright IBM Corporation 2004, 2005.         -->
<!--             All Rights Reserved.                              -->
<!--  UPDATES:                                                     -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                   ELEMENT NAME ENTITIES                       -->
<!-- ============================================================= -->
                               
<!ENTITY % bookmap         "bookmap"                                 >

<!ENTITY % abbrevlist      "abbrevlist"                              >
<!ENTITY % bookabstract    "bookabstract"                            >
<!ENTITY % amendments      "amendments"                              >
<!ENTITY % appendix        "appendix"                                >
<!ENTITY % approved        "approved"                                >
<!ENTITY % backmatter      "backmatter"                              >
<!ENTITY % bibliolist      "bibliolist"                              >
<!ENTITY % bookchangehistory "bookchangehistory"                     >
<!ENTITY % bookevent       "bookevent"                               >
<!ENTITY % bookeventtype   "bookeventtype"                           >
<!ENTITY % bookid          "bookid"                                  >
<!ENTITY % booklibrary     "booklibrary"                             >
<!ENTITY % booklist        "booklist"                                >
<!ENTITY % booklists       "booklists"                               >
<!ENTITY % bookmeta        "bookmeta"                                >
<!ENTITY % booknumber      "booknumber"                              >
<!ENTITY % bookowner       "bookowner"                               >
<!ENTITY % bookpartno      "bookpartno"                              >
<!ENTITY % bookrestriction "bookrestriction"                         >
<!ENTITY % bookrights      "bookrights"                              >
<!ENTITY % booktitle       "booktitle"                               >
<!ENTITY % booktitlealt    "booktitlealt"                            >
<!ENTITY % chapter         "chapter"                                 >
<!ENTITY % colophon        "colophon"                                >
<!ENTITY % completed       "completed"                               >
<!ENTITY % copyrfirst      "copyrfirst"                              >
<!ENTITY % copyrlast       "copyrlast"                               >
<!ENTITY % day             "day"                                     >
<!ENTITY % dedication      "dedication"                              >
<!ENTITY % draftintro      "draftintro"                              >
<!ENTITY % edited          "edited"                                  >
<!ENTITY % edition         "edition"                                 >
<!ENTITY % figurelist      "figurelist"                              >
<!ENTITY % frontmatter     "frontmatter"                             >
<!ENTITY % glossarylist    "glossarylist"                            >
<!ENTITY % indexlist       "indexlist"                               >
<!ENTITY % isbn            "isbn"                                    >
<!ENTITY % mainbooktitle   "mainbooktitle"                           >
<!ENTITY % maintainer      "maintainer"                              >
<!ENTITY % month           "month"                                   >
<!ENTITY % notices         "notices"                                 >
<!ENTITY % organization    "organization"                            >
<!ENTITY % part            "part"                                    >
<!ENTITY % person          "person"                                  >
<!ENTITY % preface         "preface"                                 >
<!ENTITY % printlocation   "printlocation"                           >
<!ENTITY % published       "published"                               >
<!ENTITY % publisherinformation "publisherinformation"               >
<!ENTITY % publishtype     "publishtype"                             >
<!ENTITY % reviewed        "reviewed"                                >
<!ENTITY % revisionid      "revisionid"                              >
<!ENTITY % started         "started"                                 >
<!ENTITY % summary         "summary"                                 >
<!ENTITY % tablelist       "tablelist"                               >
<!ENTITY % tested          "tested"                                  >
<!ENTITY % trademarklist   "trademarklist"                           >
<!ENTITY % toc             "toc"                                     >
<!ENTITY % volume          "volume"                                  >
<!ENTITY % year            "year"                                    >


<!-- ============================================================= -->
<!--                    DOMAINS ATTRIBUTE OVERRIDE                 -->
<!-- ============================================================= -->


<!ENTITY included-domains ""                                         >

<!-- ============================================================= -->
<!--                    COMMON ATTLIST SETS                        -->
<!-- ============================================================= -->

<!-- Currently: same as topicref, minus @query -->
<!ENTITY % chapter-atts 
            'navtitle   CDATA                             #IMPLIED
             href       CDATA                             #IMPLIED
             keyref     CDATA                             #IMPLIED
             copy-to    CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;'                                            >


<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->


<!--                    LONG NAME: Book Map                        -->
<!--doc:The <bookmap> element is a map file used to organize DITA content into a traditional book format.
Category: Bookmap elements-->
<!ELEMENT bookmap       (((%title;) | (%booktitle;))?,
                         (%bookmeta;)?, 
                         (%frontmatter;)?,
                         (%chapter;)*, (%part;)*, (%appendix;)*,
                         (%backmatter;)?,
                         (%reltable;)*)                              >
<!ATTLIST bookmap
             id         ID                                #IMPLIED
             conref     CDATA                             #IMPLIED
             anchorref  CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %localization-atts;
             %arch-atts;
             domains    CDATA                  "&included-domains;" 
             %topicref-atts;
             %select-atts;                                           >
             

<!--                    LONG NAME: Book Metadata                   -->
<!--doc:The <bookmeta> element contains information about the book that is not considered book content, such as copyright information, author information, and any classifications.
Category: Bookmap elements-->
<!ELEMENT  bookmeta    ((%linktext;)?, (%searchtitle;)?, 
                         (%shortdesc;)?, (%author;)*, (%source;)?, 
                         (%publisherinformation;)*,
                         (%critdates;)?, (%permissions;)?, 
                         (%audience;)*, (%category;)*, 
                         (%keywords;)*, (%prodinfo;)*, (%othermeta;)*, 
                         (%resourceid;)*, (%bookid;)?,
                         (%bookchangehistory;)*,
                         (%bookrights;)*,
                         (%data;)*)                                  >
<!ATTLIST  bookmeta
             lockmeta   (yes | no | -dita-use-conref-target)
                                                          #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Front Matter                    -->
<!--doc:The <frontmatter> element contains the material that precedes the main body of a document. It may include items such as an abstract, a preface, and various types of book lists such as a <toc>, <tablelist>, or <figurelist>.
Category: Bookmap elements-->
<!ELEMENT  frontmatter  (%booklists; | %notices; | %dedication; | 
                         %colophon; | %bookabstract; | %draftintro; | 
                         %preface; | %topicref;)*                    >
<!ATTLIST  frontmatter
             keyref     CDATA                             #IMPLIED
             query      CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;                                             >

<!--                    LONG NAME: Back Matter                     -->
<!--doc:The <backmatter> element contains the material that follows the main body of a document and any appendixes. It may include items such as a colophon, legal notices, and various types of book lists such as a glossary or an index.
Category: Bookmap elements-->
<!ELEMENT  backmatter   (%booklists; | %notices; | %dedication; | 
                         %colophon; | %amendments; | %topicref;)*    >
<!ATTLIST  backmatter
             keyref     CDATA                             #IMPLIED
             query      CDATA                             #IMPLIED
             outputclass 
                        CDATA                             #IMPLIED
             %topicref-atts;
             %univ-atts;                                             >

<!--                    LONG NAME: Publisher Information           -->
<!--doc:The <publisherinformation> contains information about what group or person published the book, where it was published, and certain details about its publication history. Other publication history information is found in the <bookchangehistory> element.
Category: Bookmap elements-->
<!ELEMENT publisherinformation   
                        (((%person;) | (%organization;))*, 
                         (%printlocation;)*, (%published;)*, 
                         (%data;)*)                                  >
<!ATTLIST publisherinformation
             href       CDATA                            #IMPLIED
             keyref     CDATA                            #IMPLIED
             %univ-atts;                                             >

<!--                    LONG NAME: Person                          -->
<!--doc:The <person> element contains information about the name of a person. Note that unlike the <personname> element, the <person> element is not restricted to describing the names of authors.
Category: Bookmap elements-->
<!ELEMENT person        (%words.cnt;)*                               >
<!ATTLIST person
             %data-element-atts;                                     >

<!--                    LONG NAME: Organization                    -->
<!--doc:The <organization> element contains the name of an organization. Note that unlike <organizationname>, the <organization> element is not restricted to usage within <authorinformation>; it does not have to contain the name of an authoring organization.
Category: Bookmap elements-->
<!ELEMENT organization  (%words.cnt;)*                               >
<!ATTLIST organization
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Change History             -->
<!--doc:The <bookchangehistory> element contains information about the history of the book's creation and publishing lifecycle, who wrote, reviewed, edited, and tested the book, and when these events took place.
Category: Bookmap elements-->
<!ELEMENT bookchangehistory
                        ((%reviewed;)*, (%edited;)*, (%tested;)*, 
                         (%approved;)*, (%bookevent;)*)              >
<!ATTLIST bookchangehistory
             %data-element-atts;                                     >

<!--                    LONG NAME: Book ID                         -->
<!--doc:The <bookid> element contains the publisher's identification information for the book, such as part number, edition number and ISBN number.
Category: Bookmap elements-->
<!ELEMENT bookid        ((%bookpartno;)*, (%edition;)?, (%isbn;)?, 
                         (%booknumber;)?, (%volume;)*, 
                         (%maintainer;)?)                            >
<!ATTLIST bookid
             %data-element-atts;                                     >

<!--                    LONG NAME: Summary                         -->
<!--doc:The <summary> element contains a text summary associated with a book event (such as <approved> or <reviewed>) or with the list of copyrights for the book.
Category: Bookmap elements-->
<!ELEMENT summary       (%words.cnt;)*                               >
<!ATTLIST summary
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Print Location                  -->
<!--doc:The <printlocation> element indicates the location where the book was printed. Customarily, the content is restricted to the name of the country.
Category: Bookmap elements-->
<!ELEMENT printlocation (%words.cnt;)*                               >
<!ATTLIST printlocation
             %data-element-atts;                                     >

<!--                    LONG NAME: Published                       -->
<!--doc:The <published> element contains information about the person or organization publishing the book, the dates when it was started and completed, and any special restrictions associated with it.
Category: Bookmap elements-->
<!ELEMENT published     (((%person;) | (%organization;))*,
                         (%publishtype;)?, (%revisionid;)?,
                         (%started;)?, (%completed;)?, (%summary;)?, 
                         (%data;)*)                                  >
<!ATTLIST published
             %data-element-atts;                                     >

<!--                    LONG NAME: Publish Type                    -->
<!--doc:The <publishtype> element indicates whether the book is generally available or is restricted in some way. The value attribute indicates the restrictions.
Category: Bookmap elements-->
<!ELEMENT publishtype   EMPTY                                        >
<!ATTLIST publishtype
             %univ-atts;
             name       CDATA                            #IMPLIED
             datatype   CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)        #IMPLIED
             outputclass
                        CDATA                            #IMPLIED
             value      (beta | limited | general  | 
                         -dita-use-conref-target)        #REQUIRED   >
             
<!--                    LONG NAME: Revision ID                     -->
<!--doc:The <revisionid> element indicates the revision number or revision ID of the book. The processing implementation determines how the level is displayed. Common methods include using a dash, for example "-01". or a period, such as ".01".
Category: Bookmap elements-->
<!ELEMENT revisionid    (#PCDATA)*>
<!ATTLIST revisionid
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Start Date                      -->
<!--doc:The <started> element indicates a start date for some type of book event, such as a review, editing, or testing.
Category: Bookmap elements-->
<!ELEMENT started       ( ((%year;), ((%month;), (%day;)?)?) | 
                          ((%month;), (%day;)?, (%year;)) | 
                          ((%day;), (%month;), (%year;)))            >
<!ATTLIST started         
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Completion Date                 -->
<!--doc:The <completed> element indicates a completion date for some type of book event, such as a review, editing, or testing.
Category: Bookmap elements-->
<!ELEMENT completed     ( ((%year;), ((%month;), (%day;)?)?) | 
                          ((%month;), (%day;)?, (%year;)) | 
                          ((%day;), (%month;), (%year;)))            >
<!ATTLIST completed       
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Year                            -->
<!--doc:The <year> element denotes a year.
Category: Bookmap elements-->
<!ELEMENT year          (#PCDATA)*                                   >
<!ATTLIST year
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Month                           -->
<!--doc:The <month> element denotes a month of the year.
Category: Bookmap elements-->
<!ELEMENT month         (#PCDATA)*                                   >
<!ATTLIST month
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Day                             -->
<!--doc:The <day> element denotes a day of the month.
Category: Bookmap elements-->
<!ELEMENT day           (#PCDATA)*                                   >
<!ATTLIST day
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Reviewed                        -->
<!--doc:The <reviewed> element contains information about when and by whom the book was reviewed during its publication history.
Category: Bookmap elements-->
<!ELEMENT reviewed      (((%person;) | (%organization;))*, 
                         (%revisionid;)?, (%started;)?, 
                         (%completed;)?, (%summary;)?, (%data;)*)    >
<!ATTLIST reviewed
             %data-element-atts;                                     >

<!--                    LONG NAME: Editeded                        -->
<!--doc:The <edited> element contains information about when and by whom the book was edited during its publication history.
Category: Bookmap elements-->
<!ELEMENT edited        (((%person;) | (%organization;))*, 
                         (%revisionid;)?, (%started;)?, 
                         (%completed;)?, (%summary;)?, (%data;)*)    >
<!ATTLIST edited
             %data-element-atts;                                     >

<!--                    LONG NAME: Tested                          -->
<!--doc:The <tested> element contains information about when and by whom the book was tested during its publication history.
Category: Bookmap elements-->
<!ELEMENT tested        (((%person;) | (%organization;))*, 
                         (%revisionid;)?, (%started;)?,
                         (%completed;)?, (%summary;)?, (%data;)*)    >
<!ATTLIST tested
             %data-element-atts;                                     >

<!--                    LONG NAME: Approved                        -->
<!--doc:The <approved> element contains information about when and by whom the book was approved during its publication history.
Category: Bookmap elements-->
<!ELEMENT approved      (((%person;) | (%organization;))*,
                         (%revisionid;)?, (%started;)?, 
                         (%completed;)?, (%summary;)?, (%data;)*)    >
<!ATTLIST approved
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Event                      -->
<!--doc:The <bookevent> element indicates a general event in the publication history of a book. This is an appropriate element for specialization if the current set of specific book event types, that is, review, edit, test or approval, does not meed your needs.
Category: Bookmap elements-->
<!ELEMENT bookevent     ((%bookeventtype;)?, 
                         ((%person;) | (%organization;))*,
                         (%revisionid;)?, (%started;)?, 
                         (%completed;)?, (%summary;)?, (%data;)*)    >
<!ATTLIST bookevent 
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Event Type                 -->
<!--doc:The <bookeventtype> element indicates the specific nature of a <bookevent>, such as updated, indexed, or deprecated. The required name attribute indicates the event's type.
Category: Bookmap elements-->
<!ELEMENT bookeventtype EMPTY                                        >
<!-- Attributes are the same as on <data> except that @name is required -->
<!ATTLIST bookeventtype 
             %univ-atts;
             datatype   CDATA                            #IMPLIED
             value      CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             scope      (local | peer | external | 
                         -dita-use-conref-target)        #IMPLIED
             outputclass
                        CDATA                            #IMPLIED
             name       CDATA                            #REQUIRED   >

<!--                    LONG NAME: Book Part Number                -->
<!--doc:The <bookpartno> element contains the book's part number; such as 99F1234. This is generally the number that the publisher uses to identify the book for tracking purposes.
Category: Bookmap elements-->
<!ELEMENT bookpartno    (%words.cnt;)*                               >
<!ATTLIST bookpartno
             %data-element-atts;                                     >

<!--                    LONG NAME: Edition                         -->
<!--doc:The <edition> element contains the edition number information, such as First Edition, or Third Edition, used by a publisher to identify a book.
Category: Bookmap elements-->
<!ELEMENT edition       (#PCDATA)*                                   >
<!ATTLIST edition
             %data-element-atts;                                     >

<!--                    LONG NAME: ISBN Number                     -->
<!--doc:The <isbn> element contains the book's International Standard Book Number (ISBN).
Category: Bookmap elements-->
<!ELEMENT isbn          (#PCDATA)*                                   >
<!ATTLIST isbn    
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Number                     -->
<!--doc:The <booknumber> element contains the book's form number, such as SC21-1920.
Category: Bookmap elements-->
<!ELEMENT booknumber    (%words.cnt;)*                               >
<!ATTLIST booknumber   
             %data-element-atts;                                     >

<!--                    LONG NAME: Volume                          -->
<!--doc:The <volume> element contains the book's volume number, such as Volume 2.
Category: Bookmap elements-->
<!ELEMENT volume        (#PCDATA)*                                   >
<!ATTLIST volume
             %data-element-atts;                                     >

<!--                    LONG NAME: Maintainer                      -->
<!--doc:The <maintainer> element contains information about who maiintains the document; this can be an organization or a person.
Category: Bookmap elements-->
<!ELEMENT maintainer    (((%person;) | (%organization;))*, (%data;)*)>
<!ATTLIST maintainer
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Rights                     -->
<!--doc:The <bookrights> element contains the information about the legal rights associated with the book, including copyright dates and owners.
Category: Bookmap elements-->
<!ELEMENT bookrights    ((%copyrfirst;)?, (%copyrlast;)?,
                         (%bookowner;), (%bookrestriction;)?, 
                         (%summary;)?)                               >
<!ATTLIST bookrights
             %data-element-atts;                                     >

<!--                    LONG NAME: First Copyright                 -->
<!--doc:The <copyfirst> element contains the first copyright year within a multiyear copyright statement.
Category: Bookmap elements-->
<!ELEMENT copyrfirst    (%year;)                                     >
<!ATTLIST copyrfirst
             %data-element-atts;                                     >
                        
<!--                    LONG NAME: Last Copyright                  -->
<!--doc:The <copylast> element contains the last copyright year within a multiyear copyright statement.
Category: Bookmap elements-->
<!ELEMENT copyrlast     (%year;)                                     >
<!ATTLIST copyrlast
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Owner                      -->
<!--doc:The <bookowner> element contains the owner of the copyright.
Category: Bookmap elements-->
<!ELEMENT bookowner     ((%person;) | (%organization;))*             >
<!ATTLIST bookowner 
             %data-element-atts;                                     >

<!--                    LONG NAME: Book Restriction                -->
<!--doc:The <bookrestriction> element indicates whether the book is classified, or restricted in some way. The value attribute indicates the restrictions; this may be a string like "All Rights Reserved," representing the publisher's copyright restrictions.
Category: Bookmap elements-->
<!ELEMENT bookrestriction   EMPTY                                        >
<!-- Same attributes as data, except for @value -->
<!ATTLIST bookrestriction
             %univ-atts;
             name       CDATA                            #IMPLIED
             datatype   CDATA                            #IMPLIED
             href       CDATA                            #IMPLIED
             format     CDATA                            #IMPLIED
             type       CDATA                            #IMPLIED
             scope      (local | peer | external |
                         -dita-use-conref-target)        #IMPLIED
             outputclass
                        CDATA                            #IMPLIED
             value      (confidential | restricted |
                         licensed | unclassified | 
                         -dita-use-conref-target)        #REQUIRED>

<!--                    LONG NAME: Book Title                      -->
<!--doc:The <booktitle> element contains the title information for a book. , including <booklibrary> data, a <maintitle> and subtitle (<titlealt>) as required.
Category: Bookmap elements-->
<!ELEMENT booktitle     ((%booklibrary;)?,(%mainbooktitle;),
                         (%booktitlealt;)*)                          >
<!ATTLIST booktitle
             %id-atts;
             %localization-atts;
             base       CDATA                            #IMPLIED
             %base-attribute-extensions;
             outputclass
                        CDATA                            #IMPLIED    >

<!-- The following three elements are specialized from <ph>. They are
     titles, which have a more limited content model than phrases. The
     content model here matches title.cnt; that entity is not reused
     in case it is expanded in the future to include something not
     allowed in a phrase.                                          -->
<!--                    LONG NAME: Library Title                   -->
<!--doc:The <booklibrary> element contains the library information for a book. Library entries contain information about the series, library, or collection of documents to which the book belongs.
Category: Bookmap elements-->
<!ELEMENT booklibrary   (#PCDATA | %basic.ph.noxref; | %image;)*     >  
<!ATTLIST booklibrary              
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >
                        
<!--                    LONG NAME: Main Book Title                 -->
<!--doc:The <mainbooktitle> element contains the primary title information for a book.
Category: Bookmap elements-->
<!ELEMENT mainbooktitle (#PCDATA | %basic.ph.noxref; | %image;)*     >
<!ATTLIST mainbooktitle              
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                           #IMPLIED     >
                        
<!--                    LONG NAME: Alternate Book Title            -->
<!--doc:The <booktitlealt> element contains the alternative title, subtitle, or short title for a book.
Category: Bookmap elements-->
<!ELEMENT booktitlealt  (#PCDATA | %basic.ph.noxref; | %image;)*     >
<!ATTLIST booktitlealt              
             keyref     CDATA                           #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                           #IMPLIED     >

<!--                    LONG NAME: Draft Introduction              -->
<!--doc:The <draftintro> element references a topic used as an introduction to the draft of this book.
Category: Bookmap elements-->
<!ELEMENT draftintro    ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST draftintro
             %chapter-atts;                                          >

<!--                    LONG NAME: Book Abstract                   -->
<!--doc:The <bookabstract> element references a topic used within a bookmap as a brief summary of book content, generally output as part of the book's front matter. It is used to help the reader quickly evaluate the book's purpose
Category: Bookmap elements-->
<!ELEMENT bookabstract  EMPTY                                        >
<!ATTLIST bookabstract
             %chapter-atts;                                          >

<!--                    LONG NAME: Dedication                      -->
<!--doc:The <dedication> element references a topic containing a dedication for the book, such as to a person or group.
Category: Bookmap elements-->
<!ELEMENT dedication    EMPTY                                        >
<!ATTLIST dedication
             %chapter-atts;                                          >

<!--                    LONG NAME: Preface                         -->
<!--doc:The <preface> element references introductory information about a book, such as the purpose and structure of the document.
Category: Bookmap elements-->
<!ELEMENT preface       ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST preface
             %chapter-atts;                                          >

<!--                    LONG NAME: Chapter                         -->
<!--doc:The <chapter> element references a topic as a chapter within a book.
Category: Bookmap elements-->
<!ELEMENT chapter       ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST chapter
             %chapter-atts;                                          >

<!--                    LONG NAME: Part                            -->
<!--doc:The <part> element references a part topic for the book. A new part is started. Use <part> to divide a document's chapters into logical groupings. For example, in a document that contains both guide and reference information, you can define two parts, one containing the guide information and the other containing the reference information.
Category: Bookmap elements-->
<!ELEMENT part          ((%topicmeta;)?,
                         ((%topicref;) | (%chapter;))* )             >
<!ATTLIST part
             %chapter-atts;                                          >

<!--                    LONG NAME: Appendix                        -->
<!--doc:The <appendix> element references a topic as a appendix within a book.
Category: Bookmap elements-->
<!ELEMENT appendix      ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST appendix
             %chapter-atts;                                          >

<!--                    LONG NAME: Notices                         -->
<!--doc:The <notices> element references special notice information, for example, legal notices about supplementary copyrights and trademarks associated with the book. .
Category: Bookmap elements-->
<!ELEMENT notices       ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST notices
             %chapter-atts;                                          >

<!--                    LONG NAME: Amendments                      -->
<!--doc:The <amendments> element references a list of amendments or updates to the book. It indicates to the processing software that the author wants an amendments list generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT amendments    EMPTY                                        >
<!ATTLIST amendments
             %chapter-atts;                                          >

<!--                    LONG NAME: Colophon                        -->
<!--doc:The <colophon> element references a topic describing how this document was created. In publishing, a colophon describes details of the production of a book. This information generally includes the typefaces used, and often the names of their designers; the paper, ink and details of the binding materials and methods may also receive mention. In the case of technical books, a colophon may specify the software used to prepare the text and diagrams for publication.
Category: Bookmap elements-->
<!ELEMENT colophon      EMPTY                                        >
<!ATTLIST colophon
             %chapter-atts;                                          >

<!--                    LONG NAME: Book Lists                      -->
<!--doc:The <booklists> element references lists of various kinds within the book. For example, it can be used within front matter to reference a <toc>, <tablelist>, and <figurelist>, or within back matter to reference a <glossarylist>, <indexlist>, and <abbrevlist>. It indicates to the processing software that the author wants the lists generated at the <booklists> location.
Category: Bookmap elements-->
<!ELEMENT booklists     ((%toc;) |
                         (%figurelist;) |
                         (%tablelist;) |
                         (%abbrevlist;) |
                         (%trademarklist;) |
                         (%bibliolist;) |
                         (%glossarylist;) |
                         (%indexlist;) |
                         (%booklist;))*                              >
<!ATTLIST booklists
             keyref     CDATA                             #IMPLIED
             %topicref-atts;
             %id-atts;
             %select-atts;
             %localization-atts;                                     >

<!--                    LONG NAME: Table of Contents               -->
<!--doc:The <toc> element references the table of contents within the book. It indicates to the processing software that the author wants a table of contents generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT toc           EMPTY                                        >
<!ATTLIST toc
             %chapter-atts;                                          >

<!--                    LONG NAME: Figure List                     -->
<!--doc:The <figurelist> element references a list of figures in the book. It indicates to the processing software that the author wants a list of figures generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT figurelist    EMPTY                                        >
<!ATTLIST figurelist
             %chapter-atts;                                          >

<!--                    LONG NAME: Table List                      -->
<!--doc:The <tablelist> element references a list of tables within the book. It indicates to the processing software that the author wants a list of tables generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT tablelist     EMPTY                                        >
<!ATTLIST tablelist
             %chapter-atts;                                          >

<!--                    LONG NAME: Abbreviation List               -->
<!--doc:The <abbrevlist> element references a list of abbreviations. It indicates to the processing software that the author wants an abbreviation list generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT abbrevlist    EMPTY                                        >
<!ATTLIST abbrevlist
             %chapter-atts;                                          >

<!--                    LONG NAME: Trademark List                  -->
<!--doc:The <trademarklist> element references a list of trademarks within the book. It indicates to the processing software that the author wants a list of trademarks generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT trademarklist EMPTY                                        >
<!ATTLIST trademarklist
             %chapter-atts;                                          >

<!--                    LONG NAME: Bibliography List               -->
<!--doc:The <bibliolist> element references a list of bibliographic entries within the book. It indicates to the processing software that the author wants a bibliography, containing links to related books, articles, published papers, or other types of material, generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT bibliolist    EMPTY                                        >
<!ATTLIST bibliolist
             %chapter-atts;                                          >

<!--                    LONG NAME: Glossary List                   -->
<!--doc:The <glossarylist> element references a list of glossary entries within the book. It indicates to the processing software that the author wants a glossary list generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT glossarylist  ((%topicmeta;)?, (%topicref;)*)              >
<!ATTLIST glossarylist
             %chapter-atts;                                          >

<!--                    LONG NAME: Index List                      -->
<!--doc:The <indexlist> element lists the index entries in the book. It indicates to the processing software that the author wants an index generated at the particular location.
Category: Bookmap elements-->
<!ELEMENT indexlist     EMPTY                                        >
<!ATTLIST indexlist
             %chapter-atts;                                          >

<!--                    LONG NAME: Book List                       -->
<!--doc:The <booklist> element is a general purpose element, designed for use in specializations, that references a list of particular types of topics within the book. It indicates to the processing software that the author wants that list of topics generated at the particular location. For example, it could be used in a specialization to reference the location of a list of program listings or of authors of topics.
Category: Bookmap elements-->
<!ELEMENT booklist      EMPTY                                        >
<!ATTLIST booklist
             %chapter-atts;                                          >

                     
<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST bookmap     %global-atts; class CDATA "- map/map bookmap/bookmap ">
<!ATTLIST abbrevlist  %global-atts; class CDATA "- map/topicref bookmap/abbrevlist ">
<!ATTLIST amendments  %global-atts; class CDATA "- map/topicref bookmap/amendments ">
<!ATTLIST appendix    %global-atts; class CDATA "- map/topicref bookmap/appendix ">
<!ATTLIST approved    %global-atts; class CDATA "- topic/data bookmap/approved ">
<!ATTLIST backmatter  %global-atts; class CDATA "- map/topicref bookmap/backmatter ">
<!ATTLIST bibliolist  %global-atts; class CDATA "- map/topicref bookmap/bibliolist ">
<!ATTLIST bookabstract %global-atts; class CDATA "- map/topicref bookmap/bookabstract ">
<!ATTLIST bookchangehistory %global-atts; class CDATA "- topic/data bookmap/bookchangehistory ">
<!ATTLIST bookevent   %global-atts; class CDATA "- topic/data bookmap/bookevent ">
<!ATTLIST bookeventtype %global-atts; class CDATA "- topic/data bookmap/bookeventtype ">
<!ATTLIST bookid      %global-atts; class CDATA "- topic/data bookmap/bookid ">
<!ATTLIST booklibrary %global-atts;  class CDATA "- topic/ph bookmap/booklibrary ">
<!ATTLIST booklist    %global-atts; class CDATA "- map/topicref bookmap/booklist ">
<!ATTLIST booklists   %global-atts; class CDATA "- map/topicref bookmap/booklists ">
<!ATTLIST bookmeta    %global-atts; class CDATA "- map/topicmeta bookmap/bookmeta ">
<!ATTLIST booknumber  %global-atts; class CDATA "- topic/data bookmap/booknumber ">
<!ATTLIST bookowner   %global-atts; class CDATA "- topic/data bookmap/bookowner ">
<!ATTLIST bookpartno  %global-atts; class CDATA "- topic/data bookmap/bookpartno ">
<!ATTLIST bookrestriction %global-atts; class CDATA "- topic/data bookmap/bookrestriction ">
<!ATTLIST bookrights  %global-atts; class CDATA "- topic/data bookmap/bookrights ">
<!ATTLIST booktitle   %global-atts;  class CDATA "- topic/title bookmap/booktitle ">
<!ATTLIST booktitlealt %global-atts;  class CDATA "- topic/ph bookmap/booktitlealt ">
<!ATTLIST chapter     %global-atts; class CDATA "- map/topicref bookmap/chapter ">
<!ATTLIST colophon    %global-atts; class CDATA "- map/topicref bookmap/colophon ">
<!ATTLIST completed   %global-atts; class CDATA "- topic/ph bookmap/completed ">
<!ATTLIST copyrfirst  %global-atts; class CDATA "- topic/data bookmap/copyrfirst ">
<!ATTLIST copyrlast   %global-atts; class CDATA "- topic/data bookmap/copyrlast ">
<!ATTLIST day         %global-atts; class CDATA "- topic/ph bookmap/day ">
<!ATTLIST dedication  %global-atts; class CDATA "- map/topicref bookmap/dedication ">
<!ATTLIST draftintro  %global-atts; class CDATA "- map/topicref bookmap/draftintro ">
<!ATTLIST edited      %global-atts; class CDATA "- topic/data bookmap/edited ">
<!ATTLIST edition     %global-atts; class CDATA "- topic/data bookmap/edition ">
<!ATTLIST figurelist  %global-atts; class CDATA "- map/topicref bookmap/figurelist ">
<!ATTLIST frontmatter %global-atts; class CDATA "- map/topicref bookmap/frontmatter ">
<!ATTLIST glossarylist %global-atts; class CDATA "- map/topicref bookmap/glossarylist ">
<!ATTLIST indexlist   %global-atts; class CDATA "- map/topicref bookmap/indexlist ">
<!ATTLIST isbn        %global-atts; class CDATA "- topic/data bookmap/isbn ">
<!ATTLIST mainbooktitle %global-atts;  class CDATA "- topic/ph bookmap/mainbooktitle ">
<!ATTLIST maintainer  %global-atts; class CDATA "- topic/data bookmap/maintainer ">
<!ATTLIST month       %global-atts; class CDATA "- topic/ph bookmap/month ">
<!ATTLIST notices     %global-atts; class CDATA "- map/topicref bookmap/notices ">
<!ATTLIST organization %global-atts; class CDATA "- topic/data bookmap/organization ">
<!ATTLIST part        %global-atts; class CDATA "- map/topicref bookmap/part ">
<!ATTLIST person      %global-atts; class CDATA "- topic/data bookmap/person ">
<!ATTLIST preface     %global-atts; class CDATA "- map/topicref bookmap/preface ">
<!ATTLIST printlocation %global-atts; class CDATA "- topic/data bookmap/printlocation ">
<!ATTLIST published   %global-atts; class CDATA "- topic/data bookmap/published ">
<!ATTLIST publisherinformation %global-atts; class CDATA "- topic/publisher bookmap/publisherinformation ">
<!ATTLIST publishtype %global-atts; class CDATA "- topic/data bookmap/publishtype ">
<!ATTLIST reviewed    %global-atts; class CDATA "- topic/data bookmap/reviewed ">
<!ATTLIST revisionid  %global-atts; class CDATA "- topic/ph bookmap/revisionid ">
<!ATTLIST started     %global-atts; class CDATA "- topic/ph bookmap/started ">
<!ATTLIST summary     %global-atts; class CDATA "- topic/ph bookmap/summary ">
<!ATTLIST tablelist   %global-atts; class CDATA "- map/topicref bookmap/tablelist ">
<!ATTLIST tested      %global-atts; class CDATA "- topic/data bookmap/tested ">
<!ATTLIST toc         %global-atts; class CDATA "- map/topicref bookmap/toc ">
<!ATTLIST trademarklist %global-atts; class CDATA "- map/topicref bookmap/trademarklist ">
<!ATTLIST volume      %global-atts; class CDATA "- topic/data bookmap/volume ">
<!ATTLIST year        %global-atts; class CDATA "- topic/ph bookmap/year ">



