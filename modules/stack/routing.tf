# create routing table
resource "aws_route_table" "dev" {
  vpc_id = aws_vpc.dev.id
  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
  tags = {
    Name = join("_",[var.namespace, "dev_rtb"])
    }
}

# associate table to subnet(s)
resource "aws_route_table_association" "dev" {
  count = length(var.subnet_cidrs)
  subnet_id      = element(aws_subnet.dev.*.id, count.index)
  route_table_id = aws_route_table.dev.id
}

