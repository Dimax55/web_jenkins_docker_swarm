pipeline {
    agent any

    environment {
        // Додаємо креденшіали для Docker
        DOCKER_CREDENTIALS_ID = 'cd534947-edb6-41c6-928c-380ffe95af3d'
        CONTAINER_NAME = 'dimax555/19.05.jenkins-web'
    }


    stages {


       stage('Вхід у Docker') {
            steps {
                script {
                    // Використовуємо креденшіали з Jenkins для входу в Docker
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }

        stage('Білд Docker зображення') {
            steps {
                script {
                    // Будуємо Docker зображення
                    sh 'docker build -t dimax555/19.05.jenkins-web:version${BUILD_NUMBER} .'
                }
            }
        }

          stage('Тегування Docker зображення') {
            steps {
                script {
                    // Додаємо тег 'latest' до збудованого образу
                    sh 'docker tag dimax555/19.05.jenkins-web:version${BUILD_NUMBER} dimax555/19.05.jenkins-web:latest'
                }
            }
        }

        stage('Пуш у Docker Hub') {
            steps {
                script {
                    // Пушимо зображення на Docker Hub
                    sh 'docker push dimax555/19.05.jenkins-web:version${BUILD_NUMBER}'
                    sh 'docker push dimax555/19.05.jenkins-web:latest'
                }
            }
        }

        stage('Запуск Docker контейнера') {
            steps {
                script {
                    // Запускаємо Docker контейнер з новим зображенням
                    //sh 'docker run -d -p 8081:80 --name ${CONTAINER_NAME} --health-cmd="curl --fail http://localhost:80 || exit 1" kuzma343/kuzma_branch:version${BUILD_NUMBER}'
                    sh 'docker stack deploy -c docker-compose.yml sitejenk'

                }
            }
        }
    }
}
