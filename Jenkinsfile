pipeline {
    agent any

    environment {
        DOCKER_HUB_REPO = 'dimax555/01.0.7.24.jenkins-web'
        DOCKER_HUB_CREDENTIALS = '5e72dcd7-bf1a-4638-8b0f-a231dfd0f561'
        GIT_REPO = 'git@github.com:Dimax55/web_jenkins_docker_swarm.git'
        GIT_BRANCH = 'main'
        CONTAINER_PORT = '80' // Порт, на який буде прокинуто контейнер
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${GIT_BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_HUB_REPO} .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                    // sh 'docker push ${DOCKER_HUB_REPO}'/*
                    withCredentials([usernamePassword(credentialsId: "${env.DOCKER_HUB_CREDENTIALS}", usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
                        sh "echo \$DOCKER_HUB_PASSWORD | docker login -u \$DOCKER_HUB_USERNAME --password-stdin"
                        sh "docker push ${env.DOCKER_HUB_REPO}"
                }
            }
        }

        stage('Pull from Docker Hub') {
            steps {
                script {
                    sh 'docker pull ${DOCKER_HUB_REPO}'
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    // Запуск контейнера з прокинутим портом
                    sh 'docker run -d -p ${CONTAINER_PORT}:80 ${DOCKER_HUB_REPO}'
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker logout'
            }
        }
    }
}
