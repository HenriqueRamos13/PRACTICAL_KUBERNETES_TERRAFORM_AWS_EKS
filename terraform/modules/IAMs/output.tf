output "vpc_public_sg_id" {
  value = aws_security_group.vpc_public_sg.id
}

output "vpc_private_sg_id" {
  value = aws_security_group.vpc_private_sg.id
}

output "bastion_instance_connect_endpoint_sg_id" {
  value = aws_security_group.bastion_instance_connect_endpoint_sg.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}

