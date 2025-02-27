variable "env" {
  type = string
}

variable "aws_region" {
  description = "Região da AWS"
  type        = string
}


variable "vpc_cidr" {
  description = "CIDR block para a VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "first_public_subnet_cidr" {
  description = "CIDR block para a subnet pública"
  type        = string
  default     = "10.0.1.0/24"
}

variable "seccond_public_subnet_cidr" {
  description = "CIDR block para a subnet pública"
  type        = string
  default     = "10.0.2.0/24"
}

variable "first_private_subnet_cidr" {
  description = "CIDR block para a subnet privada"
  type        = string
  default     = "10.0.3.0/24"
}

variable "seccond_private_subnet_cidr" {
  description = "CIDR block para a subnet privada"
  type        = string
  default     = "10.0.4.0/24"
}

variable "availability_zones" {
  type = list(string)
}
