pipeline{
    
    agent none  

    environment {
        DOCKER_REPO="https://hub.docker.com/"
        DOCKER_IMAGE = "Reactapp"
        DOCKER_CREDENTIALS_ID = "$Docker"
    }


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
                sh './build.sh'
                }
            }
        }
       stage('Push Docker Image') {
            agent { label 'Slave' }  // Define agent for this stage
            steps {
script {
                    def lastCommit = sh(script: "git log -1 --pretty=%H", returnStdout: true).trim()
                    def mergeBase = sh(script: "git merge-base origin/Dev origin/main", returnStdout: true).trim()
                    
                    if (lastCommit == mergeBase) {
                        echo "Pushing Docker image to production repository..."
                        withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: ${DOCKER_REPO}]) {
                            sh """
                            docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} vigneshbalajiee/prod:${BUILD_NUMBER}
                            docker push ${DOCKER_PROD_REPO}/${DOCKER_IMAGE}:${env.BUILD_ID}
                            docker compose -f docker-compose_prod.yml up -d
                            """
                        }
                    } else {
                        echo "Pushing Docker image to development repository..."
                        withDockerRegistry([credentialsId: DOCKER_CREDENTIALS_ID, url: ${DOCKER_REPO}]) {
                            sh """
                            docker tag ${DOCKER_IMAGE}:${BUILD_NUMBER} vigneshbalajiee/dev:${BUILD_NUMBER}
                            docker push ${DOCKER_DEV_REPO}/${DOCKER_IMAGE}:${env.BUILD_ID}
                            docker compose -f docker-compose_dev.yml up -d
                            """
                        }
                    }
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
