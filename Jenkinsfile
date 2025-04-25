pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/extraordinarytechy/flask-ci-cd-demo.git'
            }
        }

        stage('Build') {
            steps {
                sh 'docker build -t flask-ci-cd-demo .'
            }
        }

        stage('Test') {
            steps {
                echo 'Running basic test...'
                sh 'docker run -d --name test-container -p 5000:5000 flask-ci-cd-demo'
                sh 'sleep 5'
                sh 'curl --fail http://localhost:5000 || exit 1'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying container...'
                sh 'docker stop test-container && docker rm test-container || true'
                sh 'docker run -d -p 5000:5000 flask-ci-cd-demo'
            }
        }

        stage('Cleanup') {
            steps {
                echo 'Cleanup done.'
            }
        }
    }
}

