variable "nsg_info" {
  type = map(object({
    name                = string
    rg_key = string
    security_rule_info = list(object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    }))
  }))
}
variable "rg_info" {}