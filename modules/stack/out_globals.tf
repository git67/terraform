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
