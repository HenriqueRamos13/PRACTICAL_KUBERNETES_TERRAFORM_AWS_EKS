terraform {
  # backend "s3" {
  #   bucket         = "s3-indoor-dev-terraform-state-lock-bucket"
  #   key            = "tfstate/terraform.tfstate"
  #   region         = "sa-east-1"
  #   dynamodb_table = "dynamodb-indoor-dev-terraform-state-lock"
  #   encrypt        = true
  #   profile        = "scribs-actions"
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    stripe = {
      source  = "lukasaron/stripe"
      version = "~> 3.0"
    }
  }
}
