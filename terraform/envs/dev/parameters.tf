# resource "aws_ssm_parameter" "indoor_no_sensitive_parameters" {
#   for_each = {
#     aws_region = var.aws_region
#     # domain                 = var.domain
#     # dashboard_subdomain = var.dashboard_subdomain
#     resend_sender   = var.resend_sender
#     path_to_lambdas = var.path_to_lambdas
#   }

#   name  = "/indoor/${var.env}/${each.key}"
#   type  = "String"
#   value = each.value
# }

# resource "aws_ssm_parameter" "indoor_sensitive_parameters" {
#   for_each = {
#     # first_database_password = var.first_database_password
#     # notification_emails     = var.notification_emails
#     stripe_secret_key     = var.stripe_secret_key
#     stripe_webhook_secret = var.stripe_webhook_secret
#     cloudflare_api_token  = var.cloudflare_api_token
#     cloudflare_zone_id    = var.cloudflare_zone_id
#     # auth_jwt_secret  = var.auth_jwt_secret
#     resend_api_key = var.resend_api_key
#     cookie_key     = var.cookie_key
#   }

#   name   = "/indoor/${var.env}/${each.key}"
#   type   = "SecureString"
#   value  = each.value
#   key_id = "alias/aws/ssm"
# }
