//private_ip_address_allocation = "Dynamic" → VM ला subnet मधून private IP मिळेल.
//NIC : Azure मध्ये NIC (Network Interface Card) म्हणजे VM चा network adapter. VM ला network शी connect करण्यासाठी NIC लागतो.
resource "azurerm_network_interface" "nic_main" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    # public_ip_address_id          = var.public_ip_address_id
  }
}


# resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
#   network_interface_id      = azurerm_network_interface.nic_main.id
#   network_security_group_id = var.nsg_id
# }