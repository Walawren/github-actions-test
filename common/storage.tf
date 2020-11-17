data azurerm_storage_account storage {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.rgrp.name
}

module storage_account_network_rules {
  source = "git::git@github.com:ecarlson94/storage-account-network-rules.git"

  resource_group_name                        = data.azurerm_resource_group.rgrp.name
  storage_account_name                       = data.azurerm_storage_account.storage.name
  add_prod_concourse_subn_to_storage_account = false
  add_dev_concourse_subn_to_storage_account  = false
  office_codes                               = ["mine"]
}
