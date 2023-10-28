pipeline {
    agent any
    
    stages{
        stage ( 'git clone') {
            steps {
                git 'https://github.com/olochkabar/nodejs-application'
            }
        }
        stage ( 'build') {
            steps {
                sh "npm install"
            }
        }
        stage ( 'code quality') {
            steps {
                script {
                    withSonarQubeEnv() {
                     sh "npm run sonar"
                }
            }
        }
        }
        stage ( 'artifactory1') {
            steps {
                sh "npm publish"
            }
        }
        stage ( 'docker build') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker build -t olochkabar/nodejsapp:1 ."
                    }
                }
            }
        }
        stage ( 'docker push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker push olochkabar/nodejsapp:1"
                    }
                }
            }
        }
    }
}