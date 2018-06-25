resource "aws_eip" "eip_ap" {
  instance = "${aws_instance.ec2_ap.id}"
  vpc = true
}