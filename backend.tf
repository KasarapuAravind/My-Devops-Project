terraform {
  backend "s3" {
    bucket = "my-terraform-eks-setup-bkt"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "my-terraform-eks-lock-table"
    
  }
}