#!/usr/bin/env bash

# Set environment variable to XTF Workshop folder
export XTFWS=$PWD

# Set environment variable for Tomcat servlet container
export CATALINA_HOME=$XTFWS/tomcat

# Set environment variable for the XTF installation location
export XTF_HOME=$CATALINA_HOME/webapps/xtf
