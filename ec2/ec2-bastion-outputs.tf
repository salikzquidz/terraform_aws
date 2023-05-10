output "ec2_bastion_publi_instance_ids" {
  description = "List of ids of instances"
  value = module.ec2_bastion_public.id
}

output "ec2_bastion_eip" {
  description = "Elastic IP associated with this ec2 instance"
  value = module.ec2_bastion_public.public_ip
}