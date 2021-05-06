#internet gw
resource "aws_internet_gateway" "dev" {
  vpc_id = aws_vpc.dev.id
  tags = {
    namespace = var.namespace
    Name = join("_",[var.namespace, "igw"])
  }
}

