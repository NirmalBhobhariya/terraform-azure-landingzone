output "bastion" {
  value = {
    for k, bastion in azurerm_bastion_host.zudio : k => {
      id                = bastion.id
      name              = bastion.name
      location          = bastion.location
      resource_group_name = bastion.resource_group_name
    }
  }
}