FROM ubuntu:latest

#installing java

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk


#installing maven

RUN \
    apt update && \
    apt install -y maven && \
    mvn -version

#installing tomcat

RUN apt install -y wget curl
RUN mkdir /opt/tomcat
RUN wget https://downloads.apache.org/tomcat/tomcat-8/v8.5.57/bin/apache-tomcat-8.5.57-deployer.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.*/* /opt/tomcat/


WORKDIR /application
COPY . .
RUN "sh" "mvninstall.sh"
COPY start.sh /home
EXPOSE 8080
CMD "sh" "/home/start.sh"
