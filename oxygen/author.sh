#!/bin/sh
# Oxygen XML Author Startup script
# (c) 2008 Syncro Soft Ltd.

# Resolve the location of the Oxygen XML Author installation.
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
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/lib/author.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME

#
# The command line parameters can be:
#
#  1. file paths of local files opened automatically in editor panels at startup
#
#  2. the following sequence to open a file with default schema association
#   
#      -instance pathToXMLFile -schema pathToSchemaFile -schemaType XML_SCHEMA|DTD_SCHEMA|RNG_SCHEMA|RNC_SCHEMA -dtName documentTypeName
#
#     where:
#
#       - pathToXMLFile is the name of a local XML file
#       - pathToSchemaFile is the name of the schema which you want to associate to the XML file
#       - schemaType: the four constants (XML_SCHEMA, DTD_SCHEMA, RNG_SCHEMA, RNC_SCHEMA) are the possible 
#           schema types (W3C XML Schema, DTD, Relax NG schema in full syntax, Relax NG schema 
#           in compact syntax)
#       - dtName: The name of the document type automatically generated for association. 
#
# Set multiple instances to false if you want to have a single running instance of Author when
# repeatedly starting author.sh. In this way you can open files by typing:
#    author.sh File.xml 
# The files will be opened in the first editor instance, will not create other processes.
#

OXYGEN_JAVA=java
if [ -f "${OXYGEN_HOME}/jre/bin/java" ]
then
  OXYGEN_JAVA="${OXYGEN_HOME}/jre/bin/java"
fi

"${OXYGEN_JAVA}" -Xss512k -Xmx256m\
 -XX:SoftRefLRUPolicyMSPerMB=0\
 -Dcom.oxygenxml.app.descriptor=ro.sync.exml.AuthorOxygenFrameDescriptor\
 "-Dcom.oxygenxml.editor.plugins.dir=$OXYGEN_HOME/plugins"\
 -Dcom.oxygenxml.MultipleInstances=true\
 -cp "$CP" ro.sync.exml.Oxygen "$@"
