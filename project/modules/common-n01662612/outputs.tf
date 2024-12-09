output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.n01662612-law.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.n01662612-rsv.name
}

output "storage_account_name" {
  value = azurerm_storage_account.n01662612-sa.name
}

output "storage_account_primary_blob_endpoint" {
  value = azurerm_storage_account.n01662612-sa.primary_blob_endpoint
}
