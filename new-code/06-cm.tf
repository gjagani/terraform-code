resource "null_resource" "martin-configmap" {
  provisioner "local-exec" {
    command = "kubectl create configmap martin-cfg -n web --from-file=./martin/config.yaml"
  }
  provisioner "local-exec" {
    command = "kubectl create configmap nginx-cfg -n web --from-file=./martin/nginx.conf"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}
