resource "aws_cloudwatch_metric_alarm" "cpuutilization" {
  count               =  length(var.subnet_cidrs) * var.instance_count
  alarm_name          = "${element(split(",", join(",", aws_instance.dev.*.id)), count.index)}-status-check"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "60"
  alarm_description   = "This metric monitors ec2 cpu utilization"

  dimensions = {
    InstanceId = element(aws_instance.dev.*.id, count.index)
  }
}

resource "aws_cloudwatch_metric_alarm" "statuscheckfailed" {
  count               =  length(var.subnet_cidrs) * var.instance_count
  alarm_name          = "${element(split(",", join(",", aws_instance.dev.*.id)), count.index)}-status-check"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = "This metric monitors ec2 status check."

  dimensions = {
    InstanceId = element(aws_instance.dev.*.id, count.index)
  }
}
