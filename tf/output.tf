output "vpc-info" {
    value = join(" : ",[module.stack.vpc_id, module.stack.vpc_cidr_block, module.stack.vpc_tags_all["Name"]])
}

output "subnets" {
    value = module.stack.subnet_cidr_blocks
}

output "pub_ec2_public_ips" {
    value = module.stack.ec2_public_ips
}

output "elb_fqdn" {
    value = module.stack.elb_fqdn
}

output "ec2_public_fqdns" {
    value = module.stack.ec2_public_fqdns
}

resource "local_file" "inventory" {
  content = templatefile("./templates/ansible_inventory.template",
    {
      group_name = var.namespace
      public_ips = module.stack.ec2_public_ips
      public_fqdns = module.stack.ec2_public_fqdns
    } 
  )
  filename = "../ansible/inventories/inventory"
}
