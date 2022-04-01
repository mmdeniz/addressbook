FROM tomcat:jre8-openjdk-buster

RUN apt-get update

RUN apt-get upgrade -y

RUN mv webapps webapps.old

RUN mv webapps.dist webapps

COPY target/addressbook-2.0.war /usr/local/tomcat/webapps/addressbook.war

CMD ["catalina.sh", "run"]
