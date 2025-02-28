resource "null_resource" "update_kubeconfig" {
  # Use triggers to force re-run when the cluster name changes
  triggers = {
    cluster_name = aws_eks_cluster.eks_cluster.name
  }

  provisioner "local-exec" {
    command = "aws eks --region ${var.aws_region} update-kubeconfig --name ${aws_eks_cluster.eks_cluster.name}"
  }
}


data "aws_eks_cluster_auth" "eks" {
  name = var.cluster_name
}

provider "kubernetes" {
  host                   = aws_eks_cluster.eks_cluster.endpoint
  cluster_ca_certificate = base64decode(aws_eks_cluster.eks_cluster.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.eks.token
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = yamlencode([
      {
        rolearn  = "arn:aws:iam::${var.account_id}:role/${var.cluster_name}-node-role"
        username = "system:node:{{EC2PrivateDNSName}}"
        groups   = ["system:bootstrappers", "system:nodes"]
      }
    ])
    mapUsers = yamlencode([
      {
        userarn  = "arn:aws:iam::${var.account_id}:root"
        username = "root"
        groups   = ["system:masters"]
      }
    ])
  }
}

###############################
# Deployment: auth-app-deployment
###############################
resource "kubernetes_deployment" "auth_app_deployment" {
  depends_on = [null_resource.update_kubeconfig]

  metadata {
    name = "auth-app-deployment"
    labels = {
      app = "auth-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "auth-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "auth-app"
        }
      }

      spec {
        container {
          name              = "auth-app"
          image             = "${aws_ecr_repository.auth_app_repo.repository_url}:latest"
          image_pull_policy = "Always"

          port {
            container_port = 3333
          }

          resources {
            requests = {
              cpu    = "900m"
              memory = "256Mi"
            }
            limits = {
              cpu    = "1000m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}

###############################
# Service: auth-app-service
###############################
resource "kubernetes_service" "auth_app_service" {
  depends_on = [null_resource.update_kubeconfig]

  metadata {
    name = "auth-app-service"
  }

  spec {
    type = "LoadBalancer"
    selector = {
      app = "auth-app"
    }

    port {
      port        = 80
      target_port = 3333
      protocol    = "TCP"
    }
  }
}

###############################
# Horizontal Pod Autoscaler: auth-app-hpa
###############################
resource "kubernetes_horizontal_pod_autoscaler" "auth_app_hpa" {
  depends_on = [null_resource.update_kubeconfig]

  metadata {
    name = "auth-app-hpa"
  }

  spec {
    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = kubernetes_deployment.auth_app_deployment.metadata[0].name
    }
    min_replicas                      = 1
    max_replicas                      = 2
    target_cpu_utilization_percentage = 50
  }
}
