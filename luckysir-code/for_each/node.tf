resource "azurerm_kubernetes_cluster_node_pool" "nodes" {
  for_each              = var.nodes_prop
  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  vm_size               = each.value.vm_size #"Standard_D2as_v4"
  node_count            = "1"
  enable_auto_scaling   = "false"
  #availability_zones = "${var.availability_zones}"
  max_count            = 1
  min_count            = 0
  mode                 = "User"
  orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb      = 128
  os_type              = "Linux"
  priority             = each.value.priority #"Regular"
  node_labels = each.value.node_labels
}