pipeline {
    agent any
    tools {
        nodejs "node"
        dockerTool "docker"
    }
    environment {
        DOCKER_IMAGE = "vinhnquoc/capstone-backend"
        DOCKER_TAG = "${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
    }
    stages {
        stage("test") {
            steps {
                echo "Vinh"
            }
        }
        // stage("build") {
        //     steps {
        //         sh "docker build -t ${env.DOCKER_IMAGE}:${env.DOCKER_TAG} ."
        //         withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
        //             sh "docker login -u $user -p $pass"
        //         }
        //         sh "docker push ${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
        //         script {
        //             if (GIT_BRANCH ==~ /.*master.*/) {
        //                 sh "docker tag ${env.DOCKER_IMAGE}:${env.DOCKER_TAG} ${env.DOCKER_IMAGE}:latest"
        //                 sh "docker push ${env.DOCKER_IMAGE}:latest"
        //                 env.DOCKER_TAG = "latest"
        //             }
        //         }
        //         sh "docker image ls | grep ${env.DOCKER_TAG}"
        //         sh "docker image rm ${env.DOCKER_IMAGE}:${env.DOCKER_TAG}"
        //     }
        // }
        // stage("deploy") {
        //     environment {
        //         DEPLOY_DIR = "./deploy"
        //         COMPOSE_FILE = "./docker-compose.yaml"
        //     }
        //     steps {
        //        script {
        //            withCredentials([usernamePassword(credentialsId: 'SSH-Deploy', passwordVariable: 'pass', usernameVariable: 'user')]) {
        //                 def remote = [:]
        //                 remote.name = 'deploy'
        //                 remote.host = 'node-server.centralindia.cloudapp.azure.com'
        //                 remote.user = "$user"
        //                 remote.password = "$pass"
        //                 remote.allowAnyHosts = true
        //                 def temp_str = sshCommand remote: remote, failOnError: false, command: "echo \$(docker images | grep $DOCKER_IMAGE)"
        //                 if (!temp_str.equals("")) {
        //                     temp_str = temp_str.trim();
        //                     def split = temp_str.split(' ');
        //                     sshCommand remote: remote, command: " mkdir -p $DEPLOY_DIR"
        //                     sshCommand remote: remote, command: " export DOCKER_IMAGE=${split[0]} && export DOCKER_TAG=${split[1]} && cd $DEPLOY_DIR && docker compose down"
        //                     sshCommand remote: remote, command: "docker image rm ${split[0]}:${split[1]}"
        //                 }
        //                 sshRemove remote: remote, path: "./deploy/docker-compose.yaml"
        //                 sshPut remote: remote, from: "$COMPOSE_FILE", into: "$DEPLOY_DIR"
        //                 sshCommand remote: remote, command: "docker pull $DOCKER_IMAGE:$DOCKER_TAG"
        //                 sshCommand remote: remote, command: " export DOCKER_IMAGE=$DOCKER_IMAGE && export DOCKER_TAG=$DOCKER_TAG && cd $DEPLOY_DIR && docker compose up -d"
        //             }
        //        }
        //     }
        // }
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
        //     steps {
        //        withCredentials([usernamePassword(credentialsId: 'docker-hub', passwordVariable: 'pass', usernameVariable: 'user')]) {
        //             sh "docker login -u $user -p $pass"
        //         }
        //     }
        // // }
        // // stage("Push Image") {
        // //     steps {
        // //        sh "docker push vinhnquoc/jenkins:test-demo-$BUILD_NUMBER"
        // //     }
        // // }
    }
    post {
        always {
            script {
                    def mailRecipients = "unilinkproject@gmail.com"+
                        ";";
                    emailext attachLog: true,
                        body: '''${SCRIPT, template="groovy_html.template"}''',
                        mimeType: 'text/html',
                        subject: '$DEFAULT_SUBJECT',
                        to: "$mailRecipients"
                }
        }
        // success {
        //     // recipientProviders: [developers(), requestor()],
        // }
        // failure {
        //     // recipientProviders: [developers(), requestor()],
        // }
    }
}