module "eks" {
  source = "../../modules/eks"

  cluster_name    = "cluster-ubi-learning"
  cluster_version = "1.31"
  subnet_ids      = [module.vpc.first_public_subnet_id, module.vpc.seccond_public_subnet_id]
  node_subnet_ids = [module.vpc.first_private_subnet_id, module.vpc.seccond_private_subnet_id]

  desired_capacity = 1
  min_capacity     = 1
  max_capacity     = 2
  instance_types   = ["t4g.large"]
  ami_type         = "AL2023_ARM_64_STANDARD"

  account_id = var.aws_account_id

  aws_region = var.aws_region
}

output "auth_app_service_lb_url" {
  description = "Hostname do Load Balancer do serviço auth-app-service"
  value       = module.eks.auth_app_service_lb_url
}

output "ecr_repository_url" {
  description = "URL do repositório ECR"
  value       = module.eks.ecr_repository_url
}
