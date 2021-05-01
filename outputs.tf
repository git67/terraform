output "vpc" {
  description = "vpc details"
  value       = aws_vpc.vpc_devops.*.Name
}