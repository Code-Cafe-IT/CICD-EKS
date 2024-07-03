#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('kubernetes') {
                        sh "aws configure"
                        sh "AWS_ACCESS_KEY_ID"
                        sh "AWS_SECRET_ACCESS_KEY"
                        sh "AWS_DEFAULT_REGION"
                        sh "JSON"
                        sh "aws eks update-kubeconfig --region us-east-1 --name myapp-eks-cluster --profile duclm3"
                        sh "cat /var/lib/jenkins/.kube/config"
                        sh "kubectl apply -f nginx-deployment.yaml"
                        sh "kubectl apply -f nginx-service.yaml"
                    }
                }
            }
        }
    }
}