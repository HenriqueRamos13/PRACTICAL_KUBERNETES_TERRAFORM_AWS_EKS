module "vpc" {
  source             = "../../modules/vpc"
  env                = var.env
  aws_region         = var.aws_region
  availability_zones = var.availability_zones
}
