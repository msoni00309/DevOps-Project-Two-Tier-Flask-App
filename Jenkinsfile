pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
        timeout(time: 30, unit: 'MINUTES')
    }

    stages {
        stage('Clone repo') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/msoni00309/DevOps-Project-Two-Tier-Flask-App.git'
            }
        }

        stage('Build image') {
            steps {
                sh 'docker build -t flask-app .'
            }
        }

        stage('Deploy with docker compose') {
            steps {
                sh 'docker compose down || true'
                sh 'docker compose up -d --build'
            }
        }
    }
}
