# Replica MySQL Server
resource "azurerm_mysql_flexible_server" "Replica-MySQL-server" {
  name                = var.Replica-MySQL-name
  resource_group_name = var.RG-name
  location            = var.RG-location
  zone                = "3"
  create_mode         = "Replica"
  source_server_id    = azurerm_mysql_flexible_server.MySQL-server.id
}