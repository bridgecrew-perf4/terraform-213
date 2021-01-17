// Loadbalancer SG and its rules
resource "aws_security_group" "lb_sg" {
  name = "sg_loadbalancer"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "http_ingress" {
  type = "ingress"
  from_port = 80
  to_port = 80
  protocol = "tcp"
  security_group_id = aws_security_group.lb_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "https_ingress" {
  type = "ingress"
  from_port = 443
  to_port = 443
  protocol = "tcp"
  security_group_id = aws_security_group.lb_sg.id
  cidr_blocks = ["0.0.0.0/0"]
}