output "worker" {
  value = aws_instance.worker
}

output worker_ips {
  value = aws_instance.worker.public_ip
}

output "worker_dns" {
  value = aws_instance.worker.public_dns
}