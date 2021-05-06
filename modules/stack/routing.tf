# create routing table
resource "aws_route_table" "global" {
  vpc_id = aws_vpc.global.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.global.id
    }
  tags = {
    team = var.team
    Name = join("_",[var.team, "global_rtb"])
    }
}

# associate table to subnet(s)
resource "aws_route_table_association" "global" {
  count = length(var.subnet_cidrs)
  subnet_id      = element(aws_subnet.global.*.id, count.index)
  route_table_id = aws_route_table.global.id
}

