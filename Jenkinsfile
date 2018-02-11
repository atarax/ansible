pipeline {
  agent any
  stages {
    stage('error') {
      steps {
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable \
                /rbl-control -r "eu-west-1" -c create && \
              docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable \
                /rbl-control -r "eu-west-3" -c create && 
              docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable \
                /rbl-control -r "eu-central-1" -c create'''
      }
    }
  }
}