pipeline{


agent any

//agent {label 'linux'} if you want to run this project in jenkins slave,before that you have to configure jenkins slave node
       

       tools{

	//WE HAVE DEFINED THE VALUES OF JAVA_HOME & m2_HOME IN GLOBAL TOOL CONFIGURATION

        jdk 'JAVA_HOME'
        maven 'M2_HOME'      
       }


stages {


       stage('GitClone') {
            steps {
                git 'https://github.com/kvvmanikanth/webapp-master'
                  }
            }



       stage('MavenBuild'){
              steps{
                  sh "mvn --version"
                  sh "mvn clean install"
              }
       }

	stage('BuildDockerImage'){
		steps{
		sh 'sudo docker build -t kvvmanikanth/tomcat:1.0 .'
	       }
	}
	
	
	stage('PushToDockerHub'){
		steps{
		withDockerRegistry(credentialsId: '447776b0-8d84-42cb-9d27-3cfc6a9c31fe', url: 'https://cloud.docker.com') {
                 sh "docker push kvvmanikanth/tomcat:1.0"
                         }
                     }
	        }

           }
}

