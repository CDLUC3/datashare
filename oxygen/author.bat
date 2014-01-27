@echo off
rem
rem %~dp0 is expanded pathname of the current script under NT
rem
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/lib/author.jar;%~dp0/classes;"
rem
rem The command line parameters can be:
rem
rem  1. file paths of local files opened automatically in editor panels at startup
rem
rem  2. the following sequence to open a file with default schema association
rem   
rem      -instance pathToXMLFile -schema pathToSchemaFile -schemaType XML_SCHEMA|DTD_SCHEMA|RNG_SCHEMA|RNC_SCHEMA -dtName documentTypeName
rem
rem     where:
rem
rem       - pathToXMLFile: is the name of a local XML file
rem       - pathToSchemaFile: is the name of the schema which you want to associate to the XML file
rem       - schemaType: the four constants (XML_SCHEMA, DTD_SCHEMA, RNG_SCHEMA, RNC_SCHEMA) are the possible 
rem           schema types (W3C XML Schema, DTD, Relax NG schema in full syntax, Relax NG schema 
rem           in compact syntax)
rem       - dtName: The name of the document type automatically generated for association.
rem
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Xss512k -Xmx256m -XX:SoftRefLRUPolicyMSPerMB=0 -Dcom.oxygenxml.app.descriptor=ro.sync.exml.AuthorOxygenFrameDescriptor -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.exml.Oxygen %1 %2 %3 %4 %5 %6 %7 %8