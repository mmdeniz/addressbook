pipeline {
    agent any
    tools {
        //
        // this requires Maven integration plugin
        //
        maven 'maven-3.8.5'
    }
    stages{
        stage ('Get the source code') {
            steps {
                git 'https://github.com/mmdeniz/addressbook.git'
            }
        }
        stage ('Compile App') {
            steps {
                sh 'mvn compile'
            }
        }
        stage ('Code Scan') {
            steps {
                sh 'mvn -P metrics pmd:pmd'
            }
        }
        stage ('Unit  Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage ('Package') {
            steps {
                sh 'mvn package'
            }
        }
        stage ('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
        }
        stage ('Code Scan Report') {
            steps {
                //
                // This requires HTML Publisher plugin
                //
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'pmd.html', reportName: 'PMD Report', reportTitles: ''])
            }
        }
        stage ('Create the Docker Image') {
            steps {
                //
                // This requires HTML Publisher plugin
                sh 'docker build -t addressbook .'
            }
        }
        stage ('Push the Docker image to Docker Hub') {
            steps {
                //
                // This requires HTML Publisher plugin
                sh 'echo "Push"'
            }
        }
        stage ('Pull the Docker image from the Docker Hub') {
            steps {
                //
                // This requires HTML Publisher plugin
                sh 'echo "Pull"'
            }
        }
    }
}
