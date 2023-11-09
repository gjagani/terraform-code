resource "null_resource" "martin" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./martin/martin.yaml -n web"
  }
  provisioner "local-exec" {
    command = "kubectl apply -f ./martin/martin-svc.yaml -n web"
  }
  depends_on = [null_resource.martin-configmap]
}

resource "null_resource" "redis-insight" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./redis-insight/redis-insight.yaml -n db"
  }
  depends_on = [null_resource.redis-insight-pvc]
}