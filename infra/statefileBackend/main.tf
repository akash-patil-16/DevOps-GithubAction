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

resource "azurerm_resource_group" "rg_statefile_backend" {
  name     = "rg_tfpatil"
  location = "central india"
}

resource "azurerm_storage_account" "statefile_backend" {
  name                     = "aptfstorageaccountjuly"
  resource_group_name      = azurerm_resource_group.rg_main.name
  location                 = azurerm_resource_group.rg_main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_statefile_backend" {
  name                  = "devtfstate"
  storage_account_id    = azurerm_storage_account.statefile_backend.id
  container_access_type = "private"
}