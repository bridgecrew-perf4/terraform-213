output "master_sg_ids" {
  value = [aws_security_group.sg_master.id]
}

output "worker_sg_ids" {
  value = [aws_security_group.sg_worker.id]
}

output "common_sg_ids" {
  value = [aws_security_group.sg_common.id]
}