#ec2
resource "aws_instance" "priv" {
  ami           = var.priv_instance_ami
  instance_type = var.priv_instance_type
  subnet_id = aws_subnet.priv.id
  vpc_security_group_ids = [aws_security_group.priv.id]
  key_name = aws_key_pair.global.key_name
  count = var.priv_instance_count
 tags = {
  team = var.team
 }
}

