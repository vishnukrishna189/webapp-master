FROM tomcat:8.0.20-jre8
COPY mvn-hello-world.war /usr/local/tomcat/webapps/mvn-hello-world.war

