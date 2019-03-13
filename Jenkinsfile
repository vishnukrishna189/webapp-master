pipeline{


//go to Declarative Directive Generator, add registry ip, copy the keyvalue from credentails of NexusDockerRegistry


environment {

	//for custom image
  	registryCredentials = "1a08b3ad-bd11-4c5f-ac65-d5196900cc4c"
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
      		withDockerRegistry(credentialsId: '1a08b3ad-bd11-4c5f-ac65-d5196900cc4c', url: 'https://index.docker.io/v1/') {
                sh "docker push kvvmanikanth/tomcat:1.0"
                        }
            
            
            
            	stage('DeploToK8'){

		//from pipeline syntax choose withDockerRegistry and add docker credentails and url
		
		steps{
			sshagent(['7912ab65-9bc0-4f47-93a7-4aea4b30fd2f']) {
				sh "ssh -o StrictHostKeyChecking=no root@172.31.125.246"
                sh "kubectl --kubeconfig ~root/.kube/config create -f /k8/tomcat.yml "
                        }
		    }
                }




        stage('Remove Unused docker image') {

	//deleting the docker image in the server after building and publishing done

 		 steps{
   		       sh "docker rmi $registry/$dockerImage:$BUILD_NUMBER"
 		      }
		}
	   }
      }
