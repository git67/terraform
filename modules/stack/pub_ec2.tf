#ec2
locals {
  conn_data = {
    type        = "ssh",
    user        = "ec2-user",
    private_key = file(var.ssh_private_key_file),
  }
  out_dir = "./etc"
}

resource "aws_instance" "pub" {
  ami           = var.pub_instance_ami
  instance_type = var.pub_instance_type
  subnet_id = aws_subnet.pub.id
  vpc_security_group_ids = [aws_security_group.pub.id]
  key_name = aws_key_pair.global.key_name
  count = var.pub_instance_count
  tags = {
    team = var.team
    Name = join("_",[var.team, "pub_ec2", count.index])
  }

  provisioner "file" {
    source      = var.ssh_private_key_file
    destination = "~/.ssh/priv_ec2"

    connection {
      type        = local.conn_data.type
      user        = local.conn_data.user
      private_key = local.conn_data.private_key
      host        = self.public_dns
    }
  }

  provisioner "file" {
    source      = var.pub_script
    destination = "/tmp/pub_script.sh"

    connection {
      type        = local.conn_data.type
      user        = local.conn_data.user
      private_key = local.conn_data.private_key
      host        = self.public_dns
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 755 /tmp/pub_script.sh",
      "/tmp/pub_script.sh ~/.ssh/priv_ec2"
    ]  
    connection {
      type        = local.conn_data.type
      user        = local.conn_data.user
      private_key = local.conn_data.private_key
      host        = self.public_dns
    }
  }

  provisioner "local-exec" {
    command = <<-EOC
      /usr/bin/mkdir -p ${local.out_dir}
      /usr/bin/echo "${self.public_ip} ${self.tags["Name"]} ${self.public_dns" >> ${local.out_dir}/hosts
    EOC
  }
}

