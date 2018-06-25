resource "aws_security_group" "secgrp_ap_ssh" {
  name = "secgrp-ap-ssh"
  description = "Security Group for AP to allow SSH"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "secgrp_db_from_ap" {
  name = "secgrp-db-from-ap"
  description = "Security Group for DB to allow connection from AP"
  vpc_id = "${aws_vpc.vpc_main.id}"
  ingress {
    from_port = 1521
    protocol = "tcp"
    to_port = 1521
    cidr_blocks = ["10.0.0.0/24"]
  }
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
