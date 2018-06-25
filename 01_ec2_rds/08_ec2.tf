resource "aws_key_pair" "key_pair_main" {
  key_name = "key_pair_main"
  public_key = "${file("nogit/id_rsa.pub")}"
}

resource "aws_instance" "ec2_ap" {
  ami = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  disable_api_termination = false
  key_name = "${aws_key_pair.key_pair_main.key_name}"
  vpc_security_group_ids = ["${aws_security_group.secgrp_ap_ssh.id}"]
  subnet_id = "${aws_subnet.subnet_ap.id}"
  ebs_block_device {
    device_name = "/dev/sdf"
    volume_type = "gp2"
    volume_size = "30"
  }
}