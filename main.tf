# aws
provider "aws" {
  profile = "<your_profile>"
  region  = "eu-central-1"
}

# vpc
resource "aws_vpc" "vpc_devops" {
  cidr_block = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    server_type = var.server_type
  }
}


# public subnet to igw
resource "aws_subnet" "subnet_public_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    server_type = var.server_type
  }
}
