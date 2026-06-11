variable "resource_group_name" {
  description = "The name of the resource group where the virtual network is located."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network to peer."
  type        = string
}

variable "remote_virtual_network_id" {
  description = "The ID of the remote virtual network to peer with."
  type        = string
}

variable "peering_name" {
  description = "The name of the virtual network peering."
  type        = string
}