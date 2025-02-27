resource "aws_security_group" "vpc_private_sg" {
  name   = "vpc_private_sg-${var.env}"
  vpc_id = var.vpc_id

  tags = {
    subnet = "private"
  }
}


resource "aws_vpc_security_group_ingress_rule" "vpc_private_sg_ingress" {
  security_group_id = aws_security_group.vpc_private_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}

resource "aws_vpc_security_group_ingress_rule" "vpc_private_sg_ingress_self" {
  security_group_id = aws_security_group.vpc_private_sg.id

  ip_protocol                  = "-1"
  referenced_security_group_id = aws_security_group.vpc_private_sg.id
}

resource "aws_vpc_security_group_egress_rule" "vpc_private_sg_egress" {
  security_group_id = aws_security_group.vpc_private_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
}
