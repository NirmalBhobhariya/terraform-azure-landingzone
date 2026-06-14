output "rg" {
  value = {
    for k, rg in azurerm_resource_group.zudio : k => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}