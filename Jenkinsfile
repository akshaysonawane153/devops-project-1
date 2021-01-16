pipeline {
  environment {
    registry = "akshaydocker153/docker-jenkins-integration"
    registryCredential = 'dockerhub_cred'
    dockerImage=''
  }
  agent any
  stages {
        stage('Cloning Git project repo') {
        steps{
             git 'https://github.com/akshaysonawane153/devops-project-1.git'
             }
        }
        stage('Building image') {
        steps{
            script {
            dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
        }

        stage('Deploy Image') {
        steps{
            script {
            docker.withRegistry( '', 'dockerhub_cred' ) {
                dockerImage.push()
            }
            }
        }

        }

        stage('Remove Image') {
        steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
        }
   }   
}

node {
    stage('Execute Image'){
        def customImage = docker.build("akshaydocker153/docker-jenkins-integration:${env.BUILD_NUMBER}")
        customImage.inside {
            sh 'echo This is the code executing inside the container.'
        }
    }
}
