output "instance_endpoint" {
  description = "Endpoint da instância RDS PostgreSQL"
  value       = aws_db_instance.postgres_instance.address
}

output "instance_port" {
  description = "Porta da instância RDS PostgreSQL"
  value       = aws_db_instance.postgres_instance.port
}

output "db_instance_resource_id" {
  description = "Resource ID da instância RDS"
  value       = aws_db_instance.postgres_instance.resource_id
}


output "db_instance_identifier" {
  description = "Identifier"
  value       = aws_db_instance.postgres_instance.identifier
}

output "db_arn" {
  description = "ARN da instância RDS"
  value       = aws_db_instance.postgres_instance.arn
}


