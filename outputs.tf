output "storage_account_id" {
  value       = azurerm_storage_account.storage.id
  description = "Resource ID of the Storage Account"
}

output "storage_account_location" {
  value       = azurerm_storage_account.storage.location
  description = "Location of the Storage Account"
}

output "storage_account_kind" {
  value       = azurerm_storage_account.storage.account_kind
  description = "Kind of the Storage Account"
}

output "storage_account_tier" {
  value       = azurerm_storage_account.storage.account_tier
  description = "Tier of the Storage Account"
}

output "storage_account_replication_type" {
  value       = azurerm_storage_account.storage.account_replication_type
  description = "Replication type of the Storage Account"
}

output "storage_account_access_tier" {
  value       = azurerm_storage_account.storage.access_tier
  description = "Access tier of the Storage Account"
}

output "storage_account_enable_https_traffic_only" {
  value       = azurerm_storage_account.storage.enable_https_traffic_only
  description = "HTTPS only traffic is enabled for Storage Account"
}

output "storage_account_min_tls_version" {
  value       = azurerm_storage_account.storage.min_tls_version
  description = "Min TLS version of Storage Account"
}

output "storage_account_allow_nested_items_to_be_public" {
  value       = azurerm_storage_account.storage.allow_nested_items_to_be_public
  description = "Allow public access to the Storage Account"
}

output "storage_account_primary_blob_endpoint" {
  value       = azurerm_storage_account.storage.primary_blob_endpoint
  description = "Primary blob endpoint of the Storage Account"
}

output "storage_account_primary_blob_host" {
  value       = azurerm_storage_account.storage.primary_blob_host 
  description = "Primary blob host of the Storage Account"
}

output "storage_account_secondary_blob_endpoint" {
  value       = azurerm_storage_account.storage.secondary_blob_endpoint
  description = "Secondary blob endpoint of the Storage Account"
}

output "storage_account_secondary_blob_host" {
  value       = azurerm_storage_account.storage.secondary_blob_host
  description = "Secondary blob endpoint of the Storage Account"
}
