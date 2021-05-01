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
