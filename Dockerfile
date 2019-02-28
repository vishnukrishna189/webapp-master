FROM tomcat:latest
ADD /var/lib/jenkins/workspace/devops1/target/mvn-hello-world.war /usr/local/tomcat/webapps/mvn-hello-world.war

