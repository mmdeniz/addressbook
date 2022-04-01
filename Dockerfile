FROM tomcat:jre8-openjdk-buster

RUN apt-get update

RUN apt-get upgrade -y

COPY target/addressbook-2.0.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
