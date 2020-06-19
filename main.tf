//aws
provider "aws" {
  profile = var.profile
  region  = var.region
}

//vpc
module "stack" {
  source = "./modules/stack"

  vpc_name = "hs_test_vpc"
  vpc_cidr = "10.0.0.0/16"
  server_type = "hs_test"

  subnet_name = "hs_test_subnet"
  subnet_cidr = "10.0.1.0/24"
  subnet_availability_zone = "eu-central-1a"

  public_key_path= "~/.ssh/id_rsa.pub"
  keypair_name= "hs_test_keypair"

  instance_ami = "ami-0a02ee601d742e89f"
  instance_type = "t2.nano"
  instance_count = "10"
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
