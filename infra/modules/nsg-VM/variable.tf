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

variable "security_rules" {
default [
    {
      name                       = "AllowSSH"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "AllowHTTP"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}