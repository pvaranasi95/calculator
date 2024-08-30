pipeline {
    agent any
    tools {
        jdk 'JDK11'
        maven 'Maven'
    }

    stages {
        stage('Git checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/pvaranasi95/caluculator.git']])
            }
        }
        stage('Maven validate') {
            steps{
                sh "mvn validate"
            }
        }
        stage('Maven Package') {
            steps{
                sh "mvn clean package"
            }
        }
        // stage('Sonar Scan') {
        //     steps{
        //         sh'''mvn sonar:sonar -Dsonar.url=https://sonarqubepavan.com/ -Dsonar.login= sqp_0ea1297d3b0f75c5bedfe7f4d047fe28b9177280 -Dsonar.projectName=petclinic \
        //             -Dsonar.java.binaries=. \
        //             -Dsonar.projectKey=petclinic'''
        //     }
        // }
    }
}
