# module "rds_proxy" {
#   source = "../../modules/rds-proxy"

#   aws_region = var.aws_region

#   proxy_name              = "rds-proxy-${var.env}"
#   engine_family           = "POSTGRESQL"
#   subnet_ids              = [module.vpc.first_private_subnet_id, module.vpc.seccond_private_subnet_id]
#   vpc_security_group_ids  = [module.all_iams.vpc_private_sg_id]
#   db_instance_resource_id = module.rds.db_instance_resource_id
#   db_secret_arn           = module.rds.db_secret_arn
#   idle_client_timeout     = 1800
#   require_tls             = false
#   debug_logging           = false
#   iam_auth                = "DISABLED"
#   db_instance_identifier  = module.rds.db_instance_identifier
#   db_arn                  = module.rds.db_arn
# }

# output "rds_proxy_endpoint" {
#   description = "Endpoint do RDS Proxy"
#   value       = module.rds_proxy.proxy_endpoint
# }
