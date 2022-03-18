resource "aws_security_group" "test_sg" {
  vpc_id = var.vpc_id
  name = "no_access_sg"
}