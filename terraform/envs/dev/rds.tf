# module "rds" {
#   source = "../../modules/rds"

#   env                = var.env
#   availability_zones = var.availability_zones

#   identifier              = "postgres-${var.env}"
#   engine_version          = "16.3"
#   username                = "postgres"
#   password                = var.master_password
#   allocated_storage       = 20
#   instance_class          = "db.t3.micro"
#   storage_encrypted       = false
#   publicly_accessible     = true
#   skip_final_snapshot     = true
#   multi_az                = false
#   backup_retention_period = 7
#   backup_window           = "00:00-00:30"
#   maintenance_window      = "sun:05:00-sun:05:30"
#   copy_tags_to_snapshot   = true
#   availability_zone       = var.availability_zones[0]

#   tags = {

#   }

#   vpc_security_group_ids = [module.all_iams.vpc_private_sg_id]
#   subnet_ids             = [module.vpc.first_private_subnet_id, module.vpc.seccond_private_subnet_id]
# }

# # output "db_instance_resource_id" {
# #   description = "Resource ID da instância RDS"
# #   value       = module.rds.db_instance_resource_id
# # }

# output "rds_instance_endpoint" {
#   description = "Endpoint da instância RDS PostgreSQL"
#   value       = module.rds.instance_endpoint
# }

# # output "db_secret_arn" {
# #   description = "ARN do secret que contém as credenciais do banco de dados"
# #   value       = module.rds.db_secret_arn
# # }

# # output "db_instance_identifier" {
# #   description = "Identifier"
# #   value       = module.rds.db_instance_identifier
# # }
