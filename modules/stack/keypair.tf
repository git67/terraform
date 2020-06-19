//keypair to use ec2-user
resource "aws_key_pair" "devops" {
  key_name = var.keypair_name
  public_key = file(var.public_key_path)
}

