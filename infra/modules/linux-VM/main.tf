data "azurerm_key_vault" "key_vault" {
  name                = "keyvalutapatil"
  resource_group_name = "rg-apatil"
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "vmuser"
  key_vault_id = data.azurerm_key_vault.key_vault.id
}


resource "azurerm_linux_virtual_machine" "linux_main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_DC1s_v3"
  admin_username      = data.azurerm_key_vault_secret.admin_username.value
  admin_password      = data.azurerm_key_vault_secret.admin_password.value
  network_interface_ids = var.network_interface_ids

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}