variable "RG-name" {
  type = string
}
variable "RG-location" {
  type = string
}
variable "Kafka-PrivateIPs" {
  type = list(string)
}
variable "Runner-PrivateIP" {
  type = list(string)
}

################################

# Github Runner VM
variable "RunnerVM-name" {
  type    = string
  default = "GitHub-Runner"
}
variable "RunnerVM-size" {
  type    = string
  default = "Standard_F2"
}
variable "RunnerVM-user" {
  type    = string
  default = "Mahmoud"
}
variable "RunnerVM-user-password" {
  type = string
}
variable "RunnerVM-storage-account" {
  type    = string
  default = "Standard_LRS"
}
variable "RunnerVM-disk-size" {
  type    = number
  default = 64
}
variable "RunnerVM-sku" {
  type    = string
  default = "22_04-lts"
}


# Kafka VMs
variable "KafkaVM-name" {
  type    = string
  default = "Kafka"
}
variable "KafkaVM-size" {
  type    = string
  default = "Standard_F2"
}
variable "KafkaVM-user" {
  type    = string
  default = "Mahmoud"
}
variable "KafkaVM-user-password" {
  type = string
}
variable "KafkaVM-storage-account" {
  type    = string
  default = "Standard_LRS"
}
variable "KafkaVM-disk-size" {
  type    = number
  default = 64
}
variable "KafkaVM-sku" {
  type    = string
  default = "22_04-lts"
}