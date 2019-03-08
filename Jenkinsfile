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
		sh 'sudo docker build -t tomcat:0.1 .'
	       }
	}
	
	
	stage('PushToDockerHub'){
		steps{
		withDockerRegistry(credentialsId: '8c704737-f614-4dd2-b54f-2effd4d2f19e', url: '172.31.56.227:8083') {
	        sh "docker tag tomcat:0.1 172.31.56.227:8083/tomcat:0.1"
		sh "docker push 172.31.56.227:8083/tomcat:0.1"
                                }
	        }
	   }
      }
}

