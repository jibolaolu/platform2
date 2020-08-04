resource "aws_subnet" "public_subnet" {
  count = "${length(var.public_subnet_cidr)}"
  vpc_id            = aws_vpc.vpc.id
  #cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 5, 0)}"
  cidr_block = "${element(var.public_subnet_cidr, count.index)}"
  #availability_zone = "eu-west-2a"
  availability_zone = "${element(var.availability_zone, count.index)}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${element(var.public_subnet_names, count.index )}"
    Type = "VPC Public Subnet"
  }
  depends_on = [aws_vpc.vpc]
}
