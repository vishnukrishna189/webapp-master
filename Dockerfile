FROM tomcat:8.0.20-jre8
COPY /var/lib/jenkins/workspace/pipeline-1/target/mvn-hello-world.war /usr/local/tomcat/webapps/mvn-hello-world.war

