resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.service_name}-vpc"
    Type = "VPC"
  }
}

resource "aws_eip" "EIP" {
  vpc = true
  tags = {
    Name = "${var.service_name}-EIP"
  }
}
