//public subnet to igw
resource "aws_subnet" "pub" {
  vpc_id = aws_vpc.global.id
  cidr_block = var.pub_subnet_cidr
  map_public_ip_on_launch = "true"
  availability_zone = var.pub_subnet_availability_zone
  tags = {
    Name = var.pub_subnet_name
    team = var.team
  }
}

