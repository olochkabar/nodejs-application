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
            nexusArtifactUploader credentialsId: 'NEXUS', groupId: 'nodejsappgroup', nexusUrl: '99.79.46.124:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'http://99.79.46.124:8081/repository/nodejsapp/', version: '3.61.0-02'{
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