terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.66.0"
    }
  }
  # backend "s3" {
    # bucket = "salikzquidz-bucket-2"
    # key = "optionalfolder/terraform.tfstate"
    # region = "ap-southeast-1"
    # dynamodb_table = "tf-locks"
    # encrypt = true
    # profile = "default"
  # }
}

resource "aws_s3_bucket" "bucket-test" {
  bucket = "salikzquidz-bucket-2"
}

provider "aws" {
  region = "ap-southeast-1"
  profile = "default"
}