# Azure Storage Account

This repo contains a [Terraform](https://www.terraform.io/) module that defines a general-purpose V2 storage account.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.2.3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.storage_account_child_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_monitor_diagnostic_setting.storage_account_diagnostics](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |
| [azurerm_storage_account.storage](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_account_network_rules.rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account_network_rules) | resource |
| [azurerm_log_analytics_workspace.logs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/log_analytics_workspace) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allow_public_blob_access"></a> [allow\_public\_blob\_access](#input\_allow\_public\_blob\_access) | Allow unauthenticated access to blobs | `bool` | `false` | no |
| <a name="input_container_delete_retention_policy"></a> [container\_delete\_retention\_policy](#input\_container\_delete\_retention\_policy) | Days to keep containers in a soft-delete state | `number` | `30` | no |
| <a name="input_delete_retention_policy"></a> [delete\_retention\_policy](#input\_delete\_retention\_policy) | Days to keep blobs in a soft-delete state | `number` | `30` | no |
| <a name="input_ip_rules"></a> [ip\_rules](#input\_ip\_rules) | List of IP addresses or CIDR blocks to add to ACL | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the Virtual Network | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Name of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_resource_group_name"></a> [log\_analytics\_workspace\_resource\_group\_name](#input\_log\_analytics\_workspace\_resource\_group\_name) | Resource Group of Log Analytics Workspace to send diagnostics | `string` | n/a | yes |
| <a name="input_network_acl_bypass"></a> [network\_acl\_bypass](#input\_network\_acl\_bypass) | Allow trusted Azure, logging and metrics services to bypass network ACLs | `list(string)` | <pre>[<br>  "Logging",<br>  "Metrics",<br>  "AzureServices"<br>]</pre> | no |
| <a name="input_network_acl_default_action"></a> [network\_acl\_default\_action](#input\_network\_acl\_default\_action) | Default action to take if no rule match from IPs or subnets | `string` | `"Deny"` | no |
| <a name="input_replication_type"></a> [replication\_type](#input\_replication\_type) | Type of replication for the Storage Account | `string` | `"LRS"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource Group name to deploy to | `string` | n/a | yes |
| <a name="input_shared_access_key_enabled"></a> [shared\_access\_key\_enabled](#input\_shared\_access\_key\_enabled) | Allow access to Storage Account with access key, not just AAD | `bool` | `true` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Name of the Storage Account to deploy | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply | `map(string)` | n/a | yes |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | List of subnet resource IDs to add to ACL | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_storage_account_access_tier"></a> [storage\_account\_access\_tier](#output\_storage\_account\_access\_tier) | Access tier of the Storage Account |
| <a name="output_storage_account_allow_nested_items_to_be_public"></a> [storage\_account\_allow\_nested\_items\_to\_be\_public](#output\_storage\_account\_allow\_nested\_items\_to\_be\_public) | Allow public access to the Storage Account |
| <a name="output_storage_account_enable_https_traffic_only"></a> [storage\_account\_enable\_https\_traffic\_only](#output\_storage\_account\_enable\_https\_traffic\_only) | HTTPS only traffic is enabled for Storage Account |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | Resource ID of the Storage Account |
| <a name="output_storage_account_kind"></a> [storage\_account\_kind](#output\_storage\_account\_kind) | Kind of the Storage Account |
| <a name="output_storage_account_location"></a> [storage\_account\_location](#output\_storage\_account\_location) | Location of the Storage Account |
| <a name="output_storage_account_min_tls_version"></a> [storage\_account\_min\_tls\_version](#output\_storage\_account\_min\_tls\_version) | Min TLS version of Storage Account |
| <a name="output_storage_account_primary_blob_endpoint"></a> [storage\_account\_primary\_blob\_endpoint](#output\_storage\_account\_primary\_blob\_endpoint) | Primary blob endpoint of the Storage Account |
| <a name="output_storage_account_primary_blob_host"></a> [storage\_account\_primary\_blob\_host](#output\_storage\_account\_primary\_blob\_host) | Primary blob host of the Storage Account |
| <a name="output_storage_account_replication_type"></a> [storage\_account\_replication\_type](#output\_storage\_account\_replication\_type) | Replication type of the Storage Account |
| <a name="output_storage_account_secondary_blob_endpoint"></a> [storage\_account\_secondary\_blob\_endpoint](#output\_storage\_account\_secondary\_blob\_endpoint) | Secondary blob endpoint of the Storage Account |
| <a name="output_storage_account_secondary_blob_host"></a> [storage\_account\_secondary\_blob\_host](#output\_storage\_account\_secondary\_blob\_host) | Secondary blob endpoint of the Storage Account |
| <a name="output_storage_account_tier"></a> [storage\_account\_tier](#output\_storage\_account\_tier) | Tier of the Storage Account |
<!-- END_TF_DOCS -->