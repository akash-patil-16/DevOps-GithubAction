variable "name" {
    description = "Name of the Windows Virtual Machine"
    type        = string
}

variable "resource_group_name" {
    description = "Name of the Resource Group where the VM will be created"
    type        = string
}

variable "location" {
    description = "Azure region where the VM will be created"
    type        = string
}

variable "network_interface_ids" {
    description = "List of Network Interface IDs to attach to the VM"
    type        = list(string)
}

variable "admin_username"{
    description = "Admin username for the Windows VM"
    type        = string
}

variable "admin_password"{
    description = "Admin password for the Windows VM"
    type        = string
    sensitive   = true
}