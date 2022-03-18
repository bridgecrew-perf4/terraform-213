
resource "aws_instance" "worker" {
  ami = var.ami
  instance_type = var.worker_flavour
  key_name = var.keypair_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id
  availability_zone = var.az
  user_data = <<EOF
  runcmd:
  - sudo yum install -y docker
  EOF

  lifecycle {
    ignore_changes = [user_data]
  }

  tags = {
    name = "Kubernetes worker node"
    description = "Worker node for the terraform managed kubernetes cluster"
  }
}


resource "aws_ebs_volume" "worker_volume" {
  availability_zone = var.az
  size = 20
  type = "gp3"

  tags = {
    name = "Kubernetes worker boot volume"
  }
}

resource "aws_volume_attachment" "worker_attach" {
  device_name = "/dev/sdc"
  instance_id = aws_instance.worker.id
  volume_id = aws_ebs_volume.worker_volume.id
}