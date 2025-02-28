# module "bastion" {
#   source = "../../modules/ec2"

#   env                                     = var.env
#   vpc_id                                  = module.vpc.vpc_id
#   subnet_id                               = module.vpc.first_public_subnet_id
#   bastion_sg_id                           = module.all_iams.bastion_sg_id
#   bastion_instance_connect_endpoint_sg_id = module.all_iams.bastion_instance_connect_endpoint_sg_id
# }

# output "bastion_public_ip" {
#   value = module.bastion.bastion_public_ip
# }

# output "bastion_private_key" {
#   value     = module.bastion.private_key
#   sensitive = true
# }

# output "bastion_instance_id" {
#   value = module.bastion.ec2_instance_id
# }
