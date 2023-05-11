terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.60.0"
    }
  }
}

variable "aws_access_key_id" {
}

variable "aws_secret_access_key" {
}

provider "aws" {
 region = "ap-southeast-1"
 access_key = "${var.aws_access_key_id}"
 secret_key = "${var.aws_secret_access_key}"
 # profile = "default" // commented out because got bug which Terraform cannot detect the credentials located in /Users/salikz/.aws/credentials so I have to
 // provide access_key and secret_key
}