@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/classes;%~dp0/lib/log4j.jar;%~dp0/lib/xercesImpl.jar;%~dp0/lib/resolver.jar;"
REM
REM The command line parameters are mandatory and represents the path of the input
REM and the output files.
REM
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Xmx128m -cp %CP% ro.sync.exml.editor.xsdeditor.pagetext.actions.FlatXmlSchema %1 %2