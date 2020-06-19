//security group
resource "aws_security_group" "devops" {
  name = "sg_devops"
  vpc_id = aws_vpc.devops.id
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    server_type = var.server_type
  }
}

