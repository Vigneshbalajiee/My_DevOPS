Please find the Screenshot Folder for all the screenshots.


*******************************************************************************************************
This project is about deploy a reactapp application in production ready state. 
*******************************************************************************************************
Tools used for this projects are
   Git for versioning
   Jenkins for creating pipeline
   Docker to create image and run the container
   AWS EC2 instance to deploy the container
   Prometheus for monitoring.
*******************************************************************************************************
Deployed application site : http://15.206.124.180/
Jenkins site: http://15.206.124.180:8080/job/Capstone/
image_dev : vigneshbalajiee/dev:latest
image_prod: vigneshbalajiee/prod:latest
*******************************************************************************************************
Execution:

First, created the AWS Ec2 instance named Jenkins and connected Via MOBAXTERM. Install necessary applications like Docker, Git, Jenkins, Java to run Jenkins. Then, Clone the project from the given github repo and created the "Dev" Branch from "main". Then created and added below files. 

Dockerfile - set of instructions (steps and command) to build the image. It contains necessary configurations needed for the application to run.
Jenkinsfile - to create a Jenkins pipeline.
alert_rules.yml - for setting Prometheus alert rules
build.sh - script to build the image
deploydev.sh - script to push the image to docker Dev repo 
deployprod.sh - script to push the image to docker prod repo
docker-compose_dev.yml - YAML file to use the image and run the container and expose to users
docker-compose_prod.yml - YAML file to use the image and run the container and expose to user
prometheus.yml - For prometheus configuration

Next, Launch Jenkins in ip:8080 port and Configure necessary items like Role based strategy, Plugins, Credentials. After that created the Jenkins Pipeline and configured it. For configuration, I have enabled "Github hook trigger" for automatically trigger the PIPELINE job 
whenever Push the commits to Github. For that we have to enable webhooks in our github repository and the Jenkins URL. Next, set the ENVIRONMENT variable and give the github url in Jenkins and specify the branch name to checkout. Finally choose the Script Path as Jenkinsfile. So Jenkins automatically looks for the file and run the job.
Jenkinsfile is a textfile defines the configuration of a Jenkins pipeline and written in GROOVY DSL allows us to do the tasks as stages and choose which agent to run the task which can be defined at start or can define in each stage.

I have given 3 stage checkout (to checkout files from github), Build (to build the image) and push the images ( to push the image to docker hub repository ). The condition is to push the image to Dev repo normally and when the main and Dev branches merged then it shoould push to Prod repository in docker hub.
for that I used the condition 

   def lastCommitDev = sh(script: "git log -1 --pretty=%H origin/Dev", returnStdout: true).trim() - to get the last commit hash
   def isMerged = sh(script: "git merge-base --is-ancestor ${lastCommitDev} origin/main && echo true || echo false", returnStdout: true).trim() -- if Dev merged with main last commit of Dev added to main and also new commitid will create. So, Dev's last commit is the ancestor of currrent main branch head.
   if (isMerged == "true")

if this satisfies then merge happend so the image pushed to Prod repo in dockerhub. else it will pushed to dev repo. After that using docker-compose file to run the container by pulling the image from respective repo based on above condition.

once the container start running we can acces the application in port 80 using our Ip http://15.206.124.180/. 

For monitoring the container i have used Prometheus in Slave instance and installed prometheus, Grafana and Alertmanager. We can install Node Exporter if required. In prometheus.yml I have set one job to export docker metrics, so that it will knowabout status of container 
and created the rules for the alert if the container goes down it will send the notification through Email. 

Prometheus will expose on port 9090 and aler manager will expose on port 9093 


                    


