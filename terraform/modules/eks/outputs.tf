output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  description = "Endpoint da API do cluster EKS"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_certificate_authority_data" {
  description = "Dados do certificado da autoridade do cluster (em base64)"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}
