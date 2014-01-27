@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/log4j.jar;%~dp0/lib/xercesImpl.jar;%~dp0/lib/resolver.jar;%~dp0/lib/oxygen.jar;%~dp0/classes"
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Xmx180m -XX:SoftRefLRUPolicyMSPerMB=0 -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.xml.generator.XMLInstanceGenerator %1 %2