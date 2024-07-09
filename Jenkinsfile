pipeline {
    agent any

    stages {
         stage('Checkout') {
            steps {
                echo 'Pulling the files from Github.'
                checkout scmGit(branches: [[name: 'Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Vigneshbalajiee/Capstone.git']])
                
            }
        }
        stage('Build') {
            steps {
                echo 'Building the image.'
            
                
            }
        }
    }
    post{
        always{
            cleanWs()
        }
   }
}
