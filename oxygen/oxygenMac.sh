#!/bin/sh
# Oxygen Startup script
# (c) 2006 Syncro Soft Ltd.

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

export PATH=$PATH:$OXYGEN_HOME/lib
export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$OXYGEN_HOME/lib

# Classpath
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME

#
# The command line parameters can be:
#
#  1. file paths of local files opened automatically in editor panels at startup
#
#  2. the sequence
#		
#      -instance pathToXMLFile -schema pathToSchemaFile -schemaType XML_SCHEMA|DTD_SCHEMA|RNG_SCHEMA|RNC_SCHEMA
#
#     where:
#
#       - pathToXMLFile is the name of a local XML file
#       - pathToSchemaFile is the name of the schema which you want to associate to the XML file
#       - he four constants (XML_SCHEMA, DTD_SCHEMA, RNG_SCHEMA, RNC_SCHEMA) are the possible 
#           schema types (W3C XML Schema, DTD, Relax NG schema in full syntax, Relax NG schema 
#           in compact syntax)
#
java  "-Xdock:name=Oxygen"\
 -Xdock:icon=Oxygen.app/Contents/Resources/Oxygen.icns\
 -Dcom.oxygenxml.editor.plugins.dir="$OXYGEN_HOME/plugins"\
 -Xss650k -Xmx256m\
 -XX:SoftRefLRUPolicyMSPerMB=0\
 -cp "$CP" ro.sync.exml.Oxygen "$@"
