variable "name" {
  description = "Name of the storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Location of the storage account"
  type        = string
}

variable "account_tier" {
  description = "The account tier of the storage account"
  type        = string
}

variable "account_replication_type"{
  description = "The replication type of the storage account"
  type        = string
}