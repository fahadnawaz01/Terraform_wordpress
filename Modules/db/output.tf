output "db_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.web_db.endpoint
}

output "db_name" {
  description = "The name of the database"
  value       = aws_db_instance.web_db.db_name
}
output "db_username" {
  description = "The master username of the RDS instance"
  value       = aws_db_instance.web_db.username
}


output "db_password" {
  description = "The master password of the RDS instance"
  value       = aws_db_instance.web_db.password
}

output "userdata" {
  description = "The user data script for the web instance"
  value       = data.template_file.web_instance_userdata.rendered
}

