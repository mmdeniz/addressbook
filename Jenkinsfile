pipeline {
    agent any
    
    environment {
		DOCKERHUB_CREDENTIALS=credentials('sl-2-pr-2-Jenkins')
    }
    
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
        stage ('Build the Docker Image') {
            steps {
                //
                // 
                sh 'docker build -t mmdeniz/addressbook:1.0 .'
            }
        }
        
	stage('Login to Docker Hub') {

		steps {
			sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
		}
	}
        
        stage ('Push the Docker image to Docker Hub') {
            steps {
                //
                // 
                // sh 'docker push mmdeniz/addressbook:1.0'
            }
        }
        stage ('Pull the Docker image from the Docker Hub') {
            steps {
                //
                // 
                sh 'echo "Pull"'
            }
        }


    }
}
