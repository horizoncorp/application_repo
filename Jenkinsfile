pipeline {
    agent any
    environment {
        // Store this credentials as secret token in Jenkins.
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('prework') {
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment"
            }
            steps {
                script {
                    sh 'bash -x ${WORKSPACE}/infrastructure/helpers/setup_terraform.sh'
                    sh '${WORKSPACE}/terraform version'
                    sh 'for dir in ${target_directory}/*/${ENVIRONMENT}/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/${ENVIRONMENT}/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('TEST') {
            when {
                branch 'main'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/test/${ENVIRONMENT}"
            }
            steps {
                script {
                    sh 'cd ${target_directory} && ${WORKSPACE}/terraform init'
                    sh 'cd ${target_directory} && ${WORKSPACE}/terraform plan'
                }
            }
        }
    }
    post{
        success{
            echo "========pipeline executed successfully========"
        }
        always{
            echo "========cleanup========"
            deleteDir()
        }
        failure{
            echo "========pipeline execution failed========"
        }
        unstable {
            echo "========I am unstable========"
        }
        changed {
            echo "========things were different before========"
        }
    }
}