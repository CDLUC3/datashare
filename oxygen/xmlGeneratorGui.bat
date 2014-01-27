@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/classes"
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Xmx180m -Dcom.oxygenxml.app.descriptor=ro.sync.xml.generator.XMLGeneratorMainFrameDescriptor -XX:SoftRefLRUPolicyMSPerMB=0 -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.exml.Oxygen