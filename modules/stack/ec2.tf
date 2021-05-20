# ec2
resource "aws_instance" "dev" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  count = length(var.subnet_cidrs) * var.instance_count
  subnet_id = element(aws_subnet.dev.*.id,count.index)
  vpc_security_group_ids = [aws_security_group.dev.id]
  key_name = aws_key_pair.dev.key_name
  user_data = file(var.cloud_init_script)
  tags = {
    Name = join("_",[var.namespace, "ec2", count.index, element(var.av_zones,count.index) ])
  }
}
