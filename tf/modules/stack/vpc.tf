#vpc
resource "aws_vpc" "dev" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = join("_",[var.namespace, "vpc"])
  }
}
