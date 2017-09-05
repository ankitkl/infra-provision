# Create a new load balancer
resource "aws_elb" "bar" {
  name               = "terraform-elb"
  subnets  = ["${aws_subnet.eu-west-1c-private.id}", "${aws_subnet.eu-west-1b-private.id}", "${aws_subnet.eu-west-1a-public.id}"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:22"
    interval            = 30
  }

  #instances                   = ["${aws_instance.web2.id}", "${aws_instance.web3.id}" , "${aws_instance.web1.id}"]
  instances                   = ["${aws_instance.web2.id}","${aws_instance.web1.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  security_groups = ["${aws_security_group.allow_all.id}"]
  tags {
    Name = "foobar-terraform-elb"
  }
}
