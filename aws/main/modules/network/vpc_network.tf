// Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_subnet" "my_subnet" {
  cidr_block = "10.0.123.0/27"
  vpc_id = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
}

resource "aws_network_acl" "my_network_acl" {
  vpc_id = aws_vpc.my_vpc.id
  subnet_ids = [aws_subnet.my_subnet.id]
}

resource "aws_network_acl_rule" "allow_all_ingress" {
  network_acl_id = aws_network_acl.my_network_acl.id
  protocol = "all"
  rule_action = "allow"
  rule_number = 99
  cidr_block = "0.0.0.0/0"
}

resource "aws_network_acl_rule" "allow_all_egress" {
  network_acl_id = aws_network_acl.my_network_acl.id
  protocol = "all"
  egress = true
  rule_action = "allow"
  rule_number = 99
  cidr_block = "0.0.0.0/0"
}


resource "aws_internet_gateway" "my_internet_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_internet_gateway.id
  }
}

resource "aws_route_table_association" "gateway_association" {
  route_table_id = aws_route_table.my_route_table.id
  subnet_id = aws_subnet.my_subnet.id
}