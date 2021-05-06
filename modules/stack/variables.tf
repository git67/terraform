# aws profile/aws region
variable "profile" {
  type = string
  description = "profile aws-cli"
  default = "NONE"
}
variable "region" {
  type = string
  description = "region aws-cli"
  default = "NONE"
}
# globals
variable "out_dir" {
  type = string
  description = "output directory" 
  default = "NONE"
}

# naming
variable "namespace" {
  type = string
  description = "namespace for building unique name tags"
  default = "NONE"
}

# ssh stuff
variable "ssh_credentials" {
  description = "ssh key files"
  type = map
  default = {
    "pub_key"  = "~/.ssh/id_rsa.pub"
    "priv_key"  = "~/.ssh/id_rsa"
  }
}

# vpc
variable "vpc_cidr" {
  description = "vpc_cidr"
  default = "NONE"
}

# subnets (keep in mind the aws elb can't deal with multiple subnets in a av-zone)
variable "subnet_cidrs" {
  description = "pub_subnet_cidrs"
  type = list
  default = ["NONE"] 
}

# avz
variable "av_zones" {
  description = "used av zones"
	type = list
	default = ["NONE"]
}

# ec2
variable "instance_ami" {
  type = string
  description = "aws ami - image id"
  default = "NONE"
}

variable "instance_type" {
  type = string
  description = "aws ec2 type"
  default = "NONE"
}

variable "add_instance_count" {
  type = number
  description = "count of addional build instances"
  default = 0
}

variable "cloud_init_script" {
  description = "first boot script"
  default = "NONE"
}
