data "azurerm_subnet" "this" {
  name                 = var.subnet.name
  virtual_network_name = var.subnet.virtual_network_name
  resource_group_name  = var.subnet.resource_group_name != "" ? var.subnet.resource_group_name : data.azurerm_resource_group.this.name
}