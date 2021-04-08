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


