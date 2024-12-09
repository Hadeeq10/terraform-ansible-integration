resource "azurerm_log_analytics_workspace" "n01662612-law" {
  name                = var.law_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.log_sku
  retention_in_days   = var.retention
  tags                = local.common_tags
}

resource "azurerm_recovery_services_vault" "n01662612-rsv" {
  name                = var.rsv_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = var.vault_sku
  tags                = local.common_tags
}

resource "azurerm_storage_account" "n01662612-sa" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                = local.common_tags
}
