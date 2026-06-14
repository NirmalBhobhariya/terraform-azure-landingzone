resource "azurerm_subnet" "zudio" {
  for_each             = var.subnet_info
  name                 = each.value.name
  resource_group_name  = var.rg_info[each.value.rg_key].name
  virtual_network_name = var.vnet_info[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}