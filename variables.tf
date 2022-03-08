variable "resource_group_name" {
  type        = string
  description = "Resource Group name to deploy to"
}

variable "location" {
  type        = string
  description = "Location of the Virtual Network"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Storage Account to deploy"
}

variable "replication_type" {
  type    = string
  default = "LRS"

  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RAGRS"], image.replication_type)
    error_message = "replication_type must be LRS, GRS, RAGRS, ZRS, GZRS or RAGRS"
  }
  description = "Type of replication for the Storage Account"
}

variable "allow_public_blob_access" {
  type        = bool
  default     = false
  description = "Allow unauthenticated access to blobs"
}

variable "shared_access_key_enabled" {
  type        = bool
  default     = true
  description = "Allow access to Storage Account with access key, not just AAD"
}

variable "delete_retention_policy" {
  type        = number
  default     = 30
  description = "Days to keep blobs in a soft-delete state"
}

variable "container_delete_retention_policy" {
  type        = number
  default     = 30
  description = "Days to keep containers in a soft-delete state"
}

variable "container_delete_retention_policy" {
  type        = number
  default     = 30
  description = "Days to keep containers in a soft-delete state"
}

variable "network_acl_bypass" {
  type    = string
  default = ["None"]
  validation {
    condition     = contains(["Metrics", "Logging", "AzureServices", "None"], var.network_acl_bypass)
    error_message = "Bypass must be None or a combination of Metrics, Logging and AzureServices"
  }
  description = "Allow trusted Azure, logging and metrics services to bypass network ACLs"
}

variable "network_acl_default_action" {
  type    = string
  default = "Deny"

  validation {
    condition     = contains(["Allow", "Deny"], var.network_acl_default_action)
    error_message = "Bypass must be Allow or Deny"
  }
  description = "Default action to take if no rule match from IPs or subnets"
}

variable "ip_rules" {
  type        = list(string)
  default     = []
  description = "List of IP addresses or CIDR blocks to add to ACL"
}

variable "virtual_network_subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet resource IDs to add to ACL"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of Log Analytics Workspace to send diagnostics"
}

variable "log_analytics_workspace_resource_group_name" {
  type        = string
  description = "Resource Group of Log Analytics Workspace to send diagnostics"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
}
