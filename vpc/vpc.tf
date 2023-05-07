# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  # VPC Basic Details
  name = "vpc satu"
  cidr = "10.0.0.0/16"
  azs = ["ap-southeast-1a","ap-southeast-1b"]
  private_subnets = ["10.0.0.0/24","10.0.1.0/24"]
  public_subnets = ["10.0.100.0/24","10.0.101.0/24"]

# Database Subnets
  create_database_subnet_group = true
  create_database_subnet_route_table= true
  database_subnets = ["10.0.200.0/24","10.0.201.0/24"]

  # NAT Gateways - Outbound Communication
  enable_nat_gateway = true
  single_nat_gateway = true // nat gateway is expensive choi so only one is enough for two AZs

  # VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  public_subnet_tags = {
    Name = "public-subnets"
  }
  private_subnet_tags = {
    Name = "private-subnets"
  }
  database_subnet_tags = {
    Name = "database-subnets"
  }
  tags = {
    Owner = "Ahmad"
    Environment = "dev"
  }
  vpc_tags = {
    Name = "vpc-chapter-one"
  }
}