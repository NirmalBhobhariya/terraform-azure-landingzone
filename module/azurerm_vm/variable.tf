variable "vm_info" {
  type = map(object({
    name    = string
    rg_key  = string
    nic_key = string

    os_type = string

    vm_size = string

    image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })

    os_disk = object({
      name                 = string
      caching              = string
      storage_account_type = string
    })

    os_profile = object({
      computer_name  = string
      admin_username = string
      admin_password = string
    })
  }))
}
variable "rg_info" {}
variable "nic_info" {}