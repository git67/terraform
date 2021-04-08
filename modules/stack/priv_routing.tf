#routing table
resource "aws_route_table" "priv" {
  vpc_id = aws_vpc.global.id
  tags = {
    team = var.team
    Name = join("_",[var.team, "priv_rtb"])
    }
}

#add route to routing table
resource "aws_route_table_association" "priv" {
  subnet_id      = aws_subnet.priv.id
  route_table_id = aws_route_table.priv.id
}

