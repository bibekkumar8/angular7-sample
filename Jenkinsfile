node() {
           stage ('Cloning Git'){
             checkout scm
                    
         }
         stage('Install dependencies'){
                bat "npm install"
                 echo "Modules installed"
             }
         
         
         stage('Build'){
                bat "ng build --prod"
                echo "Build completed"
            }
         stage('Package Build'){
                   sh "7z -zcvf bundle.tar.gz dist/np7/"
         }

         stage('Artifacts Creation'){
             fingerprint 'bundle.tar.gz'
             achieveArtifacts 'bundle.tar.gz'
             echo "Artifacts created"

         }

         stage('Stash changes') {
             stash allowEmpty: true, includes: 'bundle.tar.gz', name: 'buildartifacts'
         }

    }
        

         node('awsnode'){
             echo 'Unstash'
             unstash 'buildArtifacts'
             echo 'Artifacts copied'

             echo 'Copy'
             sh "yes | sudo cp-R bundle.tar.gz /var/www/html && cd /var/www/html && sudo 7z -xvf bundle.tar.gz"
             echo "Copy completed"
         }
     
