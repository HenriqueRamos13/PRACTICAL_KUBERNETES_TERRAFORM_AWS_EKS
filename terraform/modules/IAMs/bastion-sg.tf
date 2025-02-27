resource "aws_security_group" "bastion_instance_connect_endpoint_sg" {
  name        = "bastion_instance_connect_endpoint_sg-${var.env}"
  description = "Security group for EC2 Instance Connect Endpoint"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "bastion_instance_connect_endpoint_sg_ingress22" {
  security_group_id = aws_security_group.bastion_instance_connect_endpoint_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "bastion_instance_connect_endpoint_sg_egress" {
  security_group_id = aws_security_group.bastion_instance_connect_endpoint_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}




resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg-${var.env}"
  description = "Security group for the bastion host"
  vpc_id      = var.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "bastion_sg_ingress" {
  security_group_id = aws_security_group.bastion_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "bastion_sg_egress" {
  security_group_id = aws_security_group.bastion_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
