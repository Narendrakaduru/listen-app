pipeline {
    agent { label 'node02' }
    stages {
        stage('Git Checkout'){
            steps{
				cleanWs()
				
				checkout([$class: 'GitSCM',
					branches: [
						[name: "${BRANCH}"]
					],
					doGenerateSubmoduleConfigurations: false,
					extensions: [],
					gitTool: 'Default',
					submoduleCfg: [],
					userRemoteConfigs: [
						[credentialsId: 'Git-Auth',
							url: 'git@github.com:Narendrakaduru/${app_name}.git'
						
						]
					]
				])
			}
        }
        stage('Maven Build'){
            steps{
                sh '''
                mvn clean install
                cd target
                mv ${app_name}-0.0.1-SNAPSHOT.jar ${app_name}.jar
                '''
            }
        }
        stage('Docker Build'){
            steps{
                sh '''
                cd ${WORKSPACE}
                docker build -t ${app_name}-img .
                '''
            }
        }
        stage('Docker Push'){
            steps{
                sh'''
                    docker tag ${app_name}-img:latest narendra8686/${app_name}-img:latest
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker push narendra8686/${app_name}-img:latest
                '''
            }
        }
        stage('K8S Deploy'){
            steps{
                sh '''
                    cd ${WORKSPACE}
                    kubectl apply -f ${app_name}-deploy.yaml
                '''
            }
        }
    }
    tools{
        maven 'M2_HOME'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('DockerAuth')
        CI = true
    }
}