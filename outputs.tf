output "manager_ip_address" {
  value = aws_instance.manager.public_ip
}

output "worker_01_ip_addresses" {
  value = aws_instance.worker-01.public_ip
}

output "worker_02_ip_addresses" {
  value = aws_instance.worker-02.public_ip
}