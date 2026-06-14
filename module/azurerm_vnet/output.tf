output "vnet" {
  value = {
    for k, vnet in azurerm_virtual_network.zudio : k => {
      id                = vnet.id
      name              = vnet.name
      address_space     = vnet.address_space
      resource_group_name = vnet.resource_group_name
    }
  }
}