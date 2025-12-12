pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        checkout([$class: 'GitSCM', 
          branches: [[name: '*/main']], 
          userRemoteConfigs: [[url: 'https://github.com/Bindas69/terraform-labs.git']]
        ])
      }
    }
    
    stage('Terraform Init') {
      steps {
        bat 'terraform init'
      }
    }
    
    stage('Terraform Plan') {
      steps {
        bat 'terraform plan'
      }
    }
    
    stage('Terraform Apply') {
      steps {
        bat 'terraform apply -auto-approve'
      }
    }
  }
}
