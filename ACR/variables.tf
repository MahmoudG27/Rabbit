variable "RG-name" {}
variable "RG-location" {}

variable "AKS-identity-id" {}
################################

variable "ACR-name" {
  type    = string
  default = "RabbitDemo"
}

variable "ACR-sku" {
  type    = string
  default = "Premium"
}