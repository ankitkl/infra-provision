output "ip" {
  value = "${aws_elb.bar.dns_name}"
}
