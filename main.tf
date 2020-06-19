//aws
provider "aws" {
  profile = "<your_profile>"
  region  = "eu-central-1"
}

//vpc
resource "aws_vpc" "vpc_devops" {
  cidr_block = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    server_type = var.server_type
  }
}

//internet gw
resource "aws_internet_gateway" "igw_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  tags = {
    server_type = var.server_type
  }
}

//public subnet to igw
resource "aws_subnet" "subnet_public_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  cidr_block = var.cidr_subnet
  map_public_ip_on_launch = "true"
  availability_zone = var.availability_zone
  tags = {
    server_type = var.server_type
  }
}

//routing table
resource "aws_route_table" "rtb_public_devops" {
  vpc_id = aws_vpc.vpc_devops.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_devops.id
    }
  tags = {
    server_type = var.server_type
    }
}

//add route to routing table
resource "aws_route_table_association" "rta_subnet_public_devops" {
  subnet_id      = aws_subnet.subnet_public_devops.id
  route_table_id = aws_route_table.rtb_public_devops.id
}

//security group
resource "aws_security_group" "sg_devops" {
  name = "sg_devops"
  vpc_id = aws_vpc.vpc_devops.id
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    server_type = var.server_type
  }
}

//keypair to use ec2-user
resource "aws_key_pair" "ec2key_devops" {
  key_name = "keypair_devops"
  public_key = file(var.public_key_path)
}

//ec2
resource "aws_instance" "ec2_devops" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.subnet_public_devops.id
  vpc_security_group_ids = [aws_security_group.sg_devops.id]
  key_name = aws_key_pair.ec2key_devops.key_name
  count = var.instance_count
 tags = {
  server_type = var.server_type
 }
}
