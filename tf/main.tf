# version/local backend
terraform {
  required_version = ">= 0.12"
  backend "local" {
    path = "state/terraform.tfstate"
  }
}

# aws client
provider "aws" {
  profile = var.profile
  region  = var.region
}

# module call
module "stack" {
  source = "./modules/stack"

  vpc_cidr = var.vpc_cidr

  subnet_cidrs = var.subnet_cidrs
  av_zones = var.av_zones

  namespace = var.namespace

  ssh_credentials = var.ssh_credentials

  ec2 = var.ec2
}
