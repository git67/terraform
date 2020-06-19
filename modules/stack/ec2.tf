//ec2
resource "aws_instance" "devops" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  subnet_id = aws_subnet.devops.id
  vpc_security_group_ids = [aws_security_group.devops.id]
  key_name = aws_key_pair.devops.key_name
  count = var.instance_count
 tags = {
  server_type = var.server_type
 }
}

