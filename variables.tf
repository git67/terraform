variable "profile" {
  description = "profile aws-cli"
  default = "default"
}
variable "region" {
  description = "region aws-cli"
  default = "eu-central-1"
}
variable "server_type" {
  description = "type of ec2_instance"
  default = "demo"
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

variable "vpc_cidr" {
  description = "vpc_cidr"
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "subnet_cidr"
  default = "10.0.1.0/24"
}

variable "subnet_availability_zone" {
  description = "subnet_availability_zone"
  default = "eu-central-1a"
}
