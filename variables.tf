variable "name" {
  description = "The name of the private endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the private endpoint."
  type        = string
}

variable "subnet" {
  description = "The object of the subnet reference in which to create the private endpoint."
  type = object({
    name                 = string
    resource_group_name  = optional(string)
    virtual_network_name = string
  })
}

variable "location" {
  description = "The Azure location in which to create the private endpoint, if not set location will be taken from resource group."
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the private endpoint."
  type        = map(string)
  default     = {}
}

variable "custom_network_interface_name" {
  description = "The name of the network interface to create for the private endpoint."
  type        = string
  default     = ""
}

variable "private_dns_zone_group" {
  description = "A map of private DNS zone groups to assign to the private endpoint."
  type = object({
    name                 = string
    resource_group_name  = optional(string)
    private_dns_zone_ids = list(string)
  })
  default = null
}

variable "private_service_connection" {
  description = "A map of private service connections to assign to the private endpoint."
  type = object({
    name                              = string
    private_connection_resource_id    = string
    private_connection_resource_alias = optional(string)
    is_manual_connection              = optional(bool, false)
    subresource_names                 = optional(list(string), [])
    request_message                   = optional(string)
  })
  default = null
}

variable "ip_configuration" {
  description = "A map of IP configurations to assign to the private endpoint."
  type = list(object({
    name               = string
    private_ip_address = optional(string)
    member_name        = optional(string)
    subresource_name   = optional(string)
  }))
  default = []

}