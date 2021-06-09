pipeline {
    agent any
    environment {
        // Store this credentials as secret token in Jenkins.
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    stages {
        stage('input') {
            steps {
                script {
                    // Define Variable
                    def USER_INPUT = input(
                        message: 'Region?',
                        parameters: [
                                [$class: 'ChoiceParameterDefinition',
                                choices: ['agcs','spain'].join('\n'),
                                name: 'input',
                                description: 'Menu - select box option']
                        ]
                    )
                    echo "The answer is: ${USER_INPUT}"

                    if( "${USER_INPUT}" == "yes"){
                        //do something
                    } else {
                        //do something else
                    }
                }
            }
        }
        stage('prework') {
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/*/${USER_INPUT}"
            }
            steps {
                script {
                    sh 'bash -x ${WORKSPACE}/infrastructure/helpers/setup_terraform.sh'
                    sh '${WORKSPACE}/terraform version'
                    sh 'for dir in ${target_directory}; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('TEST') {
            when {
                branch 'main'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/test/${USER_INPUT}"
            }
            steps {
                script {
                    sh 'for dir in ${target_directory}; do (cd "$dir" && ${WORKSPACE}/terraform init); done'
                    sh 'for dir in ${target_directory}; do (cd "$dir" && ${WORKSPACE}/terraform plan); done'
                }
            }
        }
        stage('INTAKE') {
            when {
                branch 'intake'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/intake/${USER_INPUT}"
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
                branch 'dev'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/dev/${USER_INPUT}"
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
                target_directory = "${WORKSPACE}/infrastructure/environment/uat/${USER_INPUT}"
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
                branch 'prod'
            }
            environment {
                target_directory = "${WORKSPACE}/infrastructure/environment/prod/${USER_INPUT}"
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