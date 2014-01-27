@echo off


echo Script file for generating XML Schema documentation
echo using xs3p schema documentation generator.

echo Usage: schemaDocumentation.bat pathToXMLConfigurationFile 
echo ----------------------------------------------------------------------------------------------
echo Parameters:
echo pathToXMLConfigurationFile  - The path to a configuration file for XML Schema documentation. You can create such a file in the Oxygen "Schema Documentation" dialog. See the Oxygen user manual for additional information on how to create one.
echo ---------------------
echo Example: schemaDocumentation.bat samples\personal_schema_doc_config.xml
echo ----------------------------------------------------------------------------------------------

SET BASE_DIR=%~dp0

echo Running transformation
SET OXYGEN_JAVA=java.exe
if exist "%~dp0\jre\bin\java.exe" SET OXYGEN_JAVA="%~dp0\jre\bin\java.exe"
%OXYGEN_JAVA% -cp "%BASE_DIR%;%BASE_DIR%/classes;%BASE_DIR%/lib/oxygen.jar;%BASE_DIR%/lib/xercesImpl.jar;%BASE_DIR%/lib/saxon9sa.jar;%BASE_DIR%/lib/log4j.jar;%BASE_DIR%/lib/resolver.jar" -Djava.awt.headless=true ro.sync.exml.XMLSchemaConsoleDocGenerator %1