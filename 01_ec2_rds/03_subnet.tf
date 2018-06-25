resource "aws_subnet" "subnet_ap" {
  cidr_block = "10.0.0.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_subnet" "subnet_db" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
}
