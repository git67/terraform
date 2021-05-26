# ec2
resource "aws_instance" "dev" {
  ami           = var.ec2["instance_ami"]
  instance_type = var.ec2["instance_type"]

  count = length(var.subnet_cidrs) * var.ec2["instance_count"]
  #subnet_id = element(aws_subnet.dev.*.id,count.index)
  subnet_id = element(aws_subnet.dev[*].id,count.index)

  vpc_security_group_ids = [aws_security_group.dev.id]
  key_name = aws_key_pair.dev.key_name

  ebs_block_device {
    device_name = var.ec2["ebs_device"]
    volume_type = var.ec2["ebs_vol_type"]
    volume_size = var.ec2["ebs_vol_size"]
  }

  tags = {
    Name = join("_",[var.namespace, "ec2", count.index, element(var.av_zones,count.index) ])
  }
}

