resource "azurerm_dns_zone" "rabbit-dns" {
  name                = "rabbit.com"
  resource_group_name = var.RG-name
}

resource "azurerm_role_assignment" "dns-aks" {
  principal_id                     = module.AKS.AKS-identity-id
  role_definition_name             = "Contributor"
  scope                            = azurerm_dns_zone.rabbit-dns.id
  skip_service_principal_aad_check = true
}