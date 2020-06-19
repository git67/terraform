output "id" {
  description = "List of IDs of instances"
  value       = aws_instance.ec2_devops.*.id
}

output "arn" {
  description = "List of ARNs of instances"
  value       = aws_instance.ec2_devops.*.arn
}

output "availability_zone" {
  description = "List of availability zones of instances"
  value       = aws_instance.ec2_devops.*.availability_zone
}

output "key_name" {
  description = "List of key names of instances"
  value       = aws_instance.ec2_devops.*.key_name
}

output "public_dns" {
  description = "List of public DNS names assigned to the instances. For EC2-VPC, ec2_devops is only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.ec2_devops.*.public_dns
}

output "primary_network_interface_id" {
  description = "List of IDs of the primary network interface of instances"
  value       = aws_instance.ec2_devops.*.primary_network_interface_id
}

output "private_dns" {
  description = "List of private DNS names assigned to the instances. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = aws_instance.ec2_devops.*.private_dns
}

output "private_ip" {
  description = "List of private IP addresses assigned to the instances"
  value       = aws_instance.ec2_devops.*.private_ip
}

output "vpc_security_group_ids" {
  description = "List of associated security groups of instances, if running in non-default VPC"
  value       = aws_instance.ec2_devops.*.vpc_security_group_ids
}

output "subnet_id" {
  description = "List of IDs of VPC subnets of instances"
  value       = aws_instance.ec2_devops.*.subnet_id
}

output "instance_state" {
  description = "List of instance states of instances"
  value       = aws_instance.ec2_devops.*.instance_state
}

output "root_block_device_volume_ids" {
  description = "List of volume IDs of root block devices of instances"
  value       = [for device in aws_instance.ec2_devops.*.root_block_device : device.*.volume_id]
}

output "tags" {
  description = "List of tags of instances"
  value       = aws_instance.ec2_devops.*.tags
}

output "instance_count" {
  description = "Number of instances to launch specified as argument to ec2_devops module"
  value       = var.instance_count
}

output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = aws_instance.ec2_devops.*.public_ip
}
