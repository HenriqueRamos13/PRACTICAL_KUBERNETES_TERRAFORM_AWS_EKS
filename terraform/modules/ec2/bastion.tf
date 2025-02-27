resource "tls_private_key" "tls_private_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "bastion-key-${var.env}"
  public_key = tls_private_key.tls_private_key.public_key_openssh
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true # Since we use the Instance Connect endpoint for access
  key_name                    = aws_key_pair.generated_key.key_name

  tags = {

  }
}

resource "aws_ec2_instance_connect_endpoint" "instance_connect_endpoint" {
  subnet_id          = var.subnet_id
  security_group_ids = [var.bastion_instance_connect_endpoint_sg_id]

  preserve_client_ip = false

  tags = {

  }
}
