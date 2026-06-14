resource "azurerm_network_interface" "zudio" {
  for_each = var.nic_info

  name                = each.value.name
  location            = var.rg_info[each.value.rg_key].location
  resource_group_name = var.rg_info[each.value.rg_key].name

  dynamic "ip_configuration" {
    for_each = each.value.ip_configurations

    content {
      name                          = ip_configuration.value.name
      subnet_id                     = var.subnet_info[ip_configuration.value.subnet_key].id
      private_ip_address_allocation = ip_configuration.value.private_ip_address_allocation
    }
  }
}