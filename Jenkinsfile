pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Menggunakan docker untuk build image
                    sh "docker build -t go-jenkins ."
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Menjalankan container untuk test
                    sh "docker run go-jenkins go test -v ./..."
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Menjalankan container untuk deploy
                    sh "docker run -d --name go-jenkins-app go-jenkins"
                }
            }
        }
    }
}