Terraform for setting up AWS

Terraform Best Practices

- Start every module with a main.tf file, where resources are located by default
- Group the resources logically in the same file

### Main path

- CHAPTER 1 : VPC 3-tier architecture - `vpc`
- CHAPTER 2 : EC2 bastion host, security group - `ec2`

### Exploration path

- EX-CHAPTER 1 : Terraform Cloud Getting Started - `tfc-getting-started`
- EX-CHAPTER 2 : Terraform Workspace with S3 bucket as backend- `tf-workspace-s3-test`
- EX-CHAPTER 3 : Terraform Workpsace with Terraform Cloud as backend - `tf-workspace-tfc-test`
- EX-CHAPTER 4 : EKS with Fargate - `ex-eks-fargate`
