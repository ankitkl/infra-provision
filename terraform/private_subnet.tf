/*
 NAT Gateway
*/

resource "aws_eip" "one" {
  vpc = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.one.id}"
  subnet_id     = "${aws_subnet.eu-west-1a-public.id}"
}
/*
  Private Subnet1
*/
resource "aws_subnet" "eu-west-1c-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr}"
    availability_zone = "eu-west-1c"

    tags {
        Name = "Private Subnet1"
    }
}

resource "aws_route_table" "eu-west-1-private" {
    vpc_id = "${aws_vpc.default.id}"

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id  = "${aws_nat_gateway.gw.id}"
    }

    tags {
        Name = "Private Subnet1"
    }
}

resource "aws_route_table_association" "eu-west-1c-private" {
    subnet_id = "${aws_subnet.eu-west-1c-private.id}"
    route_table_id = "${aws_route_table.eu-west-1-private.id}"
}

/*
  Private Subnet2
*/
resource "aws_subnet" "eu-west-1b-private" {
    vpc_id = "${aws_vpc.default.id}"

    cidr_block = "${var.private_subnet_cidr2}"
    availability_zone = "eu-west-1b"

    tags {
        Name = "Private Subnet2"
    }
}

resource "aws_route_table_association" "eu-west-1b-private" {
    subnet_id = "${aws_subnet.eu-west-1b-private.id}"
    route_table_id = "${aws_route_table.eu-west-1-private.id}"
}
