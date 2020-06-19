
//vpc
resource "aws_vpc" "devops" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
    server_type = var.server_type
  }
}
