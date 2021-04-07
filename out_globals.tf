output "vpc" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block])
}

