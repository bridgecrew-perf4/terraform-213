
/*module "security_groups" {
  source = "../modules/security"
  vpc_id = var.vpc_id
}*/

resource "aws_key_pair" "keypair" {
  key_name = "kubernetes_keypair"
  public_key = file("${path.cwd}/.ssh/id_rsa.pub")
}

resource "aws_instance" "master" {
  // TODO ("Remove hardcoding of SG's")
  count = var.master_count
  ami = var.ami
  instance_type = var.instance_flavour
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = ["sg-085bf961c3b15f5af", "sg-0af6e52cbcd04ffda"]
  subnet_id = var.subnet_id
  user_data = <<EOF
  runcmd:
  - sudo yum install -y docker
  EOF

  lifecycle {
    ignore_changes = [user_data]
  }
}

resource "aws_instance" "worker" {
  count = var.worker_count
  ami = var.ami
  instance_type = var.instance_flavour
  key_name = aws_key_pair.keypair.key_name
  vpc_security_group_ids = ["sg-085bf961c3b15f5af", "sg-0af6e52cbcd04ffda"]
  subnet_id = var.subnet_id
  user_data = <<EOF
  runcmd:
  - sudo yum install -y docker
  EOF

  lifecycle {
    ignore_changes = [user_data]
  }
}

output "inventory" {
  value = templatefile("${path.cwd}/template.tmpl",
    {
      master_instances = aws_instance.master
      worker_instances = aws_instance.worker
    }
  )
}
