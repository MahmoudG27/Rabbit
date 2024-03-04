variable "RG-name" {}
variable "RG-location" {}

variable "InfraSubnet-id" {}
variable "ACR-id" {}
variable "DNS-ACR-id" {}

variable "Flexbile-MySQL-id" {}
variable "Replica-MySQL-id" {}

################################

# Flexible MySQL EndPoints
variable "EndPoint-MySQL-name" {
  type    = string
  default = "MySQL-EndPoint"
}
variable "EndPoint-MySQL-private-ip" {
  type    = string
  default = "10.224.0.100"
}

# REplica MySQL EndPoints
variable "EndPoint-Replica-name" {
  type    = string
  default = "Replica-MySQL-EndPoint"
}
variable "EndPoint-Replica-private-ip" {
  type    = string
  default = "10.224.0.101"
}

# ACR EndPoint
variable "EndPoint-ACR-name" {
  type    = string
  default = "ACR-EndPoint"
}

variable "EndPoint-acr-private-ip" {
  type    = string
  default = "10.224.0.110"
}
variable "EndPoint-acr-data-private-ip" {
  type    = string
  default = "10.224.0.111"
}