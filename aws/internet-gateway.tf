resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.service_name}-internet-gateway"
    Type = "VPC Internet Gateway"
  }
  depends_on = [aws_vpc.vpc]
}


