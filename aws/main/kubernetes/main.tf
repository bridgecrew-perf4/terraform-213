
/*module "security_groups" {
  source = "../modules/security"
  vpc_id = var.vpc_id
}*/

resource "aws_key_pair" "keypair" {
  key_name = "kubernetes_keypair"
  public_key = file("${path.cwd}/.ssh/id_rsa.pub")
}

module "security_groups" {
  source = "./modules/security/"
  vpc_id = var.vpc_id
  subnet_cidr = var.subnet_cidr
}

module "masters" {
  source = "./modules/master"
  count = var.master_count
  ami = var.ami
  az = element(local.availability_zones, count.index)
  keypair_name = aws_key_pair.keypair.key_name
  master_flavour = var.master_flavour
  subnet_id = var.subnet_id
  security_group_ids = concat(module.security_groups.common_sg_ids, module.security_groups.master_sg_ids)
}

module "workers" {
  source = "./modules/worker"
  count = var.worker_count
  ami = var.ami
  az = element(local.availability_zones, count.index)
  keypair_name = aws_key_pair.keypair.key_name
  worker_flavour = var.worker_flavour
  subnet_id = var.subnet_id
  security_group_ids = concat(module.security_groups.common_sg_ids, module.security_groups.worker_sg_ids)
}

output "inventory" {
  value = templatefile("${path.cwd}/template.tftpl",
    {
      master_instances = module.masters[*].master
      worker_instances = module.workers[*].worker
    }
  )
}

output "instance_ids" {
  value = join(" ", concat(module.masters[*].master.id, module.workers[*].worker.id))
}