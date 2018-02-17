pipeline {
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub_credentials')
    AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
    AWS_SECRET_ACCESS_KEY = credentials('aws_secret_access_key')
    ANSIBLE_INVENTORY_FILE = '/etc/ansible/hosts'
  }

  agent any
  stages {
    stage('Create Infrastructure') {
      agent {
        docker {
          image: 'docker'
        }
      }
      steps {
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/master.inv'
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-3" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/node_1.inv'
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-central-1" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/node_2.inv'        
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c destroy            
              '''
        sh 'echo "[k8l_master]" >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/master.inv >> $ANSIBLE_INVENTORY_FILE'
        sh 'echo "[k8l_node]" >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/node_1.inv >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/node_2.inv >> $ANSIBLE_INVENTORY_FILE'
        sh '''ansible-playbook \
                -i $ANSIBLE_INVENTORY_FILE 
                provision_aws.yaml 
                k8l_setup.yaml
                k8l_addons.yaml
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
  stage('Create Infrastructure') {
      agent {
        docker {
          image: 'ansible/ansible'
        }
      }
      steps {
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/master.inv'
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-3" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/node_1.inv'
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-central-1" -c create            
              '''
        sh 'cat /tmp/inventory > /tmp/node_2.inv'        
        sh '''docker run \
                -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
                -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
                atarax/rbl-control:stable /rbl-control -r "eu-west-1" -c destroy            
              '''
        sh 'echo "[k8l_master]" >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/master.inv >> $ANSIBLE_INVENTORY_FILE'
        sh 'echo "[k8l_node]" >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/node_1.inv >> $ANSIBLE_INVENTORY_FILE'
        sh 'cat /tmp/node_2.inv >> $ANSIBLE_INVENTORY_FILE'
        sh '''ansible-playbook \
                -i $ANSIBLE_INVENTORY_FILE 
                provision_aws.yaml 
                k8l_setup.yaml
                k8l_addons.yaml
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