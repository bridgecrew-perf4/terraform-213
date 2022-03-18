
resource "aws_instance" "master" {
  ami = var.ami
  instance_type = var.master_flavour
  key_name = var.keypair_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id = var.subnet_id
  availability_zone = var.az
  user_data = <<EOF
  runcmd:
  - sudo yum install -y epel-release
  - sudo yum install -y ansible
  EOF

  lifecycle {
    ignore_changes = [user_data]
  }

  tags = {
    name = "Kubernetes Master node"
    description = "Master node for the terraform managed kubernetes cluster"
  }
}


resource "aws_ebs_volume" "master_volume" {
  availability_zone = var.az
  size = 50
  type = "gp3"

  tags = {
    name = "Kubernetes master boot volume"
  }
}

resource "aws_volume_attachment" "master_attach" {
  device_name = "/dev/sdc"
  instance_id = aws_instance.master.id
  volume_id = aws_ebs_volume.master_volume.id
}