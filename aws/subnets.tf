resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 5, 0)}"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${var.service_name}-public-public-eu-west-1a"
    Type = "VPC Public Subnet"
  }
}
