pipeline {
      agent any
      stages {
       stage('Cloning Git') {
         steps {
            checkout scm
            }
       }
stage(' adding user') {
      steps {
           script{
              sudo groupadd docker
              sudo usermod -aG docker $USER
              sudo newgrp docker
             }
            }
         }
        stage('Build images') {
	      steps {
		bat '''
			  cd sm-shop
			  docker build -f "Dockerfile" -t /angular7-sample .
		  
		'''
	      }
       }
   
     stage('Push Docker image') {
	  steps{
		    withDockerRegistry([ credentialsId: "Docker_Hub", url: "" ]){
			
			bat "docker push bibek1234/angular7-sample"   
	  	   }
	   }
       } 
       stage('Deploy On Aws'){
	      /* 
	       environment{
		       
		        dockerRun = "docker run -p 8080:8080 -d --name my-app kammana/my-app:2.0.0"
	       }
		*/
	       steps{
			sshagent(['dev-server']) {
			bat "ssh -o StrictHostKeyChecking=no ec2-user@3.235.30.68 sudo docker run bibekkumar/angular7-sample"
			}
	   	}
   }
} 
	post {
        always {
            //archiveArtifacts artifacts: 'generatedFile.log', onlyIfSuccessful: true
          
            emailext attachLog: true,
                body: "${currentBuild.currentResult}: Job ${env.JOB_NAME} build ${env.BUILD_NUMBER}\n More info at: ${env.BUILD_URL}",
                recipientProviders: [developers(), requestor()],
                subject: "Jenkins Build :- ${currentBuild.currentResult}: Job ${env.JOB_NAME}"
            
        }
    }
}
