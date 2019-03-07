pipeline{

agent any

stages {
       stage('GitClone') {
            steps {
                git 'https://github.com/kvvmanikanth/webapp-master'
                  }
            }
       stage('MavenVersio'){
              steps{
                  sh "mvn --version"
              }
       }
       }
}
