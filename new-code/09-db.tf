######################################################################
# redis
resource "null_resource" "redis-sleep" {
  provisioner "local-exec" {
    command = "sleep 60"
  }
  depends_on = [null_resource.redis-pvc, kubernetes_namespace.namespaces]
}
resource "null_resource" "redis" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./redis-sp/redis-sp.yaml -n db"
  }
  provisioner "local-exec" {
    command = "kubectl apply -f ./redis-sp/redis-sp-svc.yaml -n db"
  }
  depends_on = [null_resource.redis-sleep]
}
resource "null_resource" "wait_for_redis" {
  provisioner "local-exec" {
    command = "bash ./wait_for_redis.sh"
  }
  depends_on = [null_resource.redis]
}

######################################################################
# tsdb-v15
resource "helm_release" "tsdb-v15" {
  name       = "timescale-db-v14"
  chart      = "./tsdb-v15/timescaledb-single"
  wait       = true
  timeout    = 600
  namespace  = "db"
  depends_on = [null_resource.dfeacr-secret, null_resource.dfefileshare-secret]
}

resource "null_resource" "wait_for_tsdb" {
  provisioner "local-exec" {
    command = "bash ./wait_for_tsdb.sh"
  }
  depends_on = [helm_release.tsdb-v15]
}

resource "null_resource" "init-db" {
  provisioner "local-exec" {
    command = "bash ./init_db.sh"
  }
  depends_on = [null_resource.wait_for_tsdb]
}
######################################################################