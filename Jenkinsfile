pipeline{
    agent any

    stages {
        stage('Checkout'){
            steps{
                checkout scmGit(branches: [[name: 'Dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Vigneshbalajiee/Capstone.git']])
            }
        }
        stage('Build'){
            steps{
                script{
                echo 'Building the image.'
                sh 'chmod +x build.sh'
                sh 'ls -l'
                sh 'echo "creating image using dockerfile'
                sh 'docker build . -t reactapp'
                }
            }
        }
    }
    post{
        always{
            cleanWs()
        }
   }
}
