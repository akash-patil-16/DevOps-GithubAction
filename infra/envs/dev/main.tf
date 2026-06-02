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