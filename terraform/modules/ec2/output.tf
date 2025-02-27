output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "ubuntu_ami_id" {
  value = data.aws_ami.ubuntu.id
}

output "private_key" {
  value     = tls_private_key.tls_private_key.private_key_pem
  sensitive = true
}

output "ec2_instance_id" {
  value = aws_instance.bastion.id
}
