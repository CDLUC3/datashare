@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/lib/author.jar;%~dp0/lib/syncroSVNClient.jar;%~dp0/classes"

rem  The two command line parameters are optional and represent the path of the directory 
rem  displayed in the left side panel of the XML Diff window and the path of the directory 
rem  displayed in the right side panel.

SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Dcom.oxygenxml.app.descriptor=ro.sync.diff.ui.DiffDirectoriesMainFrameDescriptor -Xmx180m -XX:SoftRefLRUPolicyMSPerMB=0 -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.exml.Oxygen %1 %2