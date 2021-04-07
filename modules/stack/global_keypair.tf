//keypair to use ec2-user
resource "aws_key_pair" "global" {
  key_name = var.keypair_name
  public_key = file(var.ssh_key_file)
}

