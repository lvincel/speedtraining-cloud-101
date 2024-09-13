terraform {
  required_version = "~>1.9.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.61.0"
    }
  }

  # change the backend accordingly to what
  backend "s3" {
    bucket         = "cloud-101-zenika-sg-speedtraining" # change this to the name of your bucket created
    key            = "dev/10-network/terraform.tfstate"  # key name can be anything
    region         = "ap-southeast-1"
    dynamodb_table = "cloud-101-zenika-dev-remote-iac-lock" # if dynamodb is used for state locking, indicate the table name
  }
}

provider "aws" {
  region = "ap-southeast-1"

  # nifty way to populate tags in your resources
  default_tags {
    tags = {
      Project-Name = "cloud-101 speedtraining"
      Terraform    = true
      Environment  = "dev"
    }
  }
}
