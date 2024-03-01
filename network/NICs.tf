#Create Private Network Interface for GitHub Runner VM
resource "azurerm_network_interface" "runner-nic" {
  name                = "Runner-nic"
  resource_group_name = var.RG-name
  location            = var.RG-location

  ip_configuration {
    name                          = "runner-nic-config"
    subnet_id                     = azurerm_subnet.Infra-subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.Runner-PrivateIP
  }
}

#Create Private Network Interfaces for Kafka VMs
resource "azurerm_network_interface" "kafka-nic" {
  count               = 3
  name                = "kafka-nic-${count.index}"
  resource_group_name = var.RG-name
  location            = var.RG-location

  ip_configuration {
    name                          = "kafka-nic-config-${count.index}"
    subnet_id                     = azurerm_subnet.Infra-subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.Kafka-PrivateIPs[count.index]
  }
}