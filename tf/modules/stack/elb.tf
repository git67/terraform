# elb
resource "aws_elb" "dev" {
  name = join("2",[var.namespace, "elb"])
  subnets = aws_subnet.dev.*.id
  security_groups = [aws_security_group.dev.id]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 8080
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8080/index.html"
    interval            = 30
  }

  instances                   = aws_instance.dev[*].id
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = join("_",[var.namespace, "elb"])
  }
}
