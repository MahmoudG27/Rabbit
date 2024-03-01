# Create Private EndPoint to associate to MySQL Server
resource "azurerm_private_endpoint" "mysql-endpoint" {
  name                = var.EndPoint-MySQL-name
  resource_group_name = var.RG-name
  location            = var.RG-location
  subnet_id           = var.InfraSubnet-id

  private_service_connection {
    name                           = "Private-MySQL-Connection"
    private_connection_resource_id = var.Flexbile-MySQL-id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  ip_configuration {
    name               = "MySQL-EndPoint-NIC"
    subresource_name   = "mysqlServer"
    private_ip_address = var.EndPoint-MySQL-private-ip
  }
}

# Create Private EndPoint to associate to Replica MySQL Server
resource "azurerm_private_endpoint" "replica-mysql-endpoint" {
  name                = var.EndPoint-Replica-name
  resource_group_name = var.RG-name
  location            = var.RG-location
  subnet_id           = var.InfraSubnet-id

  private_service_connection {
    name                           = "Private-Replica-MySQL-Connection"
    private_connection_resource_id = var.Replica-MySQL-id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
  ip_configuration {
    name               = "Replica-MySQL-EndPoint-NIC"
    subresource_name   = "mysqlServer"
    private_ip_address = var.EndPoint-Replica-private-ip
  }
}