variable "nic_info" {
  type = map(object({
    name     = string
    rg_key   = string

    ip_configurations = list(object({
      name                          = string
      subnet_key                    = string
      private_ip_address_allocation = string
    }))
  }))
}
variable "rg_info" {}
variable "subnet_info" {}