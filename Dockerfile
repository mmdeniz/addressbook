FROM tomcat:8

RUN apt-get update

RUN apt-get upgrade -y

RUN mv webapps webapps.old

RUN mv webapps.dist webapps

COPY /tmp/addressbook.war /usr/local/tomcat/webapps/addressbook.war

CMD ["catalina.sh", "run"]
