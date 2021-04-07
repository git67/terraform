output "pub_subnet" {
    value = join(" : ",[module.stack.pub_subnet_id, module.stack.pub_subnet_cidr_block])
}

output "pub_ec2_id" {
    value = module.stack.pub_ec2_id
}

output "pub_ec2_ip" {
    value = module.stack.pub_ec2_public_ip
}
