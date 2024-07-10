pipeline{ 
    
    agent none

    environment {
        DOCKER_REPO="https://hub.docker.com"
        DOCKER_IMAGE = "reactapp"
        DOCKER_CREDENTIALS_ID = "$Docker"
    }


    stages {
        stage('Checkout'){
           agent { label 'Master' }  
            steps{
                checkout scmGit(branches: [[name: 'Dev'], [name: 'main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Vigneshbalajiee/Capstone.git']])
            }
        }
        stage('Build'){
            agent { label 'Master' }
            steps{
                script{
                echo 'Building the image.'
                sh './build.sh'
                }
            }
        }
       stage('Push Docker Image') {
            agent { label 'Master' }  // Define agent for this stage
            steps {
script {
                    def lastCommit = sh(script: "git log -1 --pretty=%H", returnStdout: true).trim()
                    def mergeBase = sh(script: "git merge-base origin/Dev origin/main", returnStdout: true).trim()
                    
                    if (lastCommit == mergeBase) {
                        echo "Pushing Docker image to production repository..."
                        withDockerRegistry([credentialsId:DOCKER_CREDENTIALS_ID, url: "https://index.docker.io/v1/"]) {
                            sh """
                            docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} vigneshbalajiee/prod
                            ./deployprod.sh
                            docker compose -f docker-compose_prod.yml up -d
                            """
                        }
                    } else {
                        echo "Pushing Docker image to development repository..."
                        withDockerRegistry([credentialsId:DOCKER_CREDENTIALS_ID, url: "https://index.docker.io/v1/"]) {
                            sh """
                            docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} vigneshbalajiee/dev
                            ./deploydev.sh
                            docker compose -f docker-compose_dev.yml up -d
                            """
                        }
                    }
                }
            }
        }
    }
   // post{
   //  agent { label 'Slave' } 
   //     always{
   //         cleanWs()
   //     }
   //}
}
