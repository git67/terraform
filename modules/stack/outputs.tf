//vpc
output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.devops.*.id, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.devops.*.cidr_block, [""])[0]
}

//subnet
output "subnet_id" {
  description = "The ID of the Subnet"
  value       = concat(aws_subnet.devops.*.id, [""])[0]

}
output "subnet_cidr_block" {
  description = "The CIDR block of the Subnet"
  value      = concat(aws_subnet.devops.*.cidr_block, [""])[0]
}

output "ec2_id" {
  description = "List of IDs of instances"
  value       = aws_instance.devops.*.id
}

output "ec2_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.devops.*.public_ip
}

