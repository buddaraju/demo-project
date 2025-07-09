output "public" {
  description = "this is the public IP"
  value       = aws_instance.instance.public_ip
}
output "private" {
  description = "this is the private IP"
  value       = aws_instance.instance.private_ip
}
