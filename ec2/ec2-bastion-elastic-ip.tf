# Create elastic IP for ec2 bastion host
# Resource - depends_on meta argument

resource "aws_eip" "ec2_bastion_eip" {
    depends_on = [module.vpc, module.ec2_bastion_public] // create eip only after ec2 and vpc are created

    instance = module.ec2_bastion_public.id
    vpc = true

    tags = local.common_tags
}