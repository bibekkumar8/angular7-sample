
node {
         stage ('Checkout SCM'){
                    git branch: 'master',url: 'https://github.com/bibekkumar8/angular7-sample.git'
         }
         
         stage('Install node modules'){
                      sh "npm install"
         }
         stage('Build'){
                     sh "ng build --no-aot --no-build-optimizer --base-href ./"
                     sh "cp -R /home/var/lib/jenkins/workspace/angular/dist/*   /home/bibek/angular/"
         }
         stage('Deploy'){
                      sh "pm2 restart all"
         }
     }
