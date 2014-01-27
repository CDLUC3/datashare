@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/classes"
REM
REM The command line parameter is optional and represents the path of a file
REM opened automatically at startup
REM
REM To make the tree editor readonly, change the 
REM "com.oxygenxml.tree.readonly" property to true
REM
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Dcom.oxygenxml.tree.readonly=false -Dcom.oxygenxml.app.descriptor=ro.sync.ui.tree.TreeMainEditorDescriptor -Xmx256m -XX:SoftRefLRUPolicyMSPerMB=0 -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.exml.Oxygen %1