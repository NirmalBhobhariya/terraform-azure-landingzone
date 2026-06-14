output "subnet" {
  value = {
    for k, subnet in azurerm_subnet.zudio : k => {
      id                 = subnet.id
      name               = subnet.name
      address_prefixes   = subnet.address_prefixes
      resource_group_name = subnet.resource_group_name
      virtual_network_name = subnet.virtual_network_name
    }
  }
}