pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
    AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
  }

  agent any
  stages {
    stage('error') {
      steps {
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c create            
              '''
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-3" -c create            
              '''
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-central-1" -c create            
              '''

        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c destroy            
              '''
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-3" -c destroy            
              '''
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-central-1" -c destroy            
              '''
      }
    }
  }
}