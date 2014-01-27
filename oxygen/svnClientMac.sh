#!/bin/sh
# Oxygen SVN Client Startup script
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
CP=$OXYGEN_HOME/lib/oxygen.jar:$OXYGEN_HOME/lib/author.jar:$OXYGEN_HOME/classes:$OXYGEN_HOME

java -Xdock:name="Syncro SVN Client"\
 -Dcom.oxygenxml.app.descriptor=ro.sync.svn.SVNFrameDescriptor \
 -Xmx128m\
 -XX:SoftRefLRUPolicyMSPerMB=0\
 -cp "$CP"\
 ro.sync.exml.Oxygen

