locals {
  owners = var.business_division
  environment = var.environment
  company = var.company_name
  name = "${var.company_name}-${var.business_division}-${var.environment}"
  # name = "${local.owners}-${local.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
    company = local.company
  }
  eks_cluster_name = "${local.name}-${var.eks_cluster_name}"
}