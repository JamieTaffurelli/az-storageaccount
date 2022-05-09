data "azurerm_log_analytics_workspace" "logs" {
  name                = var.log_analytics_workspace_name
  resource_group_name = var.log_analytics_workspace_resource_group_name
}

resource "azurerm_storage_account" "storage" {
  name                      = var.storage_account_name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  account_kind              = "StorageV2"
  account_tier              = "Standard"
  account_replication_type  = var.replication_type
  access_tier               = "Hot"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_nested_items_to_be_public  = var.allow_public_blob_access
  shared_access_key_enabled = var.shared_access_key_enabled

  blob_properties {

    delete_retention_policy {
      days = var.delete_retention_policy
    }

    container_delete_retention_policy {
      days = var.container_delete_retention_policy
    }
  }

  identity {
    type = "SystemAssigned"
  }
  tags = var.tags
}

resource "azurerm_storage_account_network_rules" "rules" {
  storage_account_id         = azurerm_storage_account.storage.id
  default_action             = var.network_acl_default_action
  ip_rules                   = var.ip_rules
  virtual_network_subnet_ids = var.virtual_network_subnet_ids
  bypass                     = var.network_acl_bypass
}

resource "azurerm_monitor_diagnostic_setting" "storage_account_diagnostics" {
  name                       = "security-logging"
  target_resource_id         = azurerm_storage_account.storage.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  metric {
    category = "Transaction"

    retention_policy {
      enabled = true
      days    = 365
    }
  }
}

locals {
  storageDiagnostics = ["blobServices", "fileServices", "tableServices", "queueServices"]
}

resource "azurerm_monitor_diagnostic_setting" "storage_account_child_diagnostics" {
  for_each                   = toset(local.storageDiagnostics)
  name                       = "security-logging"
  target_resource_id         = "${azurerm_storage_account.storage.id}/${each.value}/default/"
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.logs.id

  log {
    category = "StorageRead"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  log {
    category = "StorageWrite"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  log {
    category = "StorageDelete"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }

  metric {
    category = "Transaction"
    enabled  = true

    retention_policy {
      enabled = true
      days    = 365
    }
  }
}
