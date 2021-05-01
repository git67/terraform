variable "aws_cli_profile" {
  description = "aws profile"
  default = "<your aws cli profile>"
}

variable "aws_region" {
  description = "aws region"
  default = "eu-central-1"
}

variable "namespace" {
  description = "part of naming schema"
  default = "terraform_demo"
}
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
