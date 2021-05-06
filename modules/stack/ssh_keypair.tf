#keypair to use by ec2-user
resource "aws_key_pair" "global" {
  key_name = join("_",[var.team, "ssh_keypair"])
  public_key = file(var.ssh_key_file)
}

