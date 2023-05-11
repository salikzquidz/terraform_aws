# Amazon Linux 2023 AMI
data "aws_ami" "al2023"  {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_instance" "foo" {
  ami = data.aws_ami.al2023.id
  instance_type = "t3.micro"

  tags = {
    Name = "foo-${terraform.workspace}"
  }
}