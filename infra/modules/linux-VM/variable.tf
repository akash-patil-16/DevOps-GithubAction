variable "name"{
  description = "The name of the Linux Virtual Machine."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Virtual Machine."
  type        = string
}

variable "location" {
  description = "The Azure region in which to create the Linux Virtual Machine."
  type        = string
}

variable "admin_username" {
  description = "The admin username for the Linux Virtual Machine."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Linux Virtual Machine."
  type        = string
  sensitive   = true
}

variable "network_interface_ids" {
  description = "A list of network interface IDs to associate with the Linux Virtual Machine."
  type        = list(string)
}