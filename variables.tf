# Resource Group Infra
variable "rg-location" {
  type = string
}
variable "rg-name" {
  type = string
}

#####################################

# Virtual Network
variable "vnet-address" {
  type = string
}
variable "vnet-name" {
  type = string
}

#####################################

# Cluster Subnet
variable "subnet-cluster-name" {
  type = string
}
variable "subnet-cluster-address" {
  type = string
}
# Data Subnet
variable "subnet-app-name" {
  type = string
}
variable "subnet-app-address" {
  type = string
}

# gateway Subnet
variable "subnet-gateway-name" {
  type = string
}
variable "subnet-gateway-address" {
  type = string
}

#####################################

# Flexible MySQL Server
variable "mysql-name" {
  type = string
}
variable "mysql-user" {
  type = string
}
variable "mysql-user-password" {
  type = string
}
variable "mysql-version" {
  type = string
}
variable "mysql-sku" {
  type = string
}
variable "replica-mysql-name" {
  type = string
}

#####################################

# Github Runner VM
variable "runner-name" {
  type = string
}
variable "runner-size" {
  type = string
}
variable "runner-user" {
  type = string
}
variable "runner-user-password" {
  type = string
}
variable "runner-storage-account" {
  type = string
}
variable "runner-disk-size" {
  type = number
}
variable "runner-sku" {
  type = string
}
variable "runner-privateip" {
  type = string
}

# Kafka VM
variable "kafka-name" {
  type = string
}
variable "kafka-size" {
  type = string
}
variable "kafka-user" {
  type = string
}
variable "kafka-user-password" {
  type = string
}
variable "kafka-storage-account" {
  type = string
}
variable "kafka-disk-size" {
  type = number
}
variable "kafka-sku" {
  type = string
}
variable "kafka-privateips" {
  type = list(string)
}

#####################################

variable "acr-name" {
  type = string
}

variable "acr-sku" {
  type = string
}

#####################################

variable "endpoint-mysql-name" {
  type = string
}
variable "endpoint-mysql-ip" {
  type = string
}

variable "endpoint-replica-ip" {
  type = string
}
variable "endpoint-replica-name" {
  type = string
}

variable "endpoint-acr-name" {
  type = string
}
variable "endpoint-acr-private-ip" {
  type = string
}
variable "endpoint-acr-data-private-ip" {
  type = string
}

#####################################

variable "K8s-version" {
  type = string
}

variable "K8s-name" {
  type = string
}

variable "K8s-Node-RG" {
  type = string
}

variable "K8s-sku" {
  type = string
}

variable "AgentPool-name" {
  type = string
}

variable "AgentPool-Node-Count" {
  type = number
}

variable "AgentPool-Node-Min-Count" {
  type = number
}

variable "AgentPool-Node-Max-Count" {
  type = number
}

variable "AgentPool-Pods-Node" {
  type = number
}

variable "AgentPool-OS-sku" {
  type = string
}

variable "AgentPool-OS-disk-type" {
  type = string
}

variable "AgentPool-OS-disk-size" {
  type = number
}

variable "AgentPool-VMsize" {
  type = string
}

variable "UserPool-name" {
  type = string
}

variable "UserPool-VMsize" {
  type = string
}

variable "UserPool-Node-Count" {
  type = number
}

variable "UserPool-Node-Min-Count" {
  type = number
}

variable "UserPool-Node-Max-Count" {
  type = number
}

variable "UserPool-OS-sku" {
  type = string
}

variable "UserPool-OS-disk-type" {
  type = string
}

variable "UserPool-OS-disk-size" {
  type = number
}

variable "UserPool-Pods-Node" {
  type = number
}

##########################################

variable "appGateway-name" {
  type = string
}

###########################################

variable "DNS-ACR-name" {
  type = string
}