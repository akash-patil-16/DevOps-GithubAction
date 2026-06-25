resource "azurerm_linux_virtual_machine" "linux_main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_DC1s_v3"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = var.network_interface_ids

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}