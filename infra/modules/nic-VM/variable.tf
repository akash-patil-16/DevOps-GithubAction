variable "name"{
    description = "Name of the Network Interface"
    type        = string
}

variable "location"{
    description = "Location of the Network Interface"
    type        = string
}

variable "resource_group_name"{
    description = "Name of the Resource Group"
    type        = string
}

variable "subnet_id"{
    description = "ID of the Subnet"
    type        = string
}

variable "ip_name"{
    description = "Name of the IP Configuration"
    type        = string
}

variable "private_ip_address_allocation"{
    description = "Allocation method for the private IP address (Dynamic or Static)"
    type        = string
    default     = "Dynamic"
}

variable "public_ip_address_id"{
    description = "ID of the Public IP address to associate with the NIC"
    type        = string
}