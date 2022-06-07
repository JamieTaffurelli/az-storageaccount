package test

import (
	"testing"

	"github.com/stretchr/testify/assert"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestIT_OutputsAreCorrect(t *testing.T) {
	t.Parallel()

	tfOptions := &terraform.Options{
		TerraformDir: "../../",
		Vars: map[string]interface{}{
			"resource_group_name":                         "testrg",
			"location":                                    "francecentral",
			"storage_account_name":                        "testsajdbfib",
			"log_analytics_workspace_name":                "sdasdad",
			"log_analytics_workspace_resource_group_name": "testrg",
			"tags": map[string]string{},
		},
		NoColor: true,
	}

	defer terraform.Destroy(t, tfOptions)

	terraform.InitAndApply(t, tfOptions)

	assert.Equal(t, "StorageV2", terraform.Output(t, tfOptions, "storage_account_kind"), "Storage Account kind should be correct")
	assert.Equal(t, "Standard", terraform.Output(t, tfOptions, "storage_account_tier"), "Storage Account tier should be correct")
	assert.Equal(t, "LRS", terraform.Output(t, tfOptions, "storage_account_replication_type"), "Storage Account replication type should be correct")
	assert.Equal(t, "Hot", terraform.Output(t, tfOptions, "storage_account_access_tier"), "Storage Account access tier should be correct")
	assert.Equal(t, "true", terraform.Output(t, tfOptions, "storage_account_enable_https_traffic_only"), "Storage Account https setting should be correct")
	assert.Equal(t, "TLS1_2", terraform.Output(t, tfOptions, "storage_account_min_tls_version"), "Storage Account TLS setting should be correct")
	assert.Equal(t, "false", terraform.Output(t, tfOptions, "storage_account_allow_nested_items_to_be_public"), "Storage Account public nested items should be correct")
}
