#!/bin/bash
cd /application
mvn clean install
cp target/WebApp.war /opt/tomcat/webapps
