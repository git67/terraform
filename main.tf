# aws
provider "aws" {
  profile = var.aws_cli_profile
  region  = var.aws_region
}

# vpc
resource "aws_vpc" "vpc_devops" {
  cidr_block = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = join("_",[var.namespace, "vpc"])
  }
}


# public subnet 
resource "aws_subnet" "subnet_public_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    Name = join("_",[var.namespace, "subnet"])
  }
}

