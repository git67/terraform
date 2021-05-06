#public subnet(s)
resource "aws_subnet" "dev" {
  vpc_id = aws_vpc.dev.id
  count = length(var.subnet_cidrs) 

  availability_zone = element(var.av_zones,count.index)

  cidr_block = element(var.subnet_cidrs,count.index)

  map_public_ip_on_launch = "true"
  tags = {
    Name = join("_",[var.namespace, "subnet", count.index])
    namespace = var.namespace
  }
}
