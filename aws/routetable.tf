resource "aws_route_table" "PublicRouteTable" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "PublicRouteTable"
  }
  depends_on = [aws_vpc.vpc,aws_internet_gateway.internet_gateway]
}


resource "aws_route_table_association" "publicroutetableassociation" {
  count = "${length(var.public_subnet_cidr)}"
  subnet_id      = "${element(aws_subnet.public_subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.PublicRouteTable.id}"
  depends_on     = [aws_subnet.public_subnet,aws_route_table.PublicRouteTable]
}