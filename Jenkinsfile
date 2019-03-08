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
		withDockerRegistry(credentialsId: 'c1d37db4-25c0-4aa8-bfde-7c29dd7cabcf') {
                 sh "docker push kvvmanikanth/tomcat:1.0"
                         }
                     }
	        }

           }
}

