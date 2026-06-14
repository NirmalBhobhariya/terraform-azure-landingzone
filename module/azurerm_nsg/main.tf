resource "azurerm_network_security_group" "zudio" {
  for_each            = var.nsg_info
  name                = each.value.name
  location            = var.rg_info[each.value.rg_key].location
  resource_group_name = var.rg_info[each.value.rg_key].name
}