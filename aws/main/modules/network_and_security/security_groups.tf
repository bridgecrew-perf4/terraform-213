resource "aws_security_group" "instance_access" {
  name = "sg_instance_access"
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type = "ingress"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  security_group_id = aws_security_group.instance_access.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https_ingress" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.instance_access.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https_egress" {
  type = "egress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.instance_access.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "dns_egress" {
  from_port = 53
  protocol = "udp"
  security_group_id = aws_security_group.instance_access.id
  to_port = 53
  type = "egress"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_ingress" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.instance_access.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "http_egress" {
  type = "egress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.instance_access.id
  cidr_blocks = ["0.0.0.0/0"]
}