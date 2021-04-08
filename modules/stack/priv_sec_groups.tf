//security group
resource "aws_security_group" "priv" {
  name = join("_",[var.team, "sg_priv"])
  vpc_id = aws_vpc.global.id
  ingress {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port   = 8
      to_port     = 0
      protocol    = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
  }
 egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    team = var.team
    Name = join("_",[var.team, "sg_priv"])
  }
}

