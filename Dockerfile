FROM tomcat:latest

RUN apt-get update

COPY target/addressbook-2.0.war /usr/local/tomcat/webapps
