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