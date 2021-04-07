# globals
# naming
variable "team" {
  description = "team name"
  default = "ec3"
}
variable "ssh_key_file" {
  description = "ssh pub-key file"
  default = "~/.ssh/id_rsa.pub"
}


# vpc
variable "vpc_cidr" {
  description = "vpc_cidr"
  default = "10.0.0.0/16"
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



# public
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
  default = "10.0.1.0/24"
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
  default = "10.0.2.0/24"
}

variable "priv_subnet_availability_zone" {
  description = "priv_subnet_availability_zone"
  default = "eu-central-1a"
}
