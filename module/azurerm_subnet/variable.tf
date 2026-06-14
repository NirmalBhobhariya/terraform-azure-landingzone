variable "subnet_info" {
  type = map(object({
    name                 = string
    address_prefixes     = list(string)
    rg_key               = string
    vnet_key             = string
  }))
}
variable "rg_info" {}
variable "vnet_info" {}