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
                target_directory = "${WORKSPACE}/infrastructure/environment/test"
            }
            steps {
                script {
                    sh 'bash -x ${WORKSPACE}/infrastructure/helpers/setup_terraform.sh'
                    sh '${WORKSPACE}/terraform version'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('TEST') {
            when {
                branch 'main'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/test"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('INTAKE') {
            when {
                branch 'intake'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/intake"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('DEV') {
            when {
                branch 'development'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/dev"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('UAT') {
            when {
                branch 'uat'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/uat"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('PROD') {
            when {
                branch 'production'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/prod"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}/*/; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
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