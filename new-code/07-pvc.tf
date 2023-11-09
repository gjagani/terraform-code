# grafana pvc
resource "null_resource" "grafana-pvc" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./monitor/grafana-pvc.yaml -n monitoring"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}

# redis pvc
resource "null_resource" "redis-pvc" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./redis-sp/redis-sp-pvc.yaml -n db"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}
# redis insight
resource "null_resource" "redis-insight-pvc" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./redis-insight/redis-insight-pvc.yaml -n db"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}