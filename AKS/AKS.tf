# azurerm_kubernetes_cluster
resource "azurerm_kubernetes_cluster" "rabbit-aks" {
  automatic_channel_upgrade         = "patch"
  azure_policy_enabled              = true
  dns_prefix                        = "rabbit-dns"
  http_application_routing_enabled  = false
  kubernetes_version                = var.K8s-version
  local_account_disabled            = false
  resource_group_name               = var.RG-name
  location                          = var.RG-location
  name                              = var.K8s-name
  node_resource_group               = var.Node-RG
  private_cluster_enabled           = true
  private_dns_zone_id               = "System"
  role_based_access_control_enabled = true
  sku_tier                          = var.K8s-sku
  support_plan                      = "KubernetesOfficial"

  default_node_pool {
    name                         = var.AgentPool-name
    custom_ca_trust_enabled      = false
    enable_auto_scaling          = true
    enable_host_encryption       = false
    enable_node_public_ip        = false
    fips_enabled                 = false
    kubelet_disk_type            = "OS"
    max_count                    = var.AgentPool-Node-Max-Count
    min_count                    = var.AgentPool-Node-Min-Count
    node_count                   = var.AgentPool-Node-Count
    max_pods                     = var.AgentPool-Pods-Node
    only_critical_addons_enabled = true
    # orchestrator_version         = "1.27.7"
    os_disk_size_gb   = var.AgentPool-OS-disk-size
    os_disk_type      = var.AgentPool-OS-disk-type
    os_sku            = var.AgentPool-OS-sku
    scale_down_mode   = "Delete"
    type              = "VirtualMachineScaleSets"
    ultra_ssd_enabled = false
    vm_size           = var.AgentPool-VMsize
    zones             = ["1", "2", "3"]
    vnet_subnet_id    = var.ClusterSubnet-id
  }

  identity { type = "SystemAssigned" }

  ingress_application_gateway {
    # subnet_id    = var.GatewaySubnet-id
    gateway_id = var.App-gateway-id
  }

  network_profile {
    dns_service_ip    = "10.0.0.10"
    ip_versions       = ["IPv4"]
    load_balancer_sku = "standard"
    network_plugin    = "azure"
    network_policy    = "azure"
    outbound_type     = "loadBalancer"
    service_cidr      = "10.0.0.0/16"
    service_cidrs     = ["10.0.0.0/16"]
  }

  tags = {
    Environment = "Production"
  }
}