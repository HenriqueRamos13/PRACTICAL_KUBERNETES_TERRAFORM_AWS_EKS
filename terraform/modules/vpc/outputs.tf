output "vpc_id" {
  description = "ID da VPC criada"
  value       = aws_vpc.this.id
}

output "first_public_subnet_id" {
  description = "ID da subnet pública criada"
  value       = aws_subnet.first_public.id
}

output "seccond_public_subnet_id" {
  description = "ID da subnet pública criada"
  value       = aws_subnet.seccond_public.id
}

output "first_private_subnet_id" {
  description = "ID da subnet privada criada"
  value       = aws_subnet.first_private.id
}

output "seccond_private_subnet_id" {
  description = "ID da subnet privada criada"
  value       = aws_subnet.seccond_private.id
}
