pipeline {
    agent {
        node {label 'Windows1'}
    }
    parameters {
  choice choices: ['main', 'feature', 'release'], name: 'Branch'
    }
    tools {
        jdk 'JDK11'
        maven 'Maven'
    }

    stages {
        stage('Git checkout') {
            steps {
                checkout scmGit(branches: [[name: '${params.Branch}']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pvaranasi95/calculator.git']])
            }
        }
        stage('Maven validate') {
            steps{
                bat "mvn validate"
            }
        }
        stage('Maven Package') {
            steps{
                bat "mvn clean package"
            }
        }
         // stage('Sonar Scan') {
         //    steps{
         //         bat '''mvn clean verify sonar:sonar \
         //               -Dsonar.projectKey=Caluculator \
         //               -Dsonar.projectName='Caluculator' \
         //               -Dsonar.host.url=http://localhost:9000 \
         //            -Dsonar.token=sqp_6b24a8184ed60a5c6ad8dd29fe39ad08bf2c642c'''
         //     }
         // }
        stage('Docker Image') {
            steps{
                bat "docker build -t pvaranasi/calculator ."
            }
        }
        stage('Docker image push') {
            steps{
                bat "docker push pvaranasi/calculator"
            }
        }
    }
}
