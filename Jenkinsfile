pipeline {
    agent { label 'master' }
    stages {
        stage('Centos Build') {
            agent {
                docker {
                    label 'master'
                    image 'centos:latest'
                }
            }
            steps {
                echo '====== Running in Alpine ======'
                sh 'cat /etc/os-release'
                sh 'java --version'
            }
        }
    }
}
