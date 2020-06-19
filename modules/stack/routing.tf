//routing table
resource "aws_route_table" "devops" {
  vpc_id = aws_vpc.devops.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.devops.id
    }
  tags = {
    server_type = var.server_type
    }
}

//add route to routing table
resource "aws_route_table_association" "devops" {
  subnet_id      = aws_subnet.devops.id
  route_table_id = aws_route_table.devops.id
}

