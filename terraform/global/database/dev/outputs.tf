# output "auth_service_connection_url" {
#   description = "URL de conexão para o banco auth-service-database"
#   value = format(
#     "postgres://%s:%s@%s:%d/%s",
#     postgresql_role.auth_service_user.name,
#     var.auth_service.password,
#     var.host,
#     5432,
#     var.auth_service.database_name
#   )
# }

# output "subscription_service_connection_url" {
#   description = "URL de conexão para o banco subscription-service-database"
#   value = format(
#     "postgres://%s:%s@%s:%d/%s",
#     postgresql_role.subscription_service_user.name,
#     var.subscription_service.password,
#     var.host,
#     5432,
#     var.subscription_service.database_name
#   )
# }

# output "school_service_connection_url" {
#   description = "URL de conexão para o banco school-service-database"
#   value = format(
#     "postgres://%s:%s@%s:%d/%s",
#     postgresql_role.school_service_user.name,
#     var.school_service.password,
#     var.host,
#     5432,
#     var.school_service.database_name
#   )
# }

# output "essay_service_connection_url" {
#   description = "URL de conexão para o banco essay-service-database"
#   value = format(
#     "postgres://%s:%s@%s:%d/%s",
#     postgresql_role.essay_service_user.name,
#     var.essay_service.password,
#     var.host,
#     5432,
#     var.essay_service.database_name
#   )
# }
