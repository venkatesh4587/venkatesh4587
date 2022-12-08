pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/venkatesh4587/venkatesh4587.git'
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t image .'
            }
        }
        stage('Publish Image to Docker Hub') {
            steps {
                 withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
                 sh 'docker push image'                
                } 
            }
            stage('Run Docker container on Jenkins Agent') {
             
            steps 
   {
                sh "docker run -d -p 8080:8080 image"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.0.239 run -d -p 8080:8080 image"
 
            }
        }
        }
    }
