resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name                  = var.UserPool-name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.rabbit-aks.id
  vm_size               = var.UserPool-VMsize
  mode                  = "User"
  zones                 = ["1", "2", "3"]
  enable_auto_scaling   = true
  max_count             = var.UserPool-Node-Max-Count
  min_count             = var.UserPool-Node-Min-Count
  node_count            = var.UserPool-Node-Count
  max_pods              = var.UserPool-Pods-Node
  os_disk_size_gb       = var.UserPool-OS-disk-size
  os_disk_type          = var.UserPool-OS-disk-type
  os_sku                = var.UserPool-OS-sku
  kubelet_disk_type     = "OS"
  # orchestrator_version          = "1.27.7"
  vnet_subnet_id = var.ClusterSubnet-id
}