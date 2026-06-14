variable "rg_info" {
  type = map(object({
    name     = string
    location = string
  }))
}