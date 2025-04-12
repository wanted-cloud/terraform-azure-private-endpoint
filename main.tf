/*
 * # wanted-cloud/terraform-azure-private-endpoint
 * 
 * Terraform building block module helping you manage Azure Private Endpoint.
 */

resource "azurerm_private_endpoint" "this" {
  name                = var.name
  location            = var.location != "" ? var.location : data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  subnet_id           = data.azurerm_subnet.this.id

  custom_network_interface_name = var.custom_network_interface_name
  tags                          = merge(local.metadata.tags, var.tags)

  dynamic "private_dns_zone_group" {
    for_each = var.private_dns_zone_group != null ? [1] : []

    content {
      name                 = var.private_dns_zone_group.name
      private_dns_zone_ids = var.private_dns_zone_group.private_dns_zone_ids
    }

  }

  dynamic "private_service_connection" {
    for_each = var.private_service_connection != null ? [1] : []

    content {
      name                              = var.private_service_connection.name
      private_connection_resource_id    = var.private_service_connection.private_connection_resource_id
      is_manual_connection              = var.private_service_connection.is_manual_connection
      subresource_names                 = var.private_service_connection.subresource_names
      request_message                   = var.private_service_connection.request_message
      private_connection_resource_alias = var.private_service_connection.private_connection_resource_alias
    }
  }

  dynamic "ip_configuration" {
    for_each = { for ip_configuration in var.ip_configuration : ip_configuration.name => ip_configuration
    }

    content {
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      subresource_name   = ip_configuration.value.subresource_name
      member_name        = ip_configuration.value.member_name
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_private_endpoint"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_private_endpoint"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_private_endpoint"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_private_endpoint"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}