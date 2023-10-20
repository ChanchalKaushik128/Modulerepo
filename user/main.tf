resource "azuread_user" "user" {
  for_each            = var.username
  user_principal_name = each.value.principal_name
  display_name        = each.value.display_name
  password            = each.value.password

}
