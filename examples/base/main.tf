module "template" {
    source = "../.."
    name   = "example"
    
    resource_group_name = "example-rg"
    subnet              = {
        name                = "example-subnet"
        resource_group_name = "example-rg"
        virtual_network_name = "example-vnet"
    }
}