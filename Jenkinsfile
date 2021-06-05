pipeline {
    agent any
    environment {
        // Store this credentials as secret token in Jenkins.
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('terraform version') {
            steps {
                script {
                    sh '~/terraform version'
                    sh '~/terraform init'
                    sh '~/terraform plan'
                }
            }
        }
    }
}