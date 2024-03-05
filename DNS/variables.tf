variable "RG-name" {}
variable "Vnet-id" {}
variable "AKS-identity-id" {}

################################

# Private DNS Name for ACR
variable "DNS-ACR-name" {
  type    = string
  default = "privatelink.azurecr.io"
}