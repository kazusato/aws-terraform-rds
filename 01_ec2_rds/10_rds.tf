resource "aws_db_subnet_group" "db_subnet_group_main" {
  subnet_ids = ["${aws_subnet.subnet_db_a.id}", "${aws_subnet.subnet_db_c.id}", "${aws_subnet.subnet_db_d.id}"]
}

resource "aws_db_instance" "rds_main" {
  license_model = "license-included"
  allocated_storage = 20
  storage_encrypted = false
  storage_type = "gp2"
  engine = "oracle-se2"
  engine_version = "12.1.0.2.v12"
  instance_class = "db.t2.micro"
  name = "RDSORA01"
  username = "RDSORA"
  password = "${var.rds_password}"
  port = "1521"
  iam_database_authentication_enabled = false
  vpc_security_group_ids = ["${aws_security_group.secgrp_db_from_ap.id}"]
  maintenance_window = "Sun:15:00-Sun:18:00"
  backup_window = "18:00-21:00"
  backup_retention_period = 0
  db_subnet_group_name = "${aws_db_subnet_group.db_subnet_group_main.name}"
}