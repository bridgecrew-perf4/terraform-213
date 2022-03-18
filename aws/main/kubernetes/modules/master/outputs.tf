output "master" {
  value = aws_instance.master
}

output master_ips {
  value = aws_instance.master.public_ip
}

output "master_dns" {
  value = aws_instance.master.public_dns
}