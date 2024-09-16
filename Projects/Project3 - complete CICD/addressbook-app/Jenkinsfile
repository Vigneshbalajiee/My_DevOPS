pipeline{
   agent{
    docker{
        image 'maven:3.8.7-openjdk-17'
        label 'docker-agent'
        args '-v /root/.m2:/root/.m2' 
    }
   }

   stages{

    stage('checkout'){
      step{  
       sh 'echo checkedout'
       // git branch: 'main', url: 'https://github.com/Vigneshbalajiee/My_DevOPS.git'
      }  
    }

    stage('build the package'){
       step{ 
        //build the war file
        sh 'cd Projects/Project3 - complete CICD/addressbook-app && mvn clean package'
       }
    }

    stage('build and push image to hub'){
        environment{
            IMAGE = "vigneshbalajiee/addressbook:${BUILD_NUMBER}"
            CRED = credentials('Docker')
        }
        step{
            script{
                sh 'cd Projects/Project3 - complete CICD/addressbook-app && docker build -t ${IMAGE} .'
                def dockerImage = docker.image("${IMAGE}")
                docker.withRegistry('https://index.docker.io/v1/', "CRED"){
                    dockerImage.push()
                }
            }
        }
    }

   }
}