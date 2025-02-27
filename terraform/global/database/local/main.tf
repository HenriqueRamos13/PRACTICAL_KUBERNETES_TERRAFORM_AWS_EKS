provider "postgresql" {
  host     = var.host
  port     = var.port
  username = var.master_username
  password = var.master_password
  database = "postgres"
  # sslmode   = "require"
  sslmode   = "disable"
  superuser = false

  connect_timeout = 1200
}
