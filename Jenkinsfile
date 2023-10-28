node {
        stage ( 'git clone') {
            {
                git 'https://github.com/olochkabar/nodejs-application'
            }
        }
        stage ( 'build') {
            nodejs(nodeJSInstallationName: 'nodejs21.1.0') {
             sh 'npm install'
            }
        }  
        /*stage ( 'code quality') {
            steps {
                script {
                    withSonarQubeEnv() {
                     sh "npm run sonar -Dsonar.projectKey=nodejsapp"
                }
            }
        }
        }*/
        stage ( 'artifactory1') {
            nodejs(nodeJSInstallationName: 'nodejs21.1.0') {
             sh 'npm publish'
            }
        }  
        stage ( 'docker build') {
            {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker build -t olochkabar/nodejsapp:1 ."
                    }
                }
            }
        }
        stage ( 'docker push') {
            {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker push olochkabar/nodejsapp:1"
                    }
                }
            }
        }
    }