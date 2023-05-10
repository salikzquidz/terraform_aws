variable "instance_type" {
    default = "t3.micro"
}

variable "instance_keypair" {
    default = "chapter-two-eks-keypair" // find this value in created keypair in amazon console
}