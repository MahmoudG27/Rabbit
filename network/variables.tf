variable "RG-name" {}
variable "RG-location" {}

################################

# Virtual Network
variable "Vnet-name" {
  type    = string
  default = "MG"
}
variable "Vnet-address" {
  type    = string
  default = "10.224.0.0/12"
}
########################################

# Infra Subnet
variable "InfraSubnet-Name" {
  type    = string
  default = "infra"
}
variable "InfraSubnet-address" {
  type    = string
  default = "10.224.0.0/16"
}

# AKS Cluster Subnet
variable "ClusterSubnet-name" {
  type    = string
  default = "cluster"
}
variable "ClusterSubnet-address" {
  type    = string
  default = "10.227.0.0/16"
}

# AKS Cluster Subnet
variable "Gateway-name" {
  type    = string
  default = "Gateway"
}
variable "Gateway-address" {
  type    = string
  default = "10.225.0.0/16"
}
#########################################

# Network Interface Card
variable "Runner-PrivateIP" {
  type    = string
  default = "10.224.0.70"
}

variable "Kafka-PrivateIPs" {
  type    = list(string)
  default = ["10.224.0.20", "10.224.0.30", "10.224.0.40"]
}