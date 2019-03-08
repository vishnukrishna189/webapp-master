pipeline {
    agent any
    stages {
        stage('Debian build') {
            agent {
                docker {
                    label 'master'
                    image 'ubuntu:18.04'
                    // Here label is master & docker image is ubuntu18.04
                }
            }
            steps {
                echo '====== Running in UBUNTU ======'
                sh 'cat /etc/os-release'
                sh 'echo "ubuntu"'
                //the above 2 commands will run in docker ubuntu container
            }
        }
    }
}
