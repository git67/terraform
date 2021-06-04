# aws profile/aws regions aa
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

# naming
variable "namespace" {
  type = string
  description = "namespace for building unique name tags"
  default = "hsdeployment"
}

# ssh stuff
variable "ssh_credentials" {
  description = "ssh key files"
  type = map
  default = {
    "pub_key"  = "./files/keys/ec2-user.pub"
    "priv_key"  = "./files/keys/ec2-user"
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
variable "ec2" {
  description = "ec2 attributes"
  type = map
  default = {
    "instance_ami"  = "ami-0a02ee601d742e89f"
    "instance_type"  = "t2.nano"
    "instance_count" = 4
    "ebs_device" = "/dev/sdb"
    "ebs_vol_size" = 1
    "ebs_vol_type" = "gp2"
    "cloud_init_file" = "./files/cloud_init/cloud_init_ansible_user.yml"
  }
}

# ansible
variable "ansible" {
  description = "ansible attributes"
  type = map
  default = {
    "ansible_inv_template"  = "./files/templates/ansible_inventory.template"
    "ansible_inv"  = "../ansible/inventories/inventory"
  }
}

