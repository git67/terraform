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
    Name = join("_",[var.team, "priv_ec2", count.index])
  }

  provisioner "local-exec" {
    command = <<-EOC
      /usr/bin/mkdir -p ${var.out_dir}
      [ -f ${var.out_dir}/hosts ] && /usr/bin/sed -i "/ ${self.tags["Name"]} /d" ${var.out_dir}/hosts
      /usr/bin/echo "${self.private_ip} ${self.tags["Name"]} ${self.private_dns} # only from inside the cloud accessible " >> ${var.out_dir}/hosts
    EOC
  }
}

