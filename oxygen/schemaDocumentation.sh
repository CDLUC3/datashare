#!/bin/sh
# Oxygen Startup script
# (c) 2006 Syncro Soft Ltd.
echo Script file for generating XML Schema documentation
echo using xs3p schema documentation generator.
echo ""
echo Usage: sh schemaDocumentation.sh pathToXMLConfigurationFile
echo ----------------------------------------------------------------------------------------------
echo Parameters:
echo pathToXMLConfigurationFile  - The path to a configuration file for XML Schema documentation. You can create such a file in the Oxygen "Schema Documentation" dialog. See the Oxygen user manual for additional information on how to create one.
echo ---------------------
echo Example: sh schemaDocumentation.sh samples/personal_schema_doc_config.xml
echo ----------------------------------------------------------------------------------------------

# Resolve the location of the oxygen installation.
# This includes resolving any symlinks.
PRG=$0
while [ -h "$PRG" ]; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '^.*-> \(.*\)$' 2>/dev/null`
    if expr "$link" : '^/' 2> /dev/null >/dev/null; then
        PRG="$link"
    else
        PRG="`dirname "$PRG"`/$link"
    fi
done

OXYGEN_HOME=`dirname "$PRG"`

# Absolutize dir
oldpwd=`pwd`
cd "${OXYGEN_HOME}"; OXYGEN_HOME=`pwd`
cd "${oldpwd}"; unset oldpwd

# Classpath
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME:$OXYGEN_HOME/lib/xercesImpl.jar:$OXYGEN_HOME/lib/saxon9sa.jar:$OXYGEN_HOME/lib/log4j.jar:$OXYGEN_HOME/lib/resolver.jar:$OXYGEN_HOME/lib/jimi.zip

OXYGEN_JAVA=java
if [ -f "${OXYGEN_HOME}/jre/bin/java" ]
then
  OXYGEN_JAVA="${OXYGEN_HOME}/jre/bin/java"
fi

# generates diagrams
"${OXYGEN_JAVA}" -cp "$CP" -Djava.awt.headless=true ro.sync.exml.XMLSchemaConsoleDocGenerator "$@"
 
RETCODE=$?
if [ "$RETCODE" -ne "0" ]; then
echo "Images generation did not succeed, return code "$RETCODE
exit 1
fi