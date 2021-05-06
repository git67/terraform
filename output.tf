output "vpc-info" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block, module.stack.vpc_tags_all["Name"]])
}

output "subnets" {
    value = module.stack.subnet_cidr_blocks
}

output "pub_ec2_public_ip" {
    value = module.stack.ec2_public_ip
}

output "elb_fqdn" {
    value = module.stack.elb_fqdn
}
