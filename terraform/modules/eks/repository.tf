
resource "aws_ecr_repository" "auth_app_repo" {
  name                 = "auth-app-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  force_delete = true
}
