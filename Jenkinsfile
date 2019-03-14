pipeline{


//go to Declarative Directive Generator, add registry ip, copy the keyvalue from credentails of NexusDockerRegistry


environment {

	//for custom image
  	registryCredentials = "b0f869e6-eaaf-49de-9737-204b0faa655e"
        dockerImage = 'tomcat'
	}


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


		//Dockerfile Jenknsfile, source code, pom.xml should be in same location. Add jenkinsuser to docker & root group, restart jenkins and docker service


		steps{
	           sh "sudo docker build -t kvvmanikanth/tomcat:1.0 ."
	       }
	}
	

	
	stage('PushToDockerHub'){

		//from pipeline syntax choose withDockerRegistry and add docker credentails and url
		
		steps{
			withCredentials([usernameColonPassword(credentialsId: 'b0f869e6-eaaf-49de-9737-204b0faa655e', variable: 'DOCKERHUBREPO!')]) {
    sh "docker push kvvmanikanth/tomcat:1.0"
}
                      
		}
	}
            
            
            
            	stage('DeploToK8'){

		//from pipeline syntax choose withDockerRegistry and add docker credentails and url
		
		steps{
							
                                    sh "kubectl --kubeconfig ~root/.kube/config apply -f /k8/tomcat.yml "
                                  
				  }
                }

	   }
      }
