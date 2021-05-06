# local backend
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
  out_dir = var.out_dir

  ssh_credentials = var.ssh_credentials

  instance_ami = var.instance_ami
  instance_type = var.instance_type
  add_instance_count = var.add_instance_count
  cloud_init_script = var.cloud_init_script
}
