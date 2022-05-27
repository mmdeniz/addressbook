FROM tomcat:8

RUN apt-get update

RUN apt-get upgrade -y

RUN mv webapps webapps.old

RUN mv webapps.dist webapps

#COPY /home/runner/work/addressbook/addressbook/target/addressbook-2.0.war /usr/local/tomcat/webapps/addressbook.war

CMD ["catalina.sh", "run"]
