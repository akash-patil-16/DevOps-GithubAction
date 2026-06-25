resource_group = {
  rg1 = {
    name     = "rg-apatil"
    location = "central india"
  }
}

storage_account = {
  sa1 = {
    name                     = "apatilstorageaccountjune"
    resource_group_key       = "rg1"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

Vnet = {
  vnet1 = {
    name               = "vnet-apatil"
    resource_group_key = "rg1"
    address_space      = ["10.0.0.0/16"]
  }
}

subnet = {
  subnet1 = {
    name               = "frontend-subnet"
    resource_group_key = "rg1"
    vnet_key           = "vnet1"
    address_prefixes   = ["10.0.1.0/24"]
  }

  subnet2 = {
    name               = "backend-subnet"
    resource_group_key = "rg1"
    vnet_key           = "vnet1"
    address_prefixes   = ["10.0.2.0/24"]
  }

  subnet3 = {
    name               = "management-subnet"
    resource_group_key = "rg1"
    vnet_key           = "vnet1"
    address_prefixes   = ["10.0.3.0/24"]
  }
}

pip-VM = {
  # pip1 = {
  #   pip_name           = "pip-frontend"
  #   resource_group_key = "rg1"
  # }
  # pip2 = {
  #   pip_name           = "pip-backend"
  #   resource_group_key = "rg1"
  # }
  pip3 = {
    pip_name           = "pip-netfilx1"
    resource_group_key = "rg1"
  }
  pip4 = {
    pip_name           = "pip-netfilx2"
    resource_group_key = "rg1"
  }
}

nic_VM = {
  # nic1 = {
  #   name               = "nic-apatil"
  #   resource_group_key = "rg1"
  #   subnet_key         = "subnet1"
  #   ip_name            = "internal"
  #   pip_key            = "pip1"
  #   nsg_key            = "nsg1"
  # }

  # nic2 = {
  #   name               = "nic-linux-apatil"
  #   resource_group_key = "rg1"
  #   subnet_key         = "subnet2"
  #   ip_name            = "internal-linux"
  #   pip_key            = "pip2"
  #   nsg_key            = "nsg2"
  # }

    nic3 = {
    name               = "nic-netfilx1-apatil"
    resource_group_key = "rg1"
    subnet_key         = "subnet1"
    ip_name            = "netfilx1-linux"
    pip_key            = "pip3"
    nsg_key            = "nsg3"
  }

    nic4 = {
    name               = "nic-netfilx2-apatil"
    resource_group_key = "rg1"
    subnet_key         = "subnet1"
    ip_name            = "netfilx2-linux"
    pip_key            = "pip4"
    nsg_key            = "nsg4"
  }
}

windows-VM = {
  vm1 = {
    name               = "vm-apatil"
    resource_group_key = "rg1"
    nic_VM_key         = "nic1"
  }
}

nsg_VM = {
  nsg1 = {
    nsg_name           = "nsg-frontend"
    resource_group_key = "rg1"
  }
  # nsg2 = {
  #   nsg_name           = "nsg-backend"
  #   resource_group_key = "rg1"
  # }

  nsg3 = {
    nsg_name           = "nsg-netfilx1"
    resource_group_key = "rg1"
  }

  nsg4 = {
  nsg_name           = "nsg-netfilx2"
  resource_group_key = "rg1"
  }
}

linux-VM = {
  # linux_vm1 = {
  #   name               = "linux-vm-apatil"
  #   resource_group_key = "rg1"
  #   nic_VM_key         = "nic2"
  # }

  linux_vm2 = {
    name               = "linux-vm-netfilx1"
    resource_group_key = "rg1"
    nic_VM_key         = "nic3"
  }
  
  linux_vm3 = {
    name               = "linux-vm-netfilx2"
    resource_group_key = "rg1"
    nic_VM_key         = "nic4"
  }
}

Vnet-peering = {
  peering1 = {
    peering_name              = "peering-dev-to-qa"
    resource_group_key        = "rg1"
    vnet_key                  = "vnet1"
    remote_virtual_network_id = "/subscriptions/26ea2bd3-a3fc-4737-96b0-928cd80584a8/resourceGroups/rg-apatil/providers/Microsoft.Network/virtualNetworks/vnet-apatil-qa"
  }
}
