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

  private_service_connection {
    name                              = var.private_service_connection.name
    private_connection_resource_id    = var.private_service_connection.private_connection_resource_id
    is_manual_connection              = var.private_service_connection.is_manual_connection
    subresource_names                 = var.private_service_connection.subresource_names
    request_message                   = var.private_service_connection.request_message
    private_connection_resource_alias = var.private_service_connection.private_connection_resource_alias
  }
}