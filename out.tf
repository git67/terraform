output "vpc-info" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block, module.stack.vpc_tags_all["Name"]])
}

#output "pub_subnet" {
#    value = join(" : ",[module.stack.pub_subnet_id, module.stack.pub_subnet_cidr_block])
#}

#output "pub_ec2_id" {
#    value = module.stack.pub_ec2_id
#}

#locals {
#    pub_ip = join(",",module.stack.pub_ec2_public_ip)
#}

output "public-ip-address" {
    value = module.stack.pub_ec2_public_ip
}
#output "priv_subnet" {
#    value = join(" : ",[module.stack.priv_subnet_id, module.stack.priv_subnet_cidr_block])
#}

#output "priv_ec2_id" {
#    value = module.stack.priv_ec2_id
#}

#locals {
#    priv_ip = join(",",module.stack.priv_ec2_private_ip)
#}

output "private-ip-address" {
    value = module.stack.priv_ec2_private_ip
}


