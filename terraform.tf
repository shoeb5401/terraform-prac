terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.6.0"
    }

  }
  backend "s3" {
    region = "ap-south-1"
    bucket = "terraform-state-lock-3084"
    dynamodb_table = "terraform-state-dynamo-table"
    key = "terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-south-1"
}