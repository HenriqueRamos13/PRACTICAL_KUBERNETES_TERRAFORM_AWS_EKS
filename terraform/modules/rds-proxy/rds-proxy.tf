resource "aws_db_proxy" "this" {
  name                   = var.proxy_name
  engine_family          = var.engine_family
  idle_client_timeout    = var.idle_client_timeout
  require_tls            = var.require_tls
  role_arn               = aws_iam_role.rds_proxy_role.arn
  vpc_subnet_ids         = var.subnet_ids
  vpc_security_group_ids = var.vpc_security_group_ids
  debug_logging          = var.debug_logging

  auth {
    auth_scheme = "SECRETS"
    description = "Autenticação via AWS Secrets Manager"
    iam_auth    = var.iam_auth
    secret_arn  = var.db_secret_arn
  }

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_db_proxy_default_target_group" "default" {
  db_proxy_name = aws_db_proxy.this.name

  connection_pool_config {
    connection_borrow_timeout    = 120
    max_connections_percent      = 100
    max_idle_connections_percent = 50
  }
}

resource "aws_db_proxy_target" "this" {
  db_instance_identifier = var.db_instance_identifier
  db_proxy_name          = aws_db_proxy.this.name
  target_group_name      = aws_db_proxy_default_target_group.default.name
}
