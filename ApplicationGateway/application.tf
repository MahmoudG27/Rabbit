resource "azurerm_public_ip" "gateway" {
  name                = "gateway-pip"
  resource_group_name = var.RG-name
  location            = var.RG-location
  allocation_method   = "Static"
  sku                 = "Standard"
}

# azurerm_application_gateway.web_ag:
resource "azurerm_application_gateway" "aks-gateway" {
  name                = var.Gateway-name
  resource_group_name = var.RG-name
  location            = var.RG-location

  backend_address_pool {
    name = "bepool"
  }

  backend_http_settings {
    cookie_based_affinity               = "Disabled"
    name                                = "setting"
    pick_host_name_from_backend_address = false
    port                                = 80
    protocol                            = "Http"
    request_timeout                     = 30
  }

  frontend_ip_configuration {
    name                          = "appGatewayFrontendIP"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.gateway.id
  }

  frontend_port {
    name = "httpPort"
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.GatewaySubnet-id
  }

  http_listener {
    frontend_ip_configuration_name = "appGatewayFrontendIP"
    frontend_port_name             = "httpPort"
    name                           = "httpListener"
    protocol                       = "Http"
    require_sni                    = false
  }

  request_routing_rule {
    backend_address_pool_name  = "bepool"
    backend_http_settings_name = "setting"
    http_listener_name         = "httpListener"
    name                       = "rule1"
    priority                   = 10010
    rule_type                  = "Basic"
  }

  sku {
    capacity = 2
    name     = "Standard_v2"
    tier     = "Standard_v2"
  }
}

# resource "azurerm_role_assignment" "Attach-Gateway" {
#   principal_id                     = module.AKS.AKS-identity-id
#   role_definition_name             = "Contributor"
#   scope                            = azurerm_application_gateway.aks-gateway.id
#   skip_service_principal_aad_check = true
# }