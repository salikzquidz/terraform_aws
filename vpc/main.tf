terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = ">= 4.66.0"
    }
  }
}

provider "aws" {
  region = var.default_region
  profile = "default"
}