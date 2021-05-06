#vpc
resource "aws_vpc" "global" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = join("_",[var.team, "vpc"])
    team = var.team
  }
}
