resource "null_resource" "copy_ec2_keypair" {
    depends_on = [ module.ec2_bastion_public ]
    connection {
      type = "ssh"
      host = aws_eip.ec2_bastion_eip.public_ip
      user = "ec2-user" // default will be "root" for ssh
      password = ""
      private_key = file("private-key/chapter-two-eks-keypair.pem")
    }
    # File Provisioner: Copies the keypair to /tmp/eks-terraform-key.pem // use tmp folder since it has access to copy
    provisioner "file" {
      source = "private-key/chapter-two-eks-keypair.pem"
      destination = "/tmp/eks-terraform-keypair.pem"
    }
    # Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
    provisioner "remote-exec" {
      inline = [ 
        "sudo chmod 400 /tmp/eks-terraform-keypair.pem"
       ]
    }
    # Local Exec Provisioner:  local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource) // just for learning purposes
    provisioner "local-exec" {
      command = "echo VPC created on `date` and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
      working_dir = "local-exec-output-files"
    }
}