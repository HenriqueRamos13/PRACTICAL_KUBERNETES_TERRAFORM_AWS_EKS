######################################
#     Cria papéis (roles/usuários)
######################################
resource "postgresql_role" "roles" {
  for_each = { for db in var.databases : db.database_name => db }

  name     = each.value.username
  password = each.value.password
  login    = true
}

######################################
#     Cria os databases
######################################
resource "postgresql_database" "databases" {
  for_each = { for db in var.databases : db.database_name => db }

  name  = each.value.database_name
  owner = postgresql_role.roles[each.key].name

  depends_on = [postgresql_role.roles]
}

######################################
#     Concede privilégios (ALL)
######################################
resource "postgresql_grant" "database_privileges" {
  for_each = { for db in var.databases : db.database_name => db }

  database    = each.value.database_name
  role        = each.value.username
  privileges  = ["CONNECT"]
  object_type = "database"

  depends_on = [postgresql_database.databases]
}
