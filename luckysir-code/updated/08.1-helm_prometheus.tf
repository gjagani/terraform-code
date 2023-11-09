############################################################
resource "helm_release" "kube-prometheus-stack" {
  name       = "isg-pga"
  chart      = "./08.3-grafana_chart/kube-prometheus-stack"
  namespace  = "${kubernetes_namespace.monitoring.metadata.0.name}"
  depends_on = [kubernetes_namespace.monitoring]
}

############################################################
resource "helm_release" "prometheus-kafka-exporter" {
  name       = "isg-pkafka"
  chart      = "./08.3-grafana_chart/prometheus-kafka-exporter"
  namespace  = "${kubernetes_namespace.monitoring.metadata.0.name}"
  depends_on = [kubernetes_namespace.monitoring, helm_release.kube-prometheus-stack]
}

############################################################
