############################################################
resource "helm_release" "ingress-nginx" {
  name       = "ingress"
  chart      = "./10.2-ingress-nginx_chart/ingress-nginx"
  namespace  = "${kubernetes_namespace.util.metadata.0.name}"
  depends_on = [kubernetes_namespace.util]
}

############################################################
