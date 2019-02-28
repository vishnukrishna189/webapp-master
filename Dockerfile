FROM tomcat:latest
COPY /var/lib/jenkins/workspace/devops1/target/**/*.war /usr/local/tomcat/webapps/mvn-hello-world.war
