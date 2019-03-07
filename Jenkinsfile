pipeline{

agent any
       
       tools{
        jdk 'JAVA_HOME'
        maven 'M2_HOME'      
       }

stages {
       stage('GitClone') {
            steps {
                git 'https://github.com/kvvmanikanth/webapp-master'
                  }
            }
       stage('MavenVersion'){
              steps{
                  sh "mvn --version"
              }
       }
       stage('MavenBuild'){
              steps{
                  sh "mvn clean install"
              }
       }
       stage('Deploy'){
              steps{
                  sshagent(['RemoteCopy']) {
                  sh 'ssh -o StrictHostKeyChecking=no root@172.31.124.67'
                  sh 'ssh -v root@172.31.124.67'
                  sh "scp /var/lib/jenkins/workspace/pipeline-1/target/mvn-hello-world.war root@172.31.124.67:/usr/share/tomcat/webapps/mvn-hello-world.war"
}
              }
       }
       }
}
