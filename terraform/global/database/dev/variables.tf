variable "host" {
  description = "DB Host"
  type        = string
}

variable "port" {
  description = "DB Port"
  type        = number
}

variable "master_username" {
  description = "Usuário master do cluster Aurora"
  type        = string
}

variable "master_password" {
  description = "Senha master do cluster Aurora"
  type        = string
  sensitive   = true
}

variable "databases" {
  type = list(object({
    database_name = string
    username      = string
    password      = string
  }))
}
