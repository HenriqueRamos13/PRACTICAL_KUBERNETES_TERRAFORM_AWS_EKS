module "all_iams" {
  source = "../../modules/IAMs"

  env    = var.env
  vpc_id = module.vpc.vpc_id
}

#############
# Variables
#############

#############
# OUTPUTS
#############
