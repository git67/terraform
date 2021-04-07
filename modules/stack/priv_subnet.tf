//private subnet 
resource "aws_subnet" "priv" {
  vpc_id = aws_vpc.global.id
  cidr_block = var.priv_subnet_cidr
  map_public_ip_on_launch = "false"
  availability_zone = var.priv_subnet_availability_zone
  tags = {
    Name = join("_",[var.team, "priv_subnet"])
    team = var.team
  }
}

