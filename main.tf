module "ResourceGroup" {
  source      = "./rg"
  RG-name     = var.rg-name
  RG-location = var.rg-location
}

module "Network" {
  source                = "./network"
  Vnet-name             = var.vnet-name
  Vnet-address          = var.vnet-address
  InfraSubnet-Name      = var.subnet-app-name
  InfraSubnet-address   = var.subnet-app-address
  ClusterSubnet-name    = var.subnet-cluster-name
  ClusterSubnet-address = var.subnet-cluster-address
  Gateway-name          = var.subnet-gateway-name
  Gateway-address       = var.subnet-gateway-address
  Runner-PrivateIP      = var.runner-privateip
  Kafka-PrivateIPs      = var.kafka-privateips

  RG-name     = module.ResourceGroup.RG-name
  RG-location = module.ResourceGroup.RG-location
}

module "VirtualMachines" {
  source                   = "./VMs"
  RunnerVM-name            = var.runner-name
  RunnerVM-size            = var.runner-size
  RunnerVM-user            = var.runner-user
  RunnerVM-user-password   = var.mysql-user-password
  RunnerVM-storage-account = var.runner-storage-account
  RunnerVM-disk-size       = var.runner-disk-size
  RunnerVM-sku             = var.runner-sku

  KafkaVM-name            = var.kafka-name
  KafkaVM-size            = var.kafka-size
  KafkaVM-user            = var.kafka-user
  KafkaVM-user-password   = var.kafka-user-password
  KafkaVM-storage-account = var.kafka-storage-account
  KafkaVM-disk-size       = var.kafka-disk-size
  KafkaVM-sku             = var.kafka-sku

  RG-name     = module.ResourceGroup.RG-name
  RG-location = module.ResourceGroup.RG-location

  Runner-PrivateIP = module.Network.Runner-Nic-id
  Kafka-PrivateIPs = module.Network.Kafka-Nic-ids
}

module "MySQL" {
  source              = "./MySQL"
  MySQL-name          = var.mysql-name
  MySQL-user          = var.mysql-user
  MySQL-user-password = var.mysql-user-password
  MySQL-version       = var.mysql-version
  MySQL-sku           = var.mysql-sku
  Replica-MySQL-name  = var.replica-mysql-name

  RG-name     = module.ResourceGroup.RG-name
  RG-location = module.ResourceGroup.RG-location
}

module "ACR" {
  source   = "./ACR"
  ACR-name = var.acr-name
  ACR-sku  = var.acr-sku

  RG-name         = module.ResourceGroup.RG-name
  RG-location     = module.ResourceGroup.RG-location
  AKS-identity-id = module.AKS.AKS-identity-id
}

module "EndPoint" {
  source                       = "./EndPoint"
  EndPoint-MySQL-name          = var.endpoint-mysql-name
  EndPoint-MySQL-private-ip    = var.endpoint-mysql-ip
  EndPoint-Replica-name        = var.endpoint-replica-name
  EndPoint-Replica-private-ip  = var.endpoint-replica-ip
  EndPoint-ACR-name            = var.endpoint-acr-name
  EndPoint-acr-private-ip      = var.endpoint-acr-private-ip
  EndPoint-acr-data-private-ip = var.endpoint-acr-data-private-ip

  RG-name     = module.ResourceGroup.RG-name
  RG-location = module.ResourceGroup.RG-location

  InfraSubnet-id    = module.Network.infraSubnet-id
  Flexbile-MySQL-id = module.MySQL.Flexbile-MySQL-id
  Replica-MySQL-id  = module.MySQL.Replica-MySQL-id
  ACR-id            = module.ACR.ACR-id
  DNS-ACR-id        = module.DNS.DNS-id
}

module "AppGateway" {
  source           = "./ApplicationGateway"
  Gateway-name     = var.appGateway-name
  GatewaySubnet-id = module.Network.GatewaySubnet-id
  RG-name          = module.ResourceGroup.RG-name
  RG-location      = module.ResourceGroup.RG-location
}

module "AKS" {
  source      = "./AKS"
  K8s-version = var.K8s-version
  K8s-name    = var.K8s-name
  Node-RG     = var.K8s-Node-RG
  K8s-sku     = var.K8s-sku

  AgentPool-name           = var.AgentPool-name
  AgentPool-Node-Count     = var.AgentPool-Node-Count
  AgentPool-Node-Min-Count = var.AgentPool-Node-Min-Count
  AgentPool-Node-Max-Count = var.AgentPool-Node-Max-Count
  AgentPool-Pods-Node      = var.AgentPool-Pods-Node
  AgentPool-OS-sku         = var.AgentPool-OS-sku
  AgentPool-OS-disk-type   = var.AgentPool-OS-disk-type
  AgentPool-OS-disk-size   = var.AgentPool-OS-disk-size
  AgentPool-VMsize         = var.AgentPool-VMsize

  UserPool-name           = var.UserPool-name
  UserPool-VMsize         = var.UserPool-VMsize
  UserPool-Node-Count     = var.UserPool-Node-Count
  UserPool-Node-Min-Count = var.UserPool-Node-Min-Count
  UserPool-Node-Max-Count = var.UserPool-Node-Max-Count
  UserPool-OS-sku         = var.UserPool-OS-sku
  UserPool-OS-disk-type   = var.UserPool-OS-disk-type
  UserPool-OS-disk-size   = var.UserPool-OS-disk-size
  UserPool-Pods-Node      = var.UserPool-Pods-Node

  RG-name     = module.ResourceGroup.RG-name
  RG-location = module.ResourceGroup.RG-location

  ClusterSubnet-id = module.Network.ClusterSubnet-id
  GatewaySubnet-id = module.Network.GatewaySubnet-id
  App-gateway-id   = module.AppGateway.App-gateway-id
}

module "DNS" {
  source       = "./DNS"
  DNS-ACR-name = var.DNS-ACR-name

  RG-name = module.ResourceGroup.RG-name
  Vnet-id = module.Network.Vnet-id
}