resource "azurerm_network_security_group" "NSG" {
  for_each = var.azurerm_network_security_group
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rgname
}

  resource "azurerm_network_security_rule" "nsgrule" {
    for_each = var.azurerm_network_security_group
    name                       = "allow_http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = "GAGGIRG1"
  network_security_group_name = azurerm_network_security_group.NSG[each.key].name
  }
  resource "azurerm_network_security_rule" "nsgrule1" {
    name                       = "allow_http"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    resource_group_name         = "GAGGIRG1"
  network_security_group_name = azurerm_network_security_group.NSG[each.key].name
  }
