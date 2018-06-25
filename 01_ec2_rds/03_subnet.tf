resource "aws_subnet" "subnet_ap_a" {
  cidr_block = "10.0.0.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "subnet_db_a" {
  cidr_block = "10.0.1.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1a"
}

resource "aws_subnet" "subnet_ap_c" {
  cidr_block = "10.0.10.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1c"
}

resource "aws_subnet" "subnet_db_c" {
  cidr_block = "10.0.11.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1c"
}

resource "aws_subnet" "subnet_ap_d" {
  cidr_block = "10.0.20.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1d"
}

resource "aws_subnet" "subnet_db_d" {
  cidr_block = "10.0.21.0/24"
  vpc_id = "${aws_vpc.vpc_main.id}"
  availability_zone = "ap-northeast-1d"
}
