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
