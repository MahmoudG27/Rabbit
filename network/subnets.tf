resource "azurerm_subnet" "Infra-subnet" {
  name                 = var.InfraSubnet-Name
  resource_group_name  = var.RG-name
  virtual_network_name = azurerm_virtual_network.rabbit-vnet.name
  address_prefixes     = [var.InfraSubnet-address]
}

resource "azurerm_subnet" "aks-cluster-subnet" {
  name                 = var.ClusterSubnet-name
  resource_group_name  = var.RG-name
  virtual_network_name = azurerm_virtual_network.rabbit-vnet.name
  address_prefixes     = [var.ClusterSubnet-address]
}

resource "azurerm_subnet" "aks-gateway-subnet" {
  name                 = var.Gateway-name
  resource_group_name  = var.RG-name
  virtual_network_name = azurerm_virtual_network.rabbit-vnet.name
  address_prefixes     = [var.Gateway-address]
}