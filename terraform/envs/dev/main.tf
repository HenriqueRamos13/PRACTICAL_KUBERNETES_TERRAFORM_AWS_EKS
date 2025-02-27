provider "aws" {
  region  = var.aws_region
  profile = "henrique-mac"

  default_tags {
    tags = {
      Environment = "development"
      Service     = "Ubi-Learning"
    }
  }
}
