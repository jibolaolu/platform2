resource "aws_subnet" "public_subnet" {
  count             = length(var.private_subnet_cidr)
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.public_subnet_cidr, count.index)
  availability_zone = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = element(var.public_subnet_names, count.index )
    Type = "VPC Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  count = "${length(var.private_subnet_cidr)}"
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(var.private_subnet_cidr, count.index)
  availability_zone = element(var.availability_zone, count.index)
  map_public_ip_on_launch = true

  tags = {
    Name = element(var.private_subnet_names, count.index)
    Type = "VPC Public Subnet"
  }
}