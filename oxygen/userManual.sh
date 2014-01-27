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
CP=$OXYGEN_HOME
CP=$CP:$OXYGEN_HOME/lib/oxygen.jar
CP=$CP:$OXYGEN_HOME/lib/author.jar
CP=$CP:$OXYGEN_HOME/lib/syncroSVNClient.jar
CP=$CP:$OXYGEN_HOME/classes
CP=$CP:$OXYGEN_HOME/lib/jide.jar
CP=$CP:$OXYGEN_HOME/lib/jh.jar
CP=$CP:$OXYGEN_HOME/lib/oxygenHelp.jar
CP=$CP:$OXYGEN_HOME/lib/authorHelp.jar
CP=$CP:$OXYGEN_HOME/lib/syncroSVNClientHelp.jar
CP=$CP:$OXYGEN_HOME/lib/log4j.jar
CP=$CP:$OXYGEN_HOME/lib/commons-httpclient-3.1.jar
CP=$CP:$OXYGEN_HOME/lib/commons-codec-1.3.jar
CP=$CP:$OXYGEN_HOME/lib/commons-logging-1.0.4.jar


OXYGEN_JAVA=java
if [ -f "${OXYGEN_HOME}/jre/bin/java" ]
then
  OXYGEN_JAVA="${OXYGEN_HOME}/jre/bin/java"
fi

"${OXYGEN_JAVA}" -Xms20m -Xmx64m -XX:SoftRefLRUPolicyMSPerMB=0 -cp "$CP" ro.sync.exml.HelpFrame
