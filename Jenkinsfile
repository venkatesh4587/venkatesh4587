pipeline {
    agent any

    stages {
        stage('SCM Checkout') {
            steps {
                git credentialsId: 'git-creds', url: 'https://github.com/venkatesh4587/venkatesh4587.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t image .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([string(credentialsId: 'docker-pwd', variable: 'DockerHubPWD')]) {
      sh 'docker login -u 564823 -p ${DockerHubPWD}'               
            }
            stage('Run Container on QA Server') {
               def dockerRun = 'docker run -p 8080:8080 -dt --name sms image'
               sshagent(['qa-server']) {
                 sh "ssh -o StrictHostKetChecking=no ubuntu@172.31.0.239 $(dockerRun)"
} 
            
        }
    }
}
