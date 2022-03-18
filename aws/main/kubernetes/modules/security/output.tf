output "master_sg_ids" {
  value = []
}

output "worker_sg_ids" {
  value = []
}

output "common_sg_ids" {
  value = [aws_security_group.sg_common.id]
}