# Airflow 
resource "helm_release" "airflow" {
  name       = "airflow"
  chart      = "./airflow/airflow-2.6.3"
  wait       = true
  timeout    = 1200
  namespace  = "airflow"
  depends_on = [null_resource.wait_for_redis, null_resource.init-db]
}

# Prometheus-grafana
resource "helm_release" "isg-pga" {
  name       = "isg-pga"
  chart      = "./monitor/kube-prometheus-stack"
  wait       = true
  timeout    = 600
  namespace  = "monitoring"
  depends_on = [null_resource.grafana-pvc]
}

# loki-stack
resource "helm_release" "isg-loki" {
  name       = "isg-loki"
  chart      = "./monitor/loki-stack"
  wait       = true
  timeout    = 600
  namespace  = "monitoring"
  depends_on = [null_resource.loki-secrets]
}

# keycloak
resource "helm_release" "keycloak" {
  name       = "keycloak"
  chart      = "./keycloak"
  wait       = true
  timeout    = 600
  namespace  = "web"
  depends_on = [null_resource.init-db]
}
