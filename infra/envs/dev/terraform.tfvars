resource_group = {
  rg1 = {
    name     = "rg-apatil"
    location = "central us"
  }
}

storage_account = {
  sa1 = {
    name                     = "apatilstorageaccount"
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
  pip1 = {
    pip_name            = "pip-frontend"
    resource_group_key   = "rg1"
  }
}

nic_VM = {
  nic1 = {
    name               = "nic-apatil"
    resource_group_key = "rg1"
    subnet_key         = "subnet1"
    ip_name            = "internal"
    pip_key            = "pip1"
  }
}

windows-VM = {
  vm1 = {
    name               = "vm-apatil"
    resource_group_key = "rg1"
    nic_VM_key         = "nic1"
  }
}