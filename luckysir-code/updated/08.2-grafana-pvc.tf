resource "kubernetes_persistent_volume_claim" "grafana-pvc" {
  metadata {
    name = "grafana-pvc"
    namespace  = "${kubernetes_namespace.monitoring.metadata.0.name}"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
	storage_class_name = "managed-csi-premium-nfs"
	
    resources {
      requests = {
        storage = "20Gi"
      }
    }
    #volume_name = "${kubernetes_persistent_volume.grafana-pvc.metadata.0.name}"
  }
	wait_until_bound = false
	#depends_on = [kubernetes_namespace.monitoring, helm_release.helm_prometheus]
	depends_on = [kubernetes_namespace.monitoring]
}
