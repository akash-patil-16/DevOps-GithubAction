module "resource-group" {
  source   = "../../modules/resource-group"
  for_each = var.resource_group
  name     = each.value.name
  location = each.value.location
}


module "storage-account" {
  source                   = "../../modules/storage-account"
  for_each                 = var.storage_account
  name                     = each.value.name
  resource_group_name      = module.resource-group[each.value.resource_group_key].name
  location                 = module.resource-group[each.value.resource_group_key].location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}

module "Vnet" {

  source              = "../../modules/Vnet"
  for_each            = var.Vnet
  name                = each.value.name
  resource_group_name = module.resource-group[each.value.resource_group_key].name
  location            = module.resource-group[each.value.resource_group_key].location
  address_space       = each.value.address_space
}

module "subnet" {
  source               = "../../modules/subnet"
  depends_on           = [module.Vnet]
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = module.resource-group[each.value.resource_group_key].name
  virtual_network_name = module.Vnet[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}

module "pip-VM" {
  source              = "../../modules/pip-VM"
  for_each            = var.pip-VM
  pip_name            = each.value.pip_name
  resource_group_name = module.resource-group[each.value.resource_group_key].name
  location            = module.resource-group[each.value.resource_group_key].location
}

module "nsg-VM" {
  source              = "../../modules/nsg-VM"
  for_each            = var.nsg_VM
  nsg_name            = each.value.nsg_name
  location            = module.resource-group[each.value.resource_group_key].location
  resource_group_name = module.resource-group[each.value.resource_group_key].name
}

module "nic-VM" {
  source               = "../../modules/nic-VM"
  for_each             = var.nic_VM
  name                 = each.value.name
  location             = module.resource-group[each.value.resource_group_key].location
  resource_group_name  = module.resource-group[each.value.resource_group_key].name
  subnet_id            = module.subnet[each.value.subnet_key].id
  ip_name              = each.value.ip_name
  public_ip_address_id = module.pip-VM[each.value.pip_key].id
  nsg_id               = module.nsg-VM[each.value.nsg_key].id
}

# module "windows-VM" {
#   source                = "../../modules/windows-VM"
#   for_each              = var.windows-VM
#   name                  = each.value.name
#   location              = module.resource-group[each.value.resource_group_key].location
#   resource_group_name   = module.resource-group[each.value.resource_group_key].name
#   network_interface_ids = [module.nic-VM[each.value.nic_VM_key].id]
#   admin_username        = var.admin_username
#   admin_password        = var.admin_password
# }

module "linux-VM" {
  source                = "../../modules/linux-VM"
  for_each              = var.linux-VM
  name                  = each.value.name
  location              = module.resource-group[each.value.resource_group_key].location
  resource_group_name   = module.resource-group[each.value.resource_group_key].name
  network_interface_ids = [module.nic-VM[each.value.nic_VM_key].id]
  admin_username        = var.admin_username
  admin_password        = var.admin_password

}

module "Vnet-peering" {
  source                    = "../../modules/Vnet-peering"
  for_each                  = var.Vnet-peering
  peering_name              = each.value.peering_name
  resource_group_name       = module.resource-group[each.value.resource_group_key].name
  virtual_network_name      = module.Vnet[each.value.vnet_key].name
  remote_virtual_network_id = each.value.remote_virtual_network_id
}
