# Addressbook Java Maven Project - CI/CD Pipeline

## Project Overview
This project uses **Addressbook**, a Java Maven application, to demonstrate a fully automated CI/CD (Continuous Integration/Continuous Deployment) pipeline, from code integration to deployment in a Kubernetes environment. The pipeline ensures faster, more reliable releases, leveraging GitOps principles with **ArgoCD** for deployment.

## Tools & Technologies
- **Git**: Version control system for managing code.
- **Jenkins**: Automates building, testing, and integrating the code.
- **Maven**: Used to compile, package, and test the Java application.
- **Docker**: Containerizes the application for consistent environments.
- **Docker Hub**: Stores Docker images for distribution.
- **ArgoCD**: GitOps-based tool for managing Kubernetes deployments.
- **Kubernetes**: Deploys, scales, and manages the containerized application.

## Pipeline Stages
1. **Source Code Management** (Git)
   - Code is maintained in a Git repository.
   - Jenkins is configured to trigger a build when new code is pushed.

2. **Build & Test** (Jenkins & Maven)
   - Jenkins checks out the latest code from Git.
   - Maven compiles the project, runs unit tests, and packages the application into a deployable WAR file.

3. **Containerization** (Docker)
   - A Docker image is built from the application using a `Dockerfile`.
   - This image contains all the dependencies required for the application to run.

4. **Push to Docker Hub**
   - The built Docker image is pushed to Docker Hub, allowing it to be accessed by Kubernetes for deployment.

5. **Continuous Deployment** (ArgoCD & Kubernetes)
   - **ArgoCD** is used for automated continuous deployment. It monitors the Git repository for changes and synchronizes the state of the Kubernetes cluster with the desired configuration.
   - **Kubernetes** deploys and manages the Dockerized application, scaling it according to demand and ensuring high availability.

## ArgoCD and Kubernetes Setup

### ArgoCD
ArgoCD is a declarative GitOps tool that continuously monitors Git repositories for changes in application configuration and deploys those changes to Kubernetes.

- **Install ArgoCD**: ArgoCD must be installed in the Kubernetes cluster. You can install it using the following command:
  ```bash
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```
  
- **Create ArgoCD Application**: Once ArgoCD is installed, you can create an ArgoCD application to manage the deployment of your Docker image. Define the application in a manifest file, specifying the repository and the Kubernetes resources to manage.

### Kubernetes Deployment
Kubernetes orchestrates the deployment, scaling, and management of the Docker containers.

- **Create Kubernetes YAML Manifests**: Define the necessary Kubernetes resources like Deployments and Services to manage the application in the cluster.


## CI/CD Pipeline Visualization
![demo](https://github.com/user-attachments/assets/eb29b871-ea9f-4809-ae0f-67ddb4f7dc7f)

## Steps to Run the Project

### Prerequisites
- tomcat:9-jdk11-openjdk
- Maven :3.8.1-jdk-11
- Docker
- Kubernetes cluster (e.g., Minikube)
- Jenkins with required plugins (Git, Maven, Docker)
- ArgoCD configured in the Kubernetes environment

### Setting up Jenkins
1. Install Jenkins and configure the required plugins for Git, Maven, and Docker.
2. Create a Jenkins pipeline job and link it to your Git repository.
3. Define your build pipeline stages in a `Jenkinsfile`.

### Setting up ArgoCD
1. Install ArgoCD in your Kubernetes cluster.
2. Define the ArgoCD application to monitor your Kubernetes manifests stored in a Git repository.
3. ArgoCD will ensure your application's state in Kubernetes always matches the Git repository.

### Running the Pipeline
1. Push changes to your Git repository.
2. Jenkins automatically triggers the pipeline, building the application, creating a Docker image, and pushing it to Docker Hub and also do commit in deployment.yml 
3. ArgoCD automatically deploys the updated Docker image using deployment.yml to Kubernetes.

![ArgoCd](https://github.com/user-attachments/assets/01f9ce91-c34a-40e3-9620-c253ec650cf1)

![Screenshot 2024-10-04 015856](https://github.com/user-attachments/assets/0c4b0312-90b4-4c50-97d8-569fa62c4699)

![Screenshot 2024-10-04 020823](https://github.com/user-attachments/assets/5dab344a-a05e-4098-931e-07ccf54402cd)


## Conclusion
This project demonstrates a modern CI/CD pipeline using Git, Jenkins, Docker, ArgoCD, and Kubernetes. It automates the entire process from code integration to deployment in a Kubernetes environment, ensuring smooth and reliable software delivery.

---
