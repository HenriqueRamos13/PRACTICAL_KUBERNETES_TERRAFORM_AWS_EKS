variable "aws_region" {
  type = string
}

variable "proxy_name" {
  description = "Nome do RDS Proxy"
  type        = string
}

variable "engine_family" {
  description = "Família do engine (ex.: POSTGRESQL ou MYSQL)"
  type        = string
  default     = "POSTGRESQL"
}

variable "idle_client_timeout" {
  description = "Tempo limite para clientes inativos (em segundos)"
  type        = number
  default     = 1800
}

variable "require_tls" {
  description = "Define se a conexão requer TLS"
  type        = bool
  default     = true
}

variable "debug_logging" {
  description = "Habilita logs de debug para o proxy"
  type        = bool
  default     = false
}

variable "subnet_ids" {
  description = "Lista de IDs das subnets onde o proxy será criado"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs dos Security Groups para o proxy"
  type        = list(string)
}

variable "db_instance_resource_id" {
  description = "Resource ID da instância RDS (utilizado para associar ao proxy)"
  type        = string
}

variable "db_instance_identifier" {
  description = "DB Indentifier"
  type        = string
}

variable "db_secret_arn" {
  description = "ARN do Secret que contém as credenciais do banco de dados"
  type        = string
}

variable "iam_auth" {
  description = "Define se a autenticação IAM está habilitada: DISABLED ou REQUIRED"
  type        = string
  default     = "DISABLED"
}

variable "db_arn" {
  description = "ARN da instância RDS"
  type        = string
}
