pipeline{

agent any
       
       tools{
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
       }
}
