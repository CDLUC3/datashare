#!/bin/sh
# Flatten Schema Startup script
# (c) 2008 Syncro Soft Ltd.

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
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/lib/log4j.jar:$OXYGEN_HOME/lib/xercesImpl.jar:$OXYGEN_HOME/lib/resolver.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME

#
# The command line parameters are mandatory and represents the path of the input
# and the output files.
#

OXYGEN_JAVA=java
if [ -f "${OXYGEN_HOME}/jre/bin/java" ]
then
  OXYGEN_JAVA="${OXYGEN_HOME}/jre/bin/java"
fi

"${OXYGEN_JAVA}" \
 -Xmx128m\
 -cp "$CP"\
 ro.sync.exml.editor.xsdeditor.pagetext.actions.FlatXmlSchema $1 $2
