variable "RG-name" {}
variable "RG-location" {}

################################

# Flexible MySQL Server
variable "MySQL-name" {
  type    = string
  default = "rabbit-mysql-data"
}
variable "MySQL-user" {
  type    = string
  default = "mahmoud"
}
variable "MySQL-user-password" {
  type = string
}
variable "MySQL-version" {
  type    = string
  default = "8.0.21"
}
variable "MySQL-sku" {
  type    = string
  default = "GP_Standard_D2ads_v5"
}

# Replica MySQL Server
variable "Replica-MySQL-name" {
  type    = string
  default = "rabbit-mysql-data-replica"
}