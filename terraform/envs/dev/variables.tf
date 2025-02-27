variable "env" {
  type = string
}

variable "aws_region" {
  description = "Região da AWS"
  type        = string
}

variable "aws_account_id" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "auth_jwt_secret" {
  type = string
}

variable "master_password" {
  type      = string
  sensitive = true
}

variable "master_username" {
  type = string
}
