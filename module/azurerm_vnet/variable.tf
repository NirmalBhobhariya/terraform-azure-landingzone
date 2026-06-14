variable "vnet_info" {
  type = map(object({
    name = string
    address_space = list(string)
    rg_key = string
  }))
}
variable "rg_info" {}