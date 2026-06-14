output "nic" {
  value = {
    for k, nic in azurerm_network_interface.zudio : k => {
      id                  = nic.id
      name                = nic.name
      location            = nic.location
      resource_group_name = nic.resource_group_name
    }
  }
}