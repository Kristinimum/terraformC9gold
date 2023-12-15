#For IG way 
#Associate with the VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.custom-vpc.id

  tags = {
    Name = "IGW"
  }
}


#for NAT GATEWAY
resource "aws_nat_gateway" "gw-nat" {
  allocation_id = aws_eip.elastic-for-ngw.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "gw NAT"
  }

  depends_on = [aws_internet_gateway.igw]
}

#create Elastic IP address
resource "aws_eip" "elastic-for-ngw" {
  domain = "vpc"

}

# depends_on makes it so internet gateway is created before NAT gw.
# allocation_id associates NAT with elastic ip.
# subnet_id associates NAT gw with public subnet 1.