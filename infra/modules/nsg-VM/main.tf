resource "azurerm_network_security_group" "nsg_main"{
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "test-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*" //RDP : 3389  SSH : 22 HTTP : 80 HTTPS : 443
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  } 
}