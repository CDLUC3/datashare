<!-- ============================================================= -->
<!--                    HEADER                                     -->
<!-- ============================================================= -->
<!--  MODULE:    XNAL Domain                                       -->
<!--  VERSION:   1.1                                               -->
<!--  DATE:      November 2006                                     -->
<!--                                                               -->
<!-- ============================================================= -->

<!-- ============================================================= -->
<!--                    PUBLIC DOCUMENT TYPE DEFINITION            -->
<!--                    TYPICAL INVOCATION                         -->
<!--                                                               -->
<!--  Refer to this file by the following public identfier or an 
      appropriate system identifier 
PUBLIC "-//OASIS//ELEMENTS DITA XNAL Domain//EN"
      Delivered as file "xnalDomain.mod"                           -->

<!-- ============================================================= -->
<!-- SYSTEM:     Darwin Information Typing Architecture (DITA)     -->
<!--                                                               -->
<!-- PURPOSE:    Define elements and specialization atttributed    -->
<!--             for the XNAL Domain                               -->
<!--                                                               -->
<!-- ORIGINAL CREATION DATE:                                       -->
<!--             June 2006                                         -->
<!--                                                               -->
<!--             (C) Copyright OASIS Open 2006.                    -->
<!--             All Rights Reserved.                              -->
<!-- ============================================================= -->


<!-- ============================================================= -->
<!--                    ELEMENT NAME ENTITIES                      -->
<!-- ============================================================= -->


<!ENTITY % authorinformation "authorinformation"                     >
<!ENTITY % addressdetails  "addressdetails"                          >
<!ENTITY % administrativearea "administrativearea"                   >
<!ENTITY % contactnumber   "contactnumber"                           >
<!ENTITY % contactnumbers  "contactnumbers"                          >
<!ENTITY % country         "country"                                 >
<!ENTITY % emailaddress    "emailaddress"                            >
<!ENTITY % emailaddresses  "emailaddresses"                          >
<!ENTITY % firstname       "firstname"                               >
<!ENTITY % generationidentifier "generationidentifier"               >
<!ENTITY % honorific       "honorific"                               >
<!ENTITY % lastname        "lastname"                                >
<!ENTITY % locality        "locality"                                >
<!ENTITY % localityname    "localityname"                            >
<!ENTITY % middlename      "middlename"                              >
<!ENTITY % namedetails     "namedetails"                             >
<!ENTITY % organizationinfo "organizationinfo"                       >
<!ENTITY % organizationname "organizationname"                       >
<!ENTITY % organizationnamedetails "organizationnamedetails"         >
<!ENTITY % otherinfo       "otherinfo"                               >
<!ENTITY % personinfo      "personinfo"                              >
<!ENTITY % personname      "personname"                              >
<!ENTITY % postalcode      "postalcode"                              >
<!ENTITY % thoroughfare    "thoroughfare"                            >
<!ENTITY % url             "url"                                     >
<!ENTITY % urls            "urls"                                    >

<!-- ============================================================= -->
<!--                    ELEMENT DECLARATIONS                       -->
<!-- ============================================================= -->
                      
<!--                    LONG NAME: Author Information              -->
<!--doc:The <authorinformation> element contains detailed information about the author or authoring organization.
Category: xNAL elements-->
<!ELEMENT authorinformation
                        ((%personinfo; | %organizationinfo;)*)       >
<!ATTLIST authorinformation     
             %univ-atts;
             href       CDATA                            #IMPLIED
             keyref     CDATA                            #IMPLIED
             type       (creator | contributor | 
                         -dita-use-conref-target)        #IMPLIED    >

<!--                    LONG NAME: Name Details                    -->
<!--doc:The <namedetails> element contains information about the name of the author or the authoring organization.
Category: xNAL elements-->
<!ELEMENT namedetails   ((%personname; | %organizationnamedetails;)*)>
<!ATTLIST namedetails
             %data-element-atts;                                     >

<!--                    LONG NAME: Organization Details            -->
<!--doc:The <organizationnamedetails> element contains information about the name of an authoring organization.
Category: xNAL elements-->
<!ELEMENT organizationnamedetails      
                        ((%organizationname;)?, (%otherinfo;)*)      >
<!ATTLIST organizationnamedetails              
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Organization Name               -->
<!--doc:The <organizationname> element contains name information about the authoring organization.
Category: xNAL elements-->
<!ELEMENT organizationname
                        (%ph.cnt;)*                                  >
<!ATTLIST organizationname
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Person Name                     -->
<!--doc:The <personname> element contains name information about the author.
Category: xNAL elements-->
<!ELEMENT personname    ((%honorific;)?, 
                         (%firstname;)*,(%middlename;)*,(%lastname;)*,
                         (%generationidentifier;)?, (%otherinfo;)*)  >
<!ATTLIST personname
             %data-element-atts;                                     >

<!--                    LONG NAME: Honorific                       -->
<!--doc:The <honorific> element contains the person's title, such as: Dr., Mr., Ms., HRH.. or Grand Exalted Wizard.
Category: xNAL elements-->
<!ELEMENT honorific     (#PCDATA)*                                   >
<!ATTLIST honorific
             %data-element-atts;                                     >

<!--                    LONG NAME: First Name                      -->
<!--doc:The <firstname> element contains the person's first name.
Category: xNAL elements-->
<!ELEMENT firstname     (#PCDATA)*                                   >
<!ATTLIST firstname
             %data-element-atts;                                     >

<!--                    LONG NAME: Middle Name                     -->
<!--doc:The <middlename> element contains the person's middle name or initial.
Category: xNAL elements-->
<!ELEMENT middlename    (#PCDATA)*                                   >
<!ATTLIST middlename
             %data-element-atts;                                     >

<!--                    LONG NAME: Last Name                       -->
<!--doc:The <lastname> element contains the person's last name.
Category: xNAL elements-->
<!ELEMENT lastname      (#PCDATA)*                                   >
<!ATTLIST lastname
             %data-element-atts;                                     >

<!--                    LONG NAME: Generation Identifier           -->
<!--doc:The <generationidentifier> element contains information about the person's generation, such as: Jr, III, or VIII.
Category: xNAL elements-->
<!ELEMENT generationidentifier
                        (#PCDATA)*                                   >
<!ATTLIST generationidentifier
             %data-element-atts;                                     >

<!--                    LONG NAME: Other Information               -->
<!--doc:The <otherinfo> element contains other name information about the author or authoring organization.
Category: xNAL elements-->
<!ELEMENT otherinfo     (%words.cnt;)*>
<!ATTLIST otherinfo
             %data-element-atts;                                     >

<!--                    LONG NAME: Address Details                 -->
<!--doc:The <addressdetails> element contains information about the address of the author or authoring group.
Category: xNAL elements-->
<!ELEMENT addressdetails
                        (%words.cnt;|%locality;|%administrativearea;|
                         %thoroughfare;|%country;)*                  >
<!ATTLIST addressdetails              
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Locality                        -->
<!--doc:The <locality> element contains information about the city and postal or ZIP code. It can contain the information directly, or by acting as a wrapper for <localityname> and <postalcode>.
Category: xNAL elements-->
<!ELEMENT locality      (%words.cnt;|%localityname;|%postalcode;)*   >
<!ATTLIST locality
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Locality Name                   -->
<!--doc:The <localityname> element contains the name of the locality or city.
Category: xNAL elements-->
<!ELEMENT localityname  (%words.cnt;)*                               >
<!ATTLIST localityname
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Administrative Area             -->
<!--doc:The <administrativearea> element contains information about a county, state, or province.
Category: xNAL elements-->
<!ELEMENT administrativearea
                        (%words.cnt;)*                               >
<!ATTLIST administrativearea
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass 
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Thoroughfare                    -->
<!--doc:The <thoroughfare> element contains information about the thoroughfare - for example, the street, avenue, or boulevard - on which an address is located.
Category: xNAL elements-->
<!ELEMENT thoroughfare  (%words.cnt;)*                               >
<!ATTLIST thoroughfare
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Postal Code                     -->
<!--doc:The <postalcode> element contains information about the postal code or the ZIP code.
Category: xNAL elements-->
<!ELEMENT postalcode    (#PCDATA)*                                   >
<!ATTLIST postalcode
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Country                         -->
<!--doc:The <country> element contains the name of a country.
Category: xNAL elements-->
<!ELEMENT country       (#PCDATA)*                                   >
<!ATTLIST country
             keyref     CDATA                            #IMPLIED
             %univ-atts;
             outputclass
                        CDATA                            #IMPLIED    >

<!--                    LONG NAME: Person Information              -->
<!--doc:The <personinfo> element is a wrapper containing all relevant data about a person, including name, address, and contact information.
Category: xNAL elements-->
<!ELEMENT personinfo    ((%namedetails;)?, (%addressdetails;)?,
                         (%contactnumbers;)?, (%emailaddresses;)?)   >
<!ATTLIST personinfo
             %data-element-atts;                                     >

<!--                    LONG NAME: Organization Information        -->
<!--doc:The <organizationinfo> element contains detailed information about an authoring organization.
Category: xNAL elements-->
<!ELEMENT organizationinfo
                        ((%namedetails;)?, (%addressdetails;)?, 
                         (%contactnumbers;)?, (%emailaddresses;)?,
                         (%urls;)?)                                  >  
<!ATTLIST organizationinfo 
             %data-element-atts;                                     >

<!--                    LONG NAME: Contact Numbers                 -->
<!--doc:The <contactnumbers> element contains a list of telephone and fax numbers.
Category: xNAL elements-->
<!ELEMENT contactnumbers
                        (%contactnumber;)*                           >
<!ATTLIST contactnumbers
             %data-element-atts;                                     >
                        
<!--                    LONG NAME: Contact Number                  -->
<!--                    Note: set the type of number using @type   -->
<!--doc:A <contactnumber> element contains a telephone number.
Category: xNAL elements-->
<!ELEMENT contactnumber (#PCDATA)*                                   >  
<!ATTLIST contactnumber
             %data-element-atts;                                     >            
                        
<!--                    LONG NAME: Email Addresses                 -->
<!--doc:The <emailaddress> element contains a list of e-mail addresses.
Category: xNAL elements-->
<!ELEMENT emailaddresses
                        (%emailaddress;)*                            >
<!ATTLIST emailaddresses
             %data-element-atts;                                     >

<!--                    LONG NAME: Email Address                   -->
<!--doc:The <emailaddress> element contains an e-mail address.
Category: xNAL elements-->
<!ELEMENT emailaddress  (%words.cnt;)*                               >
<!ATTLIST emailaddress
             %data-element-atts;                                     >

<!--                    LONG NAME: URLs                            -->
<!--doc:The <urls> element contains a list of Uniform Resource Locators (URLs).
Category: xNAL elements-->
<!ELEMENT urls          (%url;)*                                     >  
<!ATTLIST urls
             %data-element-atts;                                     >

<!--                    LONG NAME: URL                             -->
<!--doc:The <url> element contains a Uniform Resource Locator (URL).
Category: xNAL elements-->
<!ELEMENT url           (%words.cnt;)*                               >  
<!ATTLIST url
             %data-element-atts;                                     >

<!-- ============================================================= -->
<!--                    SPECIALIZATION ATTRIBUTE DECLARATIONS      -->
<!-- ============================================================= -->

<!ATTLIST addressdetails %global-atts; class CDATA "+ topic/ph xnal-d/addressdetails ">
<!ATTLIST administrativearea %global-atts; class CDATA "+ topic/ph xnal-d/administrativearea ">
<!ATTLIST authorinformation %global-atts; class CDATA "+ topic/author xnal-d/authorinformation ">
<!ATTLIST contactnumber %global-atts; class CDATA "+ topic/data xnal-d/contactnumber ">
<!ATTLIST contactnumbers %global-atts; class CDATA "+ topic/data xnal-d/contactnumbers ">
<!ATTLIST country     %global-atts; class CDATA "+ topic/ph xnal-d/country ">
<!ATTLIST emailaddress %global-atts; class CDATA "+ topic/data xnal-d/emailaddress ">
<!ATTLIST emailaddresses %global-atts; class CDATA "+ topic/data xnal-d/emailaddresses ">
<!ATTLIST firstname   %global-atts; class CDATA "+ topic/data xnal-d/firstname ">
<!ATTLIST generationidentifier %global-atts; class CDATA "+ topic/data xnal-d/generationidentifier ">
<!ATTLIST honorific   %global-atts; class CDATA "+ topic/data xnal-d/honorific ">
<!ATTLIST lastname    %global-atts; class CDATA "+ topic/data xnal-d/lastname ">
<!ATTLIST locality    %global-atts; class CDATA "+ topic/ph xnal-d/locality ">
<!ATTLIST localityname %global-atts; class CDATA "+ topic/ph xnal-d/localityname ">
<!ATTLIST middlename  %global-atts; class CDATA "+ topic/data xnal-d/middlename ">
<!ATTLIST namedetails %global-atts; class CDATA "+ topic/data xnal-d/namedetails ">
<!ATTLIST organizationinfo %global-atts; class CDATA "+ topic/data xnal-d/organizationinfo ">
<!ATTLIST organizationname %global-atts;  class CDATA "+ topic/ph xnal-d/organizationname ">
<!ATTLIST organizationnamedetails %global-atts; class CDATA "+ topic/ph xnal-d/organizationnamedetails ">
<!ATTLIST otherinfo   %global-atts; class CDATA "+ topic/data xnal-d/otherinfo ">
<!ATTLIST personinfo  %global-atts; class CDATA "+ topic/data xnal-d/personinfo ">
<!ATTLIST personname  %global-atts; class CDATA "+ topic/data xnal-d/personname ">
<!ATTLIST postalcode  %global-atts; class CDATA "+ topic/ph xnal-d/postalcode ">
<!ATTLIST thoroughfare %global-atts; class CDATA "+ topic/ph xnal-d/thoroughfare ">
<!ATTLIST url         %global-atts; class CDATA "+ topic/data xnal-d/url ">
<!ATTLIST urls        %global-atts; class CDATA "+ topic/data xnal-d/urls ">

<!-- ================== End DITA XNAL Domain  =================== -->
