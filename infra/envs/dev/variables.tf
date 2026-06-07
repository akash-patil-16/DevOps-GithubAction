variable "resource_group" {
  type = map(object({
    name     = string
    location = string
  }))
}

variable "storage_account" {
  type = map(object({
    name                     = string
    account_tier             = string
    account_replication_type = string
    resource_group_key       = string
  }))
}

variable "Vnet" {
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
  }))
}