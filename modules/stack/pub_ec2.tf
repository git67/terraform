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
  Name = join("_",[var.team, "pub_ec2", count.index])
 }

 provisioner "file" {
  source      = var.ssh_private_key_file
  destination = "~/.ssh/priv_ec2"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.ssh_private_key_file)
    host        = self.public_dns
   }
  }

 provisioner "file" {
  source      = var.pub_script
  destination = "/tmp/pub_script.sh"

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.ssh_private_key_file)
    host        = self.public_dns
   }
  }

 provisioner "remote-exec" {
   inline = [
      "chmod 755 /tmp/pub_script.sh",
      "/tmp/pub_script.sh"
   ]
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file(var.ssh_private_key_file)
    host        = self.public_dns
   }
 }
}

