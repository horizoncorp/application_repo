pipeline {
    agent any
    environment {
        // Store this credentials as secret token in Jenkins.
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('prework') {
            steps {
                script {
                    sh 'bash -x ${WORKSPACE}/infrastructure/setup_terraform.sh'
                    sh '${WORKSPACE}/terraform version'
                }
            }
        }
        stage('TEST') {
            when {
                branch 'main'
            }
            steps {
                script {
                    sh '${WORKSPACE}/terraform plan ${WORKSPACE}/infrastructure/environment/test/*/'
                }
            }
        }
    }
}