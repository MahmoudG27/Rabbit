# Virtual Network Outputs
output "Vnet-name" {
  value = azurerm_virtual_network.rabbit-vnet.name
}
output "Vnet-id" {
  value = azurerm_virtual_network.rabbit-vnet.id
}


# Infra Subnet Output
output "infraSubnet-id" {
  value = azurerm_subnet.Infra-subnet.id
}

# AKS Cluster Subnet Output
output "ClusterSubnet-id" {
  value = azurerm_subnet.aks-cluster-subnet.id
}

# Application Gateway Subnet Output
output "GatewaySubnet-id" {
  value = azurerm_subnet.aks-gateway-subnet.id
}


# GitHub Runner NIC id
output "Runner-Nic-id" {
  value = [azurerm_network_interface.runner-nic.id]
}

# Kafka NICs id
output "Kafka-Nic-ids" {
  value = [for nic in azurerm_network_interface.kafka-nic : nic.id]
  #  value = [azurerm_network_interface.kafka-nic[count.index].id]
}