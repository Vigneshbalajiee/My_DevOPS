pipeline {
    agent any

    stages {
        stage('Checkout'){
            steps{
                checkout scmGit(branches: [[name: 'Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Vigneshbalajiee/Capstone.git']])
            }
        }
        stage('Build') {
            steps {
                echo 'Building the image.'
                sh ./build.sh
            
                
            }
        }
    }
    post{
        always{
            cleanWs()
        }
   }
}
