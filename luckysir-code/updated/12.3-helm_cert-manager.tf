############################################################
resource "helm_release" "certmanager" {
  name       = "certmanager"
  chart      = "./12.4-cert-manager_chart"
#  namespace  = "${kubernetes_namespace.kube-system.metadata.0.name}"
  namespace  = "util"
  depends_on = [null_resource.crdapply]
}
############################################################
