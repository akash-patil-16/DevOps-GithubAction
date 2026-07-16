terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg_main" {
  name     = "rg_tfpatil"
  location = "central india"
}

resource "azurerm_storage_account" "statefile_backend" {
  name                     = "aptfstorageaccountjune"
  resource_group_name      = azurerm_resource_group.rg_main.name
  location                 = azurerm_resource_group.rg_main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}