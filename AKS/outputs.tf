# K8S Identity id
output "AKS-identity-id" {
  value = azurerm_kubernetes_cluster.rabbit-aks.kubelet_identity[0].object_id
}