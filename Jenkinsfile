node {
        stage ( 'git clone') {
             git 'https://github.com/olochkabar/nodejs-application'
        }
        stage ( 'build') {
             sh 'npm install'
        }  
        stage ( 'code quality') {
             def scannerHome = tool 'sonar';
              withSonarQubeEnv() {
               sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=nodejsapp"
            }
        }
        stage ( 'artifactory') {
             nodejs(nodeJSInstallationName: 'nodejs') {
               sh 'npm publish'
            }
        }
        stage ( 'docker build') {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker build -t olochkabar/nodejsapp:1 ."
                    }
            }
        stage ( 'docker push') {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                    sh "docker push olochkabar/nodejsapp:1"
                    }
            }
}