/*
Key_creation
*/
resource "aws_key_pair" "deployer" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDHmW9HaaSGba+lroXeDLn5Xdpv3EvH5eirbBBroATeYnewAHwI98XkeSFpj6cnV6Fkx0rAamh+R/S8BWKvJUvcFPqV8R62UynWST22meQMJA06/A59Hk9Qlx5Cp+UIl1JX7TzqvVTzLc1gg8PTbnj4baYSjK64aJ59Iz2/x+VpoIJx1Dbb3djZkPBng6CXluNhFSSNC4sZp1gy+MeWNWljhRZGU2VLHolRZUImo6lPNoqtPIFjRnvH4TwGToS/O5u3ESQHodMHLxDgO/WNoPc9eZmWEpDwX92HBecO7JAn+Up8zTfbBDS9r0WhVoTw61R+m+PahqwFbsxZhKJPGNq5 root@localhost.localdomain"
}
resource "aws_instance" "web1" {
  ami           = "${var.ami}"
  #instance_type = "t2.micro"
  instance_type = "${var.Instance_type}"
  associate_public_ip_address = true
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.eu-west-1a-public.id}" 
   security_groups = ["${aws_security_group.allow_all.id}"]
  tags {
    Name = "Nginx1"
  }
}

resource "aws_instance" "web2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.eu-west-1b-private.id}"
  security_groups = ["${aws_security_group.allow_all.id}"]

  tags {
    Name = "Nginx2"
  }
}

/*
resource "aws_instance" "web3" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
   security_groups = ["${aws_security_group.allow_all.id}"]
  subnet_id = "${aws_subnet.eu-west-1c-private.id}"
  tags {
    Name = "Nginx3"
  }
}
*/
