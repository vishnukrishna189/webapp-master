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
                  sh "scp -o StrictHostKeyChecking=no /target/*.war root@172.31.124.67:/usr/share/tomcat/webapps/*"
}
              }
       }
       }
}
