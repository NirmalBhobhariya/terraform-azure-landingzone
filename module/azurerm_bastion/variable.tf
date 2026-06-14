variable "bastion_info" {
  type = map(object({
    name       = string
    rg_key     = string
    subnet_key = string
    pip_key    = string

    ip_configuration = object({
      ip_configuration_name = string
    })
  }))
}
variable "rg_info" {}
variable "subnet_info" {}
variable "pip_info" {}