terraform {
  required_version = ">= 0.12"
}

//aws
provider "aws" {
  profile = var.profile
  region  = var.region
}

//vpc
module "stack" {
  source = "./modules/stack"

  vpc_name = join("_",[var.server_type, "vpc"])
  vpc_cidr = var.vpc_cidr
  server_type = var.server_type

  subnet_name = join("_",[var.server_type, "subnet"])
  subnet_cidr = var.subnet_cidr
  subnet_availability_zone = var.subnet_availability_zone

  public_key_path= var.public_key_path
  keypair_name= join("_",[var.server_type, "keypair"])

  instance_ami = var.instance_ami
  instance_type = var.instance_type
  instance_count = var.instance_count
}

output "vpc" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block])
}

output "subnet" {
    value = join(" : ",[module.stack.subnet_id, module.stack.subnet_cidr_block])
}

output "ec2_id" {
    value = module.stack.ec2_id
}

output "ec2_ip" {
    value = module.stack.ec2_public_ip
}
