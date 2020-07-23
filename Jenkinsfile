
node {
         stage ('Checkout SCM'){
                    git branch: 'master',url: 'https://github.com/bibekkumar8/angular7-sample.git'
         }
         
         stage('Install node modules'){
                      bat "npm install"
         }
         stage('Build'){
                    bat "npm run ng --build --prod"
         }
         stage('Deploy'){
                      sh "pm2 restart all"
         }
     }
