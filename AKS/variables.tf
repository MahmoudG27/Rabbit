variable "RG-name" {}
variable "RG-location" {}

variable "ClusterSubnet-id" {}
variable "GatewaySubnet-id" {}
variable "App-gateway-id" {}
################################

# kubernetes Cluster
variable "K8s-version" {
  type    = string
  default = "1.27.7"
}

variable "K8s-name" {
  type    = string
  default = "Rabbit"
}

variable "Node-RG" {
  type    = string
  default = "Rabbit-Cluster"
}

variable "K8s-sku" {
  type    = string
  default = "Standard"
}

# Agent Pool
variable "AgentPool-name" {
  type    = string
  default = "agentpool"
}

variable "AgentPool-Node-Count" {
  type    = number
  default = 2
}

variable "AgentPool-Node-Min-Count" {
  type    = number
  default = 2
}

variable "AgentPool-Node-Max-Count" {
  type    = number
  default = 5
}

variable "AgentPool-Pods-Node" {
  type    = number
  default = 110
}

variable "AgentPool-OS-sku" {
  type    = string
  default = "Ubuntu"
}

variable "AgentPool-OS-disk-type" {
  type    = string
  default = "Ephemeral"
}

variable "AgentPool-OS-disk-size" {
  type    = number
  default = 128
}

variable "AgentPool-VMsize" {
  type    = string
  default = "Standard_D8ds_v5"
}



# UserPool
variable "UserPool-name" {
  type    = string
  default = "userpool"
}

variable "UserPool-VMsize" {
  type    = string
  default = "Standard_D8ds_v5"
}

variable "UserPool-Node-Count" {
  type    = number
  default = 2
}

variable "UserPool-Node-Min-Count" {
  type    = number
  default = 2
}

variable "UserPool-Node-Max-Count" {
  type    = number
  default = 5
}

variable "UserPool-OS-sku" {
  type    = string
  default = "Ubuntu"
}

variable "UserPool-OS-disk-type" {
  type    = string
  default = "Ephemeral"
}

variable "UserPool-OS-disk-size" {
  type    = number
  default = 128
}

variable "UserPool-Pods-Node" {
  type    = number
  default = 110
}