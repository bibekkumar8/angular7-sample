pipeline {
 agent any
  stages {
    stage('SCM') {
      steps {
         git 'https://github.com/bibekkumar8/angular7-sample.git'
    }
   stage("Install node modules") {
     steps {
	     powershell 'npm install'
         echo "modules installed"
   }
   }
   stage("build") {
     steps {
			powershell 'npm run ng -- build --prod'
            echo "build successful"
   }
   }



    }
  }
}
