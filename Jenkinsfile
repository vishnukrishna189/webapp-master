pipeline {
    agent { label 'master' }
    stages {
        stage('Debian build') {
            agent {
                docker {
                    label 'JenkinsLabel'
                    image 'ubuntu:18.04'
                }
            }
            steps {
                echo '====== Running in UBUNTU ======'
                sh 'cat /etc/os-release'
                sh 'echo "ubuntu"'
            }
        }
    }
}
