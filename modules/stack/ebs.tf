# ebs
resource "aws_ebs_volume" "dev" {
  count = length(var.av_zones) * var.instance_count

  availability_zone = element(var.av_zones,count.index)
  size              = 1
  tags = {
    Name = join("_",[var.namespace, "ebs", count.index, element(var.av_zones,count.index) ])
  }

}

resource "aws_volume_attachment" "dev" {
  count = length(var.av_zones) * var.instance_count

  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.dev[count.index].id
  instance_id = aws_instance.dev[count.index].id
}
