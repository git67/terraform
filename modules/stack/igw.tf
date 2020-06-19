//internet gw
resource "aws_internet_gateway" "devops" {
  vpc_id = aws_vpc.devops.id
  tags = {
    server_type = var.server_type
  }
}

