resource "azurerm_resource_group" "rabbit-rg" {
  name     = var.RG-name
  location = var.RG-location
}