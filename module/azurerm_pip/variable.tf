variable "pip_info" {
  type = map(object({
    name              = string
    rg_key            = string
    allocation_method = string
    sku               = string
  }))
}

variable "rg_info" {}