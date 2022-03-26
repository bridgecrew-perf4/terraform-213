
resource "aws_security_group" "sg_worker" {
  name = "kubernetes-worker-sg"
  description = "Managed by Kubernetes cluster terraform"
  vpc_id = var.vpc_id

  ingress {
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    security_groups = [aws_security_group.sg_master.id]
    description = "Allow Control plane to connect to kubelet service of the worker"  // https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#apiserver-to-kubelet
  }

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = [var.subnet_cidr]
    description = "Allow HTTPS connections from within the subnet to pods/svcs" // https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#apiserver-to-nodes-pods-and-services
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = [var.subnet_cidr]
    description = "Allow HTTP connections from within the subnet to pods/svcs" // https://kubernetes.io/docs/concepts/architecture/control-plane-node-communication/#apiserver-to-nodes-pods-and-services
  }

  egress {
    protocol = -1
    from_port = 0
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
    description = "Outgoing connections of all types"
  }
}