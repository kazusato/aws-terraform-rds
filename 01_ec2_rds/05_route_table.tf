resource "aws_route_table" "route_table_main" {
  vpc_id = "${aws_vpc.vpc_main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw_main.id}"
  }
}