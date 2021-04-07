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

