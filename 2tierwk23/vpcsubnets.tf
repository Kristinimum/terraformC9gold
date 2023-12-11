resource "aws_vpc" "custom-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "the-custom-vpc"
  }
}

#1st Public Subnet for the Web Server Tier
resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-1"
  }
}

#2nd Public Subnet for the Web Server Tier
resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

#1st Private Subnet for the RDS Tier
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-1"
  }
}

#2nd Private Subnet for the RDS Tier
resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.custom-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "private-subnet-2"
  }
}