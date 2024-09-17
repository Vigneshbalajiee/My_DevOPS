FROM tomcat:9-jdk11-openjdk

ARG artifact=target/*.war

COPY ${artifact} /usr/local/tomcat/webapps/ROOT.war