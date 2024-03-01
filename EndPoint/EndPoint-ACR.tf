# Create Private EndPoint For ACR
resource "azurerm_private_endpoint" "acr-endpoints" {
  name                          = var.EndPoint-ACR-name
  resource_group_name           = var.RG-name
  location                      = var.RG-location
  subnet_id                     = var.InfraSubnet-id
  custom_network_interface_name = "acr-endpoint-nic"

  private_service_connection {
    name                           = "endpoint-acr"
    private_connection_resource_id = var.ACR-id
    subresource_names              = ["registry"]
    is_manual_connection           = false
  }

  ip_configuration {
    member_name        = "registry"
    name               = "ip-acr"
    private_ip_address = var.EndPoint-acr-private-ip
    subresource_name   = "registry"
  }
  ip_configuration {
    member_name        = "registry_data_northeurope"
    name               = "ip-data-acr"
    private_ip_address = var.EndPoint-acr-data-private-ip
    subresource_name   = "registry"
  }
}

# Note:
# Private IP for registry (the ACR itself): [Provide an available static IP address]
# Private IP for registry_data_northeurope (the registry data)