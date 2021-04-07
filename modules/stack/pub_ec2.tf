#ec2
resource "aws_instance" "pub" {
  ami           = var.pub_instance_ami
  instance_type = var.pub_instance_type
  subnet_id = aws_subnet.pub.id
  vpc_security_group_ids = [aws_security_group.pub.id]
  key_name = aws_key_pair.global.key_name
  count = var.pub_instance_count
 tags = {
  team = var.team
 }
}

