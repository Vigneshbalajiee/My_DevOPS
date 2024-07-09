pipeline {
    agent any

    stages {
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
