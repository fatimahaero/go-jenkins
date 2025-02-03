pipeline {
    agent any
    environment {
        DOCKER_SOCKET = "/var/run/docker.sock" // Lokasi Docker socket
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Menjalankan Docker Build, pastikan Docker socket bisa diakses
                    sh "docker build -t go-jenkins ."
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    // Menjalankan Docker container untuk test
                    sh "docker run go-jenkins go test -v ./..."
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Menjalankan Docker container untuk deploy
                    sh "docker run -d --name go-jenkins-app go-jenkins"
                }
            }
        }
    }
}
