resource "azurerm_resource_group" "rg_main"{
    name     = var.name
    location = var.location
}