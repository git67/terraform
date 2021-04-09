output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.global.*.id, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.global.*.cidr_block, [""])[0]
}

output "vpc_tags_all" {
  description = "A map of tags assigned to the resource"
  value       = aws_vpc.global.tags_all
}
output "pub_subnet_id" {
  description = "The ID of the Subnet"
  value       = concat(aws_subnet.pub.*.id, [""])[0]

}
output "pub_subnet_cidr_block" {
  description = "The CIDR block of the Subnet"
  value      = concat(aws_subnet.pub.*.cidr_block, [""])[0]
}

output "pub_ec2_id" {
  description = "List of IDs of instances"
  value       = aws_instance.pub.*.id
}

output "pub_ec2_public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.pub.*.public_ip
}

output "priv_subnet_id" {
  description = "The ID of the Subnet"
  value       = concat(aws_subnet.priv.*.id, [""])[0]

}
output "priv_subnet_cidr_block" {
  description = "The CIDR block of the Subnet"
  value      = concat(aws_subnet.priv.*.cidr_block, [""])[0]
}

output "priv_ec2_id" {
  description = "List of IDs of instances"
  value       = aws_instance.priv.*.id
}

output "priv_ec2_private_ip" {
  description = "List of private IP addresses assigned to the instances, if applicable"
  value       = aws_instance.priv.*.private_ip
}

