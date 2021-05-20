# aws profile/aws region
variable "profile" {
  type = string
  description = "profile aws-cli"
  default = "devops"
}
variable "region" {
  type = string
  description = "region aws-cli"
  default = "eu-central-1"
}
# globals
variable "out_dir" {
  type = string
  description = "output directory" 
  default = "./etc"
}

# naming
variable "namespace" {
  type = string
  description = "namespace for building unique name tags"
  default = "demo"
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
  default = "128.0.0.0/16"
}

# subnets (keep in mind the aws elb can't deal with multiple subnets in a av-zone)
variable "subnet_cidrs" {
  description = "pub_subnet_cidrs"
  type = list
  default = ["128.0.1.0/24", "128.0.2.0/24", "128.0.3.0/24"] 
}

# avz
variable "av_zones" {
  description = "used av zones"
	type = list
	default = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}

# ec2
variable "instance_ami" {
  type = string
  description = "aws ami - image id"
  default = "ami-0a02ee601d742e89f"
}

variable "instance_type" {
  type = string
  description = "aws ec2 type"
  default = "t2.nano"
}

variable "instance_count" {
  type = number
  description = "count of instances to build per subnet"
  default = 1
}

variable "cloud_init_script" {
  description = "first boot script"
  default = "scripts/pub_script.sh"
}
