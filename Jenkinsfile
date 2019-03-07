pipeline{

agent {label 'linux'}
       
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
       
       }
}
