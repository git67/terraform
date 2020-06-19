//public subnet to igw
resource "aws_subnet" "devops" {
  vpc_id = aws_vpc.devops.id
  cidr_block = var.subnet_cidr
  map_public_ip_on_launch = "true"
  availability_zone = var.subnet_availability_zone
  tags = {
    Name = var.subnet_name
    server_type = var.server_type
  }
}

