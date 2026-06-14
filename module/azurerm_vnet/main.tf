resource "azurerm_virtual_network" "zudio" {
  for_each            = var.vnet_info
  name                = each.value.name
  address_space       = each.value.address_space
  resource_group_name = var.rg_info[each.value.rg_key].name
  location = var.rg_info[each.value.rg_key].location
}