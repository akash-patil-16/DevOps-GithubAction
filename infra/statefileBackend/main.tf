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
  key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
}

resource "azurerm_resource_group" "rg_statefile_backend" {
  name     = "rg_tfpatil"
  location = "central india"
}

resource "azurerm_storage_account" "statefile_backend" {
  name                     = "aptfstorageaccountjuly"
  resource_group_name      = azurerm_resource_group.rg_statefile_backend.name
  location                 = azurerm_resource_group.rg_statefile_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container_statefile_backend" {
  name                  = "devtfstate"
  storage_account_id    = azurerm_storage_account.statefile_backend.id
  container_access_type = "private"
}


data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault_statefile_backend" {
  name                        = "keyvalutapatil"
  resource_group_name         = azurerm_resource_group.rg_statefile_backend.name
  location                    = azurerm_resource_group.rg_statefile_backend.location
  sku_name                    = "standard"
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = false
}

resource "azurerm_key_vault_secret" "secret_statefile_backend" {
  name         = "vmpassword"
  value        = "Akash@12345@"
  key_vault_id = azurerm_key_vault.keyvault_statefile_backend.id
}

resource "azurerm_key_vault_secret" "secret_backend" {
  name         = "vmuser"
  value        = "adminakash"
  key_vault_id = azurerm_key_vault.keyvault_statefile_backend.id
}