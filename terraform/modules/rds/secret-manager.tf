resource "random_integer" "secret_suffix" {
  min = 1000000000000
  max = 9999999999999
}

resource "random_pet" "secret_suffix" {
  length    = 2
  separator = "-"
}


resource "aws_secretsmanager_secret" "db_secret" {
  name        = "${var.env}-db-postgres-secret-for-rds-${random_integer.secret_suffix.result}-${random_pet.secret_suffix.id}"
  description = "Secret com as credenciais do banco de dados"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username             = var.username,
    password             = var.password,
    engine               = aws_db_instance.postgres_instance.engine,
    host                 = aws_db_instance.postgres_instance.address,
    port                 = aws_db_instance.postgres_instance.port,
    dbInstanceIdentifier = aws_db_instance.postgres_instance.identifier
  })
}

output "db_secret_arn" {
  description = "ARN do secret que contém as credenciais do banco de dados"
  value       = aws_secretsmanager_secret.db_secret.arn
}
