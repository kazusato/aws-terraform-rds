provider "aws" {
  // Environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY must be set.
  region = "ap-northeast-1"
}

variable "target_region" {
  default = "ap-northeast-1"
}

variable "ami_id" {
  default = "ami-6b0d5f0d"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "rds_password" {}
