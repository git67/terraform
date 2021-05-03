variable "aws_cli_profile" {
  description = "aws profile"
  default     = "devops"
}

variable "aws_region" {
  description = "aws region"
  default     = "eu-central-1"
}

variable "namespace" {
  description = "part of naming schema"
  default     = "terraform_demo"
}
variable "cidr_vpc" {
  description = "cidr vpc"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "cidr subnet"
  default     = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "av-zone subnet"
  default     = "eu-central-1a"
}


# aws
provider "aws" {
  profile = var.aws_cli_profile
  region  = var.aws_region
}

# vpc
resource "aws_vpc" "vpc_devops" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = join("_", [var.namespace, "vpc"])
  }
}


# public subnet 
resource "aws_subnet" "subnet_public_devops" {
  vpc_id                  = aws_vpc.vpc_devops.id
  cidr_block              = var.cidr_subnet
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone
  tags = {
    Name = join("_", [var.namespace, "subnet"])
  }
}

output "vpc" {
  description = "vpc id"
  value       = aws_vpc.vpc_devops.id
}

output "vpc-info" {
  value = join(" : ", [aws_vpc.vpc_devops.id, aws_vpc.vpc_devops.tags_all["Name"]])
}
