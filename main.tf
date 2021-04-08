terraform {
  required_version = ">= 0.12"
}

#aws
provider "aws" {
  profile = var.profile
  region  = var.region
}

#vpc
module "stack" {
  source = "./modules/stack"

  vpc_name = join("_",[var.team, "vpc"])
  vpc_cidr = var.vpc_cidr
  team = var.team

  ssh_key_file = var.ssh_key_file
  keypair_name = join("_",[var.team, "keypair"])
  ssh_private_key_file = var.ssh_private_key_file

  pub_subnet_cidr = var.pub_subnet_cidr
  pub_subnet_availability_zone = var.pub_subnet_availability_zone
  pub_instance_ami = var.pub_instance_ami
  pub_instance_type = var.pub_instance_type
  pub_instance_count = var.pub_instance_count

  priv_subnet_cidr = var.priv_subnet_cidr
  priv_subnet_availability_zone = var.priv_subnet_availability_zone
  priv_instance_ami = var.priv_instance_ami
  priv_instance_type = var.priv_instance_type
  priv_instance_count = var.priv_instance_count
}
