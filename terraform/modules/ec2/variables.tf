variable "env" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "bastion_sg_id" {
  type = string
}

variable "bastion_instance_connect_endpoint_sg_id" {
  type = string
}
