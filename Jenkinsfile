pipeline {



agent any

//agent {label 'linux'} if you want to run this project in jenkins slave,before that you have to configure jenkins slave node
       

       tools {

	//WE HAVE DEFINED THE VALUES OF JAVA_HOME & m2_HOME IN GLOBAL TOOL CONFIGURATION

        jdk 'JAVA_HOME'
        maven 'M2_HOME'      
       }

stages {



       stage('GitClone') {
            steps {
                git 'https://github.com/vishnukrishna189/webapp-master.git'
                  }
            }



       stage('MavenBuild') {
              steps {
                  sh "mvn --version"
                  sh "mvn clean install"
              }
       }



      stage('Publish') {
             steps {

		//we installed nexus artifactoryplugin, then checkin snipet generator for nexus,enter the details & click on
                   //snippet generator


                nexusArtifactUploader artifacts: [
			              [artifactId: 'mvn-hello-world', 
				      classifier: '', 
				      file: '/var/lib/jenkins/workspace/nexus/target/mvn-hello-world.war', 
				      type: 'war']], 
			              credentialsId: '6549c800-3ca8-4dba-8146-0fe14f119037', 
			              groupId: 'com.dev3l.hello_world',
			              nexusUrl: 'vis5.com/8081',
			              nexusVersion: 'nexus3', 
			              protocol: 'http', 
			              repository: 'sample', 
			              version: '1.0-SNAPSHOT'
	     }
      } 
}
}
