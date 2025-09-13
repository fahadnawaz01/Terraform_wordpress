output "public_sg_id" {
  description = "The ID of the public security group"
  value       = aws_security_group.allow_tls.id
}

output "private_sg_id" {
  description = "The ID of the private security group"
  value       = aws_security_group.private_sg.id
}

