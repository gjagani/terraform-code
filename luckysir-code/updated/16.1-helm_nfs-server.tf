############################################################
resource "helm_release" "nfs-server" {
  name       = "managed-csi-premium-nfs"
  chart      = "./16.2-nfs_server_chart/nfs-server-provisioner"
  namespace  = "util"
# namespace  = "${kubernetes_namespace.kube-system.metadata.0.name}"
  depends_on = [azurerm_kubernetes_cluster.aks_cluster, azurerm_kubernetes_cluster_node_pool.spote2asv5, azurerm_kubernetes_cluster_node_pool.d2asv5]
}

############################################################
