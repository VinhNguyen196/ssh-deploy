pipeline {
    agent any
    // tools {
    //     //nodejs "node"
    //     //dockerTool "docker"
    // }
    stages {
        stage("SSH Agent") {
            steps {
               script {
                   withCredentials([usernamePassword(credentialsId: 'SSH-Deploy', passwordVariable: 'pass', usernameVariable: 'user')]) {
                        def remote = [:]
                        remote.name = 'deploy'
                        remote.host = 'node-server.centralindia.cloudapp.azure.com'
                        remote.user = "$user"
                        remote.password = "$pass"
                        remote.allowAnyHosts = true
                        sshCommand remote: remote, command: "docker pull vinhnquoc/docker:latest"
                        sshCommand remote: remote, command: "cd deploy && docker compose up -d"
                    }
               }
            }
        }
        // stage("Login with user role") {
        //     steps {
        //         sh 'touch /home/password.sh >> docker'
        //         sh 'sudo -u docker /home/password.sh'
        //     }
        // }
        // stage("SonarQube check") {
        //     steps {
        //         script {
        //             def scannerHome = tool name: 'sonar', type: 'hudson.plugins.sonar.SonarRunnerInstallation'
        //             withSonarQubeEnv(installationName: 'sonarqube_server') {
        //                 sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=NodeJs"
        //             }
        //         }
        //     }
        // }
        // stage("Quality Gate") {
        //     steps {
        //         timeout(time: 1, unit: 'HOURS') {
        //             // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
        //             // true = set pipeline to UNSTABLE, false = don't
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }
        // stage("Npm install") {
        //     // steps {
        //     //     nodejs('Node-17.6.0') {
        //     //         sh 'npm install'
        //     //     }
        //     // }
        //     steps {
        //         sh 'npm install'
        //     }
        // }
        // stage("Init docker") {
        // //    steps {
        // //         script {
        // //             def dockerHome = tool 'docker-server'
        // //             dockerHome.image('tomcat')
        // //             dockerHome.pull()
        // //             env.PATH = "${dockerHome}/bin:${env.PATH}"
        // //         }
        // //    }
        //     steps {
        //         sh 'docker --version'
        //         //sh 'sudo chmod 666 /var/run/docker.sock'
        //     }
        // }
        // // stage("Build image") {
        // //     steps {
        // //        sh "docker build -t vinhnquoc/jenkins:test-demo-$BUILD_NUMBER ."
        // //     }
        // // }
        // // stage("Login dockerhub") {
        // //     steps {
        // //        withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
        // //             sh "docker login -u $user -p $pass"
        // //         }
        // //     }
        // // }
        // // stage("Push Image") {
        // //     steps {
        // //        sh "docker push vinhnquoc/jenkins:test-demo-$BUILD_NUMBER"
        // //     }
        // // }
    }
    post {
        success {
            emailext body: 'Deploy success', recipientProviders: [developers(), buildUser()], subject: '', to: 'vinhnquoc196@gmail.com'
            // recipientProviders: [developers(), requestor()],
        }
        failure {
            emailext body: 'Deploy fail', recipientProviders: [developers(), buildUser()], subject: '', to: 'vinhnquoc196@gmail.com'
            // recipientProviders: [developers(), requestor()],
        }
    }
}