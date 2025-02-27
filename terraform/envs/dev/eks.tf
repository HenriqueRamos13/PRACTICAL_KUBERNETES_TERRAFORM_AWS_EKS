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
}
