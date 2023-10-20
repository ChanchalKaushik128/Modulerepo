resource "azurerm_key_vault" "kv" {
  for_each = var.keyvault
name                            = each.value.kvname
location                        = each.value.location
resource_group_name             = each.value.rgname
enabled_for_disk_encryption     = false 
tenant_id                       = "ecdaeb0c-1a1e-4676-810b-97a590f3aca5"
soft_delete_retention_days      = 90
purge_protection_enabled        = false
sku_name                        = "standard"
access_policy                   = []
enable_rbac_authorization       = true
enabled_for_deployment          = false
enabled_for_template_deployment = false
public_network_access_enabled   = true
tags                            = {}
network_acls {
        bypass                     = "AzureServices"
        default_action             = "Allow"
        ip_rules                   = []
        virtual_network_subnet_ids = []
    }
}
