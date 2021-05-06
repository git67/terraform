output "vpc-info" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block, module.stack.vpc_tags_all["Name"]])
}

output "subnets" {
    value = module.stack.subnet_cidr_blocks
}

