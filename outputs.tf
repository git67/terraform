output "vpc" {
  description = "vpc id"
  value       = aws_vpc.vpc_devops.id
}

output "vpc-info" {
    value = join(" : ",[aws_vpc.vpc_devops.id, aws_vpc.vpc_devops.tags_all["Name"]])
}
