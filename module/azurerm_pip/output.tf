output "pip" {
  value = {
    for k, pip in azurerm_public_ip.zudio : k => {
      id                = pip.id
      name              = pip.name
      location          = pip.location
      resource_group_name = pip.resource_group_name
      allocation_method = pip.allocation_method
      sku               = pip.sku
    }
  }
}