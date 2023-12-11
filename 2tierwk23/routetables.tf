#This is a public route table route to Internet Gateway
resource "aws_route_table" "publc_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "public-rout-table"
  }
}

#This is a private route table route to NAT Gateway
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.custom-vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

  tags = {
    Name = "private-rout-table"
  }
}
