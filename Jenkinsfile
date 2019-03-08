//CLONING, BUILDING, COPYING WAR INTO DOCKERFILE AND BUILDING DOCKER IMAGE AND PUSHING IT TO DOCKER REDISTRY

pipeline{


//go to Declarative Directive Generator, add registry ip, copy the keyvalue from credentails of NexusDockerRegistry
environment {
	//for custom images
  	registry = "172.31.56.227:8083"
  	registryCredentials = "8c704737-f614-4dd2-b54f-2effd4d2f19e"
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
		sh 'sudo docker build -t kvvmanikanth/tomcat:1.0 .'

		//for customimage build
                sh "sudo docker build -t registry/dockerImage:${BUILD_NUMBER} ."
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
