output "auth_app_service_lb_url" {
  description = "Hostname do Load Balancer do serviço auth-app-service"
  value       = kubernetes_service.auth_app_service.status[0].load_balancer[0].ingress[0].hostname
}

output "ecr_repository_url" {
  description = "URL do repositório ECR"
  value       = aws_ecr_repository.auth_app_repo.repository_url
}
