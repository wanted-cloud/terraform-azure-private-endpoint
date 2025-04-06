<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-private-endpoint

Terraform building block module helping you manage Azure Private Endpoint.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=4.20.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=4.20.0)

## Required Inputs

The following input variables are required:

### <a name="input_name"></a> [name](#input\_name)

Description: The name of the private endpoint.

Type: `string`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: The name of the resource group in which to create the private endpoint.

Type: `string`

### <a name="input_subnet"></a> [subnet](#input\_subnet)

Description: The object of the subnet reference in which to create the private endpoint.

Type:

```hcl
object({
    name                 = string
    resource_group_name  = optional(string)
    virtual_network_name = string
  })
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_custom_network_interface_name"></a> [custom\_network\_interface\_name](#input\_custom\_network\_interface\_name)

Description: The name of the network interface to create for the private endpoint.

Type: `string`

Default: `""`

### <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration)

Description: A map of IP configurations to assign to the private endpoint.

Type:

```hcl
list(object({
    name               = string
    private_ip_address = optional(string)
    member_name        = optional(string)
    subresource_name   = optional(string)
  }))
```

Default: `[]`

### <a name="input_location"></a> [location](#input\_location)

Description: The Azure location in which to create the private endpoint, if not set location will be taken from resource group.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_private_dns_zone_group"></a> [private\_dns\_zone\_group](#input\_private\_dns\_zone\_group)

Description: A map of private DNS zone groups to assign to the private endpoint.

Type:

```hcl
object({
    name                 = string
    resource_group_name  = optional(string)
    private_dns_zone_ids = list(string)
  })
```

Default: `null`

### <a name="input_private_service_connection"></a> [private\_service\_connection](#input\_private\_service\_connection)

Description: A map of private service connections to assign to the private endpoint.

Type:

```hcl
object({
    name                              = string
    private_connection_resource_id    = string
    private_connection_resource_alias = optional(string)
    is_manual_connection              = optional(bool, false)
    subresource_names                 = optional(list(string), [])
    request_message                   = optional(string)
  })
```

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: A map of tags to assign to the private endpoint.

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_private_endpoint"></a> [private\_endpoint](#output\_private\_endpoint)

Description: Object value of the private endpoint.

## Resources

The following resources are used by this module:

- [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_endpoint) (resource)
- [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) (data source)
- [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/private-endpoint/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
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
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->