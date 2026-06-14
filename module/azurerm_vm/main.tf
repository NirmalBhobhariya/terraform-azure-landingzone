resource "azurerm_virtual_machine" "zudio" {
  for_each              = var.vm_info
  name                  = each.value.name
  location              = var.rg_info[each.value.rg_key].location
  resource_group_name   = var.rg_info[each.value.rg_key].name
  network_interface_ids = [var.nic_info[each.value.nic_key].id]
  vm_size               = each.value.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = each.value.image_reference.publisher
    offer     = each.value.image_reference.offer
    sku       = each.value.image_reference.sku
    version   = each.value.image_reference.version
  }

  storage_os_disk {
    name    = each.value.os_disk.name
    caching = each.value.os_disk.caching
    # Hardcoded to "FromImage" since you are using an image reference
    create_option = "FromImage"
    # Mapped to match the variable key you used previously
    managed_disk_type = each.value.os_disk.storage_account_type
  }

os_profile {
  computer_name  = each.value.os_profile.computer_name
  admin_username = each.value.os_profile.admin_username
  admin_password = each.value.os_profile.admin_password
}

dynamic "os_profile_linux_config" {
  for_each = each.value.os_type == "linux" ? [1] : []

  content {
    disable_password_authentication = false
  }
}

dynamic "os_profile_windows_config" {
  for_each = each.value.os_type == "windows" ? [1] : []

  content {}
}
}