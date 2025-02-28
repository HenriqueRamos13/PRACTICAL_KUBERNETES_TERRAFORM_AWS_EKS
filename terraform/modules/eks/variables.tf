variable "cluster_name" {
  description = "Nome do cluster EKS"
  type        = string
  default     = "cluster-ubi-learning"
}

variable "cluster_version" {
  description = "Versão do cluster EKS (ex.: 1.31)"
  type        = string
  default     = "1.31"
}

variable "subnet_ids" {
  description = "Lista de IDs das subnets para o control plane (p.ex.: subnets públicas)"
  type        = list(string)
}

variable "node_subnet_ids" {
  description = "Lista de IDs das subnets para os nós (geralmente subnets privadas)"
  type        = list(string)
}

variable "desired_capacity" {
  description = "Número desejado de nós no managed node group"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "Capacidade mínima do managed node group"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Capacidade máxima do managed node group"
  type        = number
  default     = 2
}

variable "instance_types" {
  description = "Lista de tipos de instância para os nós"
  type        = list(string)
  default     = ["t4g.large"]
}

variable "ami_type" {
  description = "Tipo de AMI para os nós (conforme a arquitetura e versão do EKS)"
  type        = string
  # Se for ARM, use AL2023_ARM_64_STANDARD; se x86, AL2023_x86_64_STANDARD.
  default = "AL2023_ARM_64_STANDARD"
}

variable "account_id" {
  description = "ID da conta AWS"
  type        = string
}

variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

