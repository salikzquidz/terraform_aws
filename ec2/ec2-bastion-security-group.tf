module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.2"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group for SSH port open for everybody (IPv4 CIDR), egress port are all world open"
  vpc_id      = module.vpc.vpc_id # only can be known after vpc is created so we can get this from vpc-outputs.tf
  
  # Ingress rules and CIDR blocks
  ingress_rules = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  # Egress rules - all-all open
  egress_rules = ["all-all"]

  tags = local.common_tags
}