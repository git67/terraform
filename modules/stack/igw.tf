#internet gw
resource "aws_internet_gateway" "global" {
  vpc_id = aws_vpc.global.id
  tags = {
    team = var.team
    Name = join("_",[var.team, "igw"])
  }
}

