resource "azurerm_bastion_host" "zudio" {
  for_each            = var.bastion_info
  name                = each.value.name
  location            = var.rg_info[each.value.rg_key].location
  resource_group_name = var.rg_info[each.value.rg_key].name

  ip_configuration {
    name                 = each.value.ip_configuration.ip_configuration_name
    subnet_id            = var.subnet_info[each.value.subnet_key].id
    public_ip_address_id = var.pip_info[each.value.pip_key].id
  }
}