######################################################################
resource "kubernetes_ingress_v1" "grafana-ingress" {
  metadata {
    name       = "grafana-ingress"
    namespace  = "${kubernetes_namespace.monitoring.metadata.0.name}"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
      "cert-manager.io/cluster-issuer" = "letsencrypt-issuer"
    }
  }

  spec {
    rule {
      host = "${var.grafana-ingress}"
      http {
        path {
          path = "/"
          path_type = "Prefix"
          backend {
            service {
              name = "isg-pga-grafana"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts = ["${var.grafana-ingress}"]
      secret_name = "${var.grafana-ingress}-secret"
      
    }
  }
  depends_on = [kubernetes_namespace.monitoring]
}
######################################################################
