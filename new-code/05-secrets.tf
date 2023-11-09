# dfe-acr secret
resource "null_resource" "dfeacr-secret" {
  for_each = toset(var.namespaces)
  provisioner "local-exec" {
    command = "kubectl create secret docker-registry acr-auth-isgdfecontainers --namespace=${each.value} --docker-server=dfeacr.azurecr.io --docker-username=dfeacr --docker-password=TU/6AHgz+04Gt0AcZ8TEXG2+gFoP6PuhDGkUwHq0EK+ACRAFsbXe"
  }
  depends_on = [kubernetes_namespace.namespaces]
}
# dfefileshare secret
resource "null_resource" "dfefileshare-secret" {
  for_each = toset(var.namespaces)
  provisioner "local-exec" {
    command = "kubectl create secret generic 511njfileshare-secret --from-literal=azurestorageaccountname=isg511fileshare --from-literal=azurestorageaccountkey=+OivjHxaVhP6AQazcb2nwO/KpDgCClQOaejQFvjVnQxYkY42zIXP2mJpiu+aVmaj9zkHRZUsJjKv+AStfTvqow== -n ${each.value}"
  }
  depends_on = [kubernetes_namespace.namespaces]
}

# loki secret
resource "null_resource" "loki-secrets" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./monitor/loki-secret.yaml -n monitoring"
  }
  depends_on = [
    kubernetes_namespace.namespaces
  ]
}

