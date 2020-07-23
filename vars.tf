variable "profile" {
  description = "profile aws-cli"
  default = "devops"
}
variable "region" {
  description = "region aws-cli"
  default = "eu-central-1"
}
variable "public_key_path" {
  description = "ssh pub-key"
  default = "~/.ssh/id_rsa.pub"
}
variable "instance_ami" {
  description = "aws ami instance id"
  default = "ami-0a02ee601d742e89f"
}
variable "instance_type" {
  description = "aws ec2 type"
  default = "t2.nano"
}

variable "instance_count" {
  description = "instance count"
  default = "1"
}
