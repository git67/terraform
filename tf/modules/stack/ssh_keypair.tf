#keypair to use by ec2-user
resource "aws_key_pair" "dev" {
  key_name = join("_",[var.namespace, "ssh_keypair"])
  public_key = file(var.ssh_credentials["pub_key"])
}

