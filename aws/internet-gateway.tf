resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.service_name}-internet-gateway"
    Type = "VPC Internet Gateway"
  }
  depends_on = [aws_vpc.vpc]
}

resource "aws_nat_gateway" "BJSSNGW" {
  allocation_id = aws_eip.EIP.id
  subnet_id = aws_subnet.public_subnet[0].id

  tags = {
    Name = "NATGW"
  }
}
