# Create an Azure MySQL flexible server with Standby Server
resource "azurerm_mysql_flexible_server" "MySQL-server" {
  name                   = var.MySQL-name
  administrator_login    = var.MySQL-user
  administrator_password = var.MySQL-user-password
  resource_group_name    = var.RG-name
  location               = var.RG-location
  sku_name               = var.MySQL-sku
  version                = var.MySQL-version
  backup_retention_days  = 7
  zone                   = "1"

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "2"
  }
}