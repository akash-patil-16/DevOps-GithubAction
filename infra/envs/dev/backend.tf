terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg_tfpatil"
    storage_account_name = "aptfstorageaccountjune"
    container_name       = "devtfstate"
    key                  = "terraform.tfstate"
  }
}
