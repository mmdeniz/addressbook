FROM tomcat:8

RUN apt-get update

RUN apt-get upgrade -y

RUN mv webapps webapps.old

RUN mv webapps.dist webapps

#WORKDIR /home/runner/work/addressbook/addressbook/target

ADD /tmp/addressbook.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
