//routing table
resource "aws_route_table" "pub" {
  vpc_id = aws_vpc.global.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.global.id
    }
  tags = {
    team = var.team
    }
}

//add route to routing table
resource "aws_route_table_association" "pub" {
  subnet_id      = aws_subnet.pub.id
  route_table_id = aws_route_table.pub.id
}

