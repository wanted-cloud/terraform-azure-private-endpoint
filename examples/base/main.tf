module "example" {
    source = "../.."
    name   = "example"
    resource_group_name = "example-rg"
    subnet              = {
        name                = "default"
        resource_group_name = "test"
        virtual_network_name = "gl-vnet-test-001"
    }

    private_service_connection = {
      name = "example"
      private_connection_resource_id = "/subscriptions/4c9233a8-b427-4590-8320-71830d3eac1f/resourcegroups/test/providers/Microsoft.Storage/storageAccounts/wntdtestsa"
    }
}