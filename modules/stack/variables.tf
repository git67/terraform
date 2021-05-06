# aws profile/aws region
variable "profile" {
  description = "profile aws-cli"
  default = "devops"
}
variable "region" {
  description = "region aws-cli"
  default = "eu-central-1"
}
# globals
variable "out_dir" {
  description = "output directory" 
  default = "./etc"
}

# naming
variable "team" {
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
variable "vpc_name" {
  description = "vpc name -> build in main.tf"
  default = "NONE"
}

# name key pair
variable "keypair_name" {
  description = "name of ec2 keypair name -> build in main.tf"
  default = "NONE"
}

# subnets
variable "subnet_cidrs" {
  description = "pub_subnet_cidrs"
  type = list
  default = ["128.1.0.0/24", "128.2.0.0/24"] 
}

# avz
variable "av_zones" {
  description = "used av zones"
	type = list
	default = ["eu-central-1a", "eu-central-1b"]
}
