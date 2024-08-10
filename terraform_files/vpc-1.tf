# VPC and Subnets

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr_block
  availability_zone       = var.availability_zone_a
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_a_cidr_block
  availability_zone       = var.availability_zone_b
}

resource "aws_subnet" "private_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_b_cidr_block
  availability_zone       = var.availability_zone_c
  map_public_ip_on_launch = false
}

# Internet Gateway

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# Route Table for Public Subnet

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# Outputs

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}

output "private_subnet_id1" {
  value = aws_subnet.private_a.id
}

output "private_subnet_id2" {
  value = aws_subnet.private_b.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}
