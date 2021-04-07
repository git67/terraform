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

