# Define Local Values in Terraform
locals {
  environment = var.env
  name = "${var.env}"
  #name = "${local.owners}-${local.environment}"
  common_tags = {
    environment = local.environment
    Terraform = "true"
  }
} 