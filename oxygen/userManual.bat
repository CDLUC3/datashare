@echo off
rem
rem %~dp0 is expanded pathname of the current script under NT
rem
SET CP=%~dp0
SET CP=%CP%;%~dp0/lib/oxygen.jar
SET CP=%CP%;%~dp0/lib/author.jar
SET CP=%CP%;%~dp0/lib/syncroSVNClient.jar
SET CP=%CP%;%~dp0/classes
SET CP=%CP%;%~dp0/lib/jide.jar
SET CP=%CP%;%~dp0/lib/jh.jar
SET CP=%CP%;%~dp0/lib/oxygenHelp.jar
SET CP=%CP%;%~dp0/lib/authorHelp.jar
SET CP=%CP%;%~dp0/lib/syncroSVNClientHelp.jar
SET CP=%CP%;%~dp0/lib/log4j.jar
SET CP=%CP%;%~dp0/lib/commons-httpclient-3.1.jar
SET CP=%CP%;%~dp0/lib/commons-codec-1.3.jar
SET CP=%CP%;%~dp0/lib/commons-logging-1.0.4.jar
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Xms20m -Xmx64m -XX:SoftRefLRUPolicyMSPerMB=0 -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp "%CP%" ro.sync.exml.HelpFrame
