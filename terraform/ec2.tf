/*
Key_creation
*/
resource "aws_key_pair" "deployer" {
  key_name   = "ec2-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQD3F6tyPEFEzV0LX3X8BsXdMsQz1x2cEikKDEY0aIj41qgxMCP/iteneqXSIFZBp5vizPvaoIR3Um9xK7PGoW8giupGn+EPuxIA4cDM4vzOqOkiMPhz5XK0whEjkVzTo4+S0puvDZuwIsdiW9mxhJc7tgBNL0cYlWSYVkz4G/fslNfRPW5mYAM49f4fhtxPb5ok4Q2Lg9dPKVHO/Bgeu5woMc7RY0p1ej6D4CKFE6lymSDJpW0YHX/wqE9+cfEauh7xZcG0q9t2ta6F6fmX0agvpFyZo8aFbXeUBr7osSCJNgvavWbM/06niWrOvYX2xwWdhXmXSrbX8ZbabVohBK41 tfs@example.com"
}
resource "aws_instance" "web1" {
  ami           = "${var.ami}"
  #instance_type = "t2.micro"
  instance_type = "${var.Instance_type}"
  associate_public_ip_address = true
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.eu-west-1a-public.id}" 
  tags {
    Name = "Nginx1"
  }
}

resource "aws_instance" "web2" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.eu-west-1b-private.id}"

  tags {
    Name = "Nginx2"
  }
}

/*
resource "aws_instance" "web3" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  subnet_id = "${aws_subnet.eu-west-1c-private.id}"
  tags {
    Name = "Nginx3"
  }
}
*/
