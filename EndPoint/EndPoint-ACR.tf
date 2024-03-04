# Create Private EndPoint For ACR
resource "azurerm_private_endpoint" "acr_private_endpoint" {
  name                = "demo-acr"
  resource_group_name = var.RG-name
  location            = var.RG-location
  subnet_id           = var.InfraSubnet-id

  private_service_connection {
    is_manual_connection           = false
    name                           = "acr-endpo"
    private_connection_resource_id = var.ACR-id
    subresource_names              = ["registry"]
  }

  private_dns_zone_group {
    name = "private-dns-zone-group"
    private_dns_zone_ids = [
      var.DNS-ACR-id
    ]
  }
}