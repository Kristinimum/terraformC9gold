#This is a public route table route to Internet Gateway
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

#This is a private route table route to NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.gw-nat.id
  }

  tags = {
    Name = "private-route-table"
  }
}

#associate public route table with public subnet 1
resource "aws_route_table_association" "subnet1-public-rt" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_rt.id
}

#associate public route table with public subnet 2
resource "aws_route_table_association" "subnet2-public-rt" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public_rt.id
}

#associate PRIVATE route table with private subnet 1
resource "aws_route_table_association" "subnet1-private-rt" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_rt.id
  depends_on     = [aws_route_table.private_rt]
}
#depends_on tells terraform private rt needs to be created before association

#associate PRIVATE route table with private subnet 1
resource "aws_route_table_association" "subnet2-private-rt" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_rt.id
  depends_on     = [aws_route_table.private_rt]
}
