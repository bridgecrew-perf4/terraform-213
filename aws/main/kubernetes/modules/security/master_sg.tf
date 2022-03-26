
resource "aws_security_group" "sg_master" {
  name = "kubernetes-master-sg"
  description = "Managed by Kubernetes cluster terraform"
  vpc_id = var.vpc_id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTPS connects from everywhere" // TODO: change it to be allowed from a loadbalancer
                                                                  // https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#apiserver-to-kubelet
  }

  ingress {
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow APIserver calls from everywhere" // TODO: change it to be allowed from a loadbalancer
                                                                  // https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#apiserver-to-kubelet
  }

  egress {
    protocol = -1
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outgoing connections of all types"
  }
}