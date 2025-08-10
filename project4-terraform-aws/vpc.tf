# This file defines the core networking components for the project,
# including a VPC, subnet, internet gateway, and route table.

# Create the Virtual Private Cloud (VPC)
resource "aws_vpc" "myvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = var.vpc_name
  }
}

# Create a subnet within the VPC
# It automatically assigns a public IP to instances launched in it
resource "aws_subnet" "mysubnet" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = var.mapIPaddressOnLaunch

  tags = {
    Name = var.Subnet1Name
  }
}

# Create an Internet Gateway to allow communication between the VPC
# and the internet
resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = var.InternetGatewayName
  }
}

# Create a route table to define rules for traffic
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# Associate the route table with the subnet
resource "aws_route_table_association" "my_route_table_association" {
  subnet_id      = aws_subnet.mysubnet.id
  route_table_id = aws_route_table.myroutetable.id
}