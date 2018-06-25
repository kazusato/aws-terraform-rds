resource "aws_route_table_association" "route_table_association_main" {
  route_table_id = "${aws_route_table.route_table_main.id}"
  subnet_id = "${aws_subnet.subnet_ap.id}"
}
