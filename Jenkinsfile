pipeline {
    agent any
    tools {
        maven 'maven_3.9.11'
    }
    stages {
        stage ('Build Maven') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sidhartha07/demo-jenkins-app']])
                sh 'mvn clean install'
            }
        }
        stage ('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t sidharthajobies/demo-jenkins-app .'
                }
            }
        }
        stage ('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                        sh 'docker login -u sidharthajobies -p ${dockerhubpwd}'
                    }
                    sh 'docker push sidharthajobies/demo-jenkins-app'
                }
            }
        }
    }
}
