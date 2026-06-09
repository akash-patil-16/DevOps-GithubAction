variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "location" {
  description = "Location of the Network Security Group"
  type        = string
}

variable "resource_group_name" {
    description = "Resource Group Name where the Network Security Group will be created"
    type        = string
}