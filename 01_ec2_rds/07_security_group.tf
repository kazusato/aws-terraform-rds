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
