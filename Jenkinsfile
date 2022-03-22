pipeline {
    agent any
    tools {
        maven 'maven38'
    }
    stages{
        stage ('Get the source code') {
            steps {
                git branch: 'master', credentialsId: 'kumaraqua-github', url: 'https://github.com/kumaraqua/addressbook.git'
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
                publishHTML([allowMissing: false, alwaysLinkToLastBuild: false, keepAll: false, reportDir: 'target/site', reportFiles: 'pmd.html', reportName: 'PMD Report', reportTitles: ''])
            }
        }
    }
}
