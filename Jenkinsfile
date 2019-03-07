pipeline{

agent any

stages {
       stage('GitCheckOut') {
            steps {
                git branch: 'master',
                url: 'https://github.com/kvvmanikanth/webapp-master',
                sh "ls -lat"
                  }
            }

       }
}
