pipeline {
    agent any

    stages {
         stage('Checkout') {
            steps {
                echo 'Pulling the files from Github.'
                git branch:'Dev',url:'https://github.com/Vigneshbalajiee/Capstone.git'
                
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
