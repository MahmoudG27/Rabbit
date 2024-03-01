# Flexbile MySQL Server id
output "Flexbile-MySQL-id" {
  value = azurerm_mysql_flexible_server.MySQL-server.id
}

# Replica MySQL Server id
output "Replica-MySQL-id" {
  value = azurerm_mysql_flexible_server.Replica-MySQL-server.id
}