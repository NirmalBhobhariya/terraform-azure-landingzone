output "nsg" {
  value = {
    for k, nsg in azurerm_network_security_group.zudio : k => {
      id                = nsg.id
      name              = nsg.name
      location          = nsg.location
      resource_group_name = nsg.resource_group_name
    }
  }
}