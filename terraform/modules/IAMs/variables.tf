variable "env" {
  type = string
}

variable "aws_region" {
  default     = "eu-west-3"
  description = "AWS region"
  type        = string
}

variable "vpc_id" {
  description = "ID do VPC"
  type        = string
}

