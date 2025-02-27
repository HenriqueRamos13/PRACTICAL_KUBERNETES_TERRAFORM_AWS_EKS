output "proxy_endpoint" {
  description = "Endpoint do RDS Proxy"
  value       = aws_db_proxy.this.endpoint
}

output "proxy_name" {
  description = "Nome do RDS Proxy"
  value       = aws_db_proxy.this.name
}

output "proxy_arn" {
  description = "ARN do RDS Proxy"
  value       = aws_db_proxy.this.arn
}
