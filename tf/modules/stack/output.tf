output "vpc_id" {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.dev.*.id, [""])[0]
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = concat(aws_vpc.dev.*.cidr_block, [""])[0]
}

output "vpc_tags_all" {
  description = "A map of tags assigned to the resource"
  value       = aws_vpc.dev.tags_all
}
output "subnet_ids" {
  description = "The ID(s) of the Subnet"
  value       = aws_subnet.dev.*.id

}
output "subnet_cidr_blocks" {
  description = "The CIDR block of the Subnet"
  value      = aws_subnet.dev.*.cidr_block
}

output "ec2_public_ips" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.dev.*.public_ip
}

output "ec2_public_fqdns" {
  description = "List of public fqdns of ec2 instances"
  value       = aws_instance.dev.*.public_dns
}

output "elb_fqdn" {
  description = "elp endpoint fqdn"
  value = aws_elb.dev.dns_name
}
