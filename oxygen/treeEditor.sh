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

# Classpath
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME

#
# The command line parameter is optional and represents the path of a file
# opened automatically at startup
#
# To make the tree editor readonly, change the 
# "com.oxygenxml.tree.readonly" property to true
#

OXYGEN_JAVA=java
if [ -f "${OXYGEN_HOME}/jre/bin/java" ]
then
  OXYGEN_JAVA="${OXYGEN_HOME}/jre/bin/java"
fi

"${OXYGEN_JAVA}" \
 -Dcom.oxygenxml.app.descriptor=ro.sync.ui.tree.TreeMainEditorDescriptor \
 -Dcom.oxygenxml.tree.readonly=false\
 -Xmx256m\
 -XX:SoftRefLRUPolicyMSPerMB=0\
 -cp "$CP"\
 ro.sync.exml.Oxygen $1

