variable "env" {
  type = string
}

variable "identifier" {
  description = "Identificador único para a instância RDS PostgreSQL"
  type        = string
}

variable "engine_version" {
  description = "Versão do engine PostgreSQL (ex.: \"13.7\")"
  type        = string
}

variable "username" {
  description = "Usuário para acessar o banco de dados"
  type        = string
}

variable "password" {
  description = "Senha para o usuário do banco de dados"
  type        = string
  sensitive   = true
}

variable "allocated_storage" {
  description = "Armazenamento alocado (em GB) para a instância RDS"
  type        = number
}

variable "availability_zone" {
  description = "AZs"
  type        = string
}

variable "instance_class" {
  description = "Classe da instância RDS (ex.: \"db.t3.micro\")"
  type        = string
}

variable "storage_encrypted" {
  description = "Indica se o armazenamento deve ser criptografado"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Define se a instância terá acesso público"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Determina se será criado um snapshot final antes da remoção da instância"
  type        = bool
  default     = true
}

variable "vpc_security_group_ids" {
  description = "Lista de IDs dos Security Groups associados à instância"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Lista de IDs das subnets onde a instância será criada"
  type        = list(string)
}

variable "multi_az" {
  description = "Define se a instância será implantada em Multi-AZ"
  type        = bool
  default     = false
}

variable "backup_retention_period" {
  description = "Número de dias para retenção dos backups"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "Janela de backup (ex.: \"00:00-00:30\")"
  type        = string
  default     = "00:00-00:30"
}

variable "maintenance_window" {
  description = "Janela de manutenção (ex.: \"sun:05:00-sun:05:30\")"
  type        = string
  default     = "sun:05:00-sun:05:30"
}

variable "copy_tags_to_snapshot" {
  description = "Define se as tags da instância serão copiadas para os snapshots"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Mapa de tags a serem aplicadas nos recursos"
  type        = map(string)
  default     = {}
}

variable "availability_zones" {
  type = list(string)
}
