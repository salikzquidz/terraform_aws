# Terraform Block
terraform {
  required_version = "~> 1.4.6"
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">= 4.66.0"
    }  
  }
}

# Provider Block
provider "aws" {
  region = var.aws_region
  profile = "default"
}