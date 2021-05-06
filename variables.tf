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
variable "team" {
  type = string
  description = "team name"
  default = "ec3"
}

variable "ssh_key_file" {
  description = "ssh pub-key file"
  default = "~/.ssh/id_rsa.pub"
}
variable "ssh_private_key_file" {
  description = "ssh private key file"
  default = "~/.ssh/id_rsa"
}


# vpc
variable "vpc_cidr" {
  description = "vpc_cidr"
  default = "128.0.0.0/16"
}

# subnets
variable "subnet_cidrs" {
  description = "pub_subnet_cidrs"
  type = list
  default = ["128.0.1.0/24", "128.0.2.0/24"] 
}

# avz
variable "av_zones" {
  description = "used av zones"
	type = list
	default = ["eu-central-1a", "eu-central-1b"]
}























# public
variable "pub_script" {
  description = "first boot script"
  default = "scripts/pub_script.sh"
}
variable "pub_instance_ami" {
  description = "pub_aws ami - image id"
  default = "ami-0a02ee601d742e89f"
}
variable "pub_instance_type" {
  description = "pub_aws ec2 type"
  default = "t2.nano"
}
variable "pub_instance_count" {
  description = "pub_instance count"
  default = "1"
}
variable "pub_subnet_cidr" {
  description = "pub_subnet_cidr"
  default = "128.0.0.0/19"
}
variable "pub_subnet_availability_zone" {
  description = "pub_subnet_availability_zone"
  default = "eu-central-1a"
}


# private
variable "priv_instance_ami" {
  description = "priv_aws ami - image id"
  default = "ami-0a02ee601d742e89f"
}
variable "priv_instance_type" {
  description = "priv_aws ec2 type"
  default = "t2.nano"
}

variable "priv_instance_count" {
  description = "priv_instance count"
  default = "1"
}

variable "priv_subnet_cidr" {
  description = "priv_subnet_cidr"
  default = "128.0.32.0/19"
}

variable "priv_subnet_availability_zone" {
  description = "priv_subnet_availability_zone"
  default = "eu-central-1a"
}
