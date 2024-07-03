terraform {
  backend "s3" {
    bucket = "log-terraform-cicd-primus-learning"
    region = "us-east-1"
    key = "eks/terraform.tfstate"
  }
}