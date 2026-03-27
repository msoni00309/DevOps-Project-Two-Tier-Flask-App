pipeline{
    agent any
    stages{
        stage('Clone repo') {
            steps {
                git 'https://github.com/msoni00309/DevOps-Project-Two-Tier-Flask-App.git'
            }
       }

        stage('Build image'){
            steps{
                sh 'docker build -t flask-app .'
            }
        }
        stage('Deploy with docker compose'){
            steps{
                // existing container if they are running
                sh 'docker compose down || true'
                // start app, rebuilding flask image
                sh 'docker compose up -d --build'
            }
        }
    }
}
