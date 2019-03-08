pipeline {
    agent { label 'master' }
    stages {
        stage('Debian build') {
            agent {
                docker {
                    label 'master'
                    image 'ubuntu:18.04'
                }
            }
            steps {
                echo '====== Running in Alpine ======'
                sh 'cat /etc/os-release'
                sh 'java -version'
            }
        }
    }
}
