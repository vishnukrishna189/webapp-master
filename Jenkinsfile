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

	stage('Publish'){
		steps{
		nexusArtifactUploader artifacts: [[artifactId: 'mvn-hello-world', classifier: '', file: '/var/lib/jenkins/workspace/pipeline-1/target/mvn-hello-world.war', type: 'WAR']], credentialsId: '32deb8d8-eae9-4049-8019-48257716ec0c', groupId: 'com.dev3l.hello_world', nexusUrl: 'ec2-35-172-146-52.compute-1.amazonaws.com:8081/', nexusVersion: 'nexus3', protocol: 'http', repository: 'sample1', version: '1.0-SNAPSHOT'
	       }
	}

           }
}

