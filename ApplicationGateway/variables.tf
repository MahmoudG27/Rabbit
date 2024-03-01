variable "RG-name" {}
variable "RG-location" {}
variable "GatewaySubnet-id" {}

################################

# kubernetes Cluster
variable "Gateway-name" {
  type    = string
  default = "Ingress-AppGateway"
}