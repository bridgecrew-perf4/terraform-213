
resource "aws_security_group" "sg_common" {
  name = "kubernetes-cluster-common"
  description = "Managed by Kubernetes cluster terraform"
  vpc_id = var.vpc_id

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    protocol = -1
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}