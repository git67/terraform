variable "vpc_name" {
  description = "name vpc"
  default     = "none"
}
variable "vpc_cidr" {
  description = "cidr vpc"
  default     = "0.0.0.0/0"
}
variable "server_type" {
  description = "server type tag"
  default     = "none"
}
variable "subnet_cidr" {
  description = "cidr subnet"
  default = "0.0.0./0"
}
variable "subnet_availability_zone" {
  description = "av-zone subnet"
  default = "none"
}
variable "subnet_name" {
  description = "name subnet"
  default     = "none"
}

variable "public_key_path" {
  description = "ssh pub-key"
  default = "none"
}
variable "keypair_name" {
  description = "keypair name"
  default = "none"
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
  default = "0"
}
