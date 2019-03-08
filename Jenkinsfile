pipeline {
    agent { label 'master' }
    stages {
        stage('Alpine build') {
            agent {
                docker {
                    label 'master'
                    image 'maven:3-alpine'
                }
            }
            steps {
                echo '====== Running in Alpine ======'
                sh 'cat /etc/os-release'
                sh 'mvn --version'
            }
        }
    }
}
