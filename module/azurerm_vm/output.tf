output "vm" {
  value = {
    for k, vm in azurerm_virtual_machine.zudio : k => {
      id                = vm.id
      name              = vm.name
      location          = vm.location
      resource_group_name = vm.resource_group_name
    }
  }
}