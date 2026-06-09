resource "azurerm_windows_virtual_machine" "vm_main" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2ds_v4"  // check avaliable sizes with: az vm list-skus --location centralus --resource-type virtualMachines -o table 
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids =  var.network_interface_ids

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-10"
    sku       = "win10-22h2-pro"
    version   = "latest"
  }
}