FROM tomcat:8

RUN apt-get update

RUN apt-get upgrade -y

RUN mv webapps webapps.old

RUN mv webapps.dist webapps

WORKDIR /home/runner/work/addressbook/addressbook/target/

COPY addressbook-2.0.war /usr/local/tomcat/webapps/addressbook.war

CMD ["catalina.sh", "run"]
