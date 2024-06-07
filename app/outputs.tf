output "public_ip" {
    value = aws_instance.server_app_devops.public_ip
}

output "instance_public_key" {
  description = "Public key key-pair"
  value       = tls_private_key.generate-key.public_key_openssh
  sensitive   = true
}