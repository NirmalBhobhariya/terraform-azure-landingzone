resource "azurerm_public_ip" "zudio" {
  for_each = var.pip_info

  name                = each.value.name
  location            = var.rg_info[each.value.rg_key].location
  resource_group_name = var.rg_info[each.value.rg_key].name

  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}