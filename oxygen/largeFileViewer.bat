@echo off
rem %~dp0 is expanded pathname of the current script under NT
SET CP="%~dp0;%~dp0/lib/oxygen.jar;%~dp0/lib/author.jar;%~dp0/classes"

rem  The single command line argument represents the file to be opened.

SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -Dcom.oxygenxml.app.descriptor=ro.sync.largefileviewer.LargeFileViewerMainFrameDescriptor -Xmx256m -XX:SoftRefLRUPolicyMSPerMB=0 -Dsun.java2d.noddraw=true -Dcom.oxygenxml.ApplicationDataFolder="%APPDATA%" -cp %CP% ro.sync.exml.Oxygen %1 