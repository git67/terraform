variable "cidr_vpc" {
  description = "cidr vpc"
  default = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "cidr subnet"
  default = "10.1.0.0/24"
}
variable "availability_zone" {
  description = "av-zone subnet"
  default = "eu-central-1a"
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
variable "server_type" {
  description = "server type tag"
  default = "devops"
}

variable "instance_count" {
  description = "instance count"
  default = "10"
}
