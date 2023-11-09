####################################################################################
#resource "kubernetes_secret" "mlaas-gitlab-secret" {
#  metadata {
#    name       = "mlaas-gitlab-secret"
#    namespace  = "${kubernetes_namespace.feature1.metadata.0.name}"
#  }
#
#  data = {
#    ".dockerconfigjson" = jsonencode({
#
#     auths = {"registry.gitlab.com":{"username":"jshukla_isg","password":"tmGqLrPXnd_51p-5vsKG","auth":"anNodWtsYV9pc2c6dG1HcUxyUFhuZF81MXAtNXZzS0c="}}
#
#    })
#  }
#
#  type = "kubernetes.io/dockerconfigjson"
#  depends_on = [kubernetes_namespace.feature1]
#}
####################################################################################
#resource "kubernetes_secret" "mfileshare-secret" {
#  metadata {
#    name       = "mfileshare-secret"
#    namespace  = "${kubernetes_namespace.feature1.metadata.0.name}"
#  }
#
#  data = {
#    azurestorageaccountname  = "mlaasfileshare"
#    azurestorageaccountkey = "6M/aII76+n82B3aBaqpTtQ3pJIfhqe5Reour570boAZFiRnsJvIDoKjMD4xRLNcjNtYci5rTo9AbSAZjQgQ9rw=="
#  }
#
# # type = "kubernetes.io/basic-auth"
#   depends_on = [kubernetes_namespace.feature1]
#}
####################################################################################
#resource "kubernetes_secret" "dev-mongo-db-secret" {
#  metadata {
#    name       = "dev-mongo-db-secret"
#    namespace  = "${kubernetes_namespace.dev.metadata.0.name}"
#  }
#
#  data = {
#    mongo_db_name  = "mongodb"
#    mongo_host     = "mongodb"
#    mongo_password = "maT9qFQun6"
#    mongo_port     = "27017"
#    mongo_user     = "root"
#  }
#
# # type = "kubernetes.io/basic-auth"
#   depends_on = [kubernetes_namespace.dev, azurerm_kubernetes_cluster_node_pool.webpool]
#}
####################################################################################
#resource "kubernetes_secret" "dev-postgres-db-secret" {
#  metadata {
#    name      = "dev-postgres-db-secret"
#    namespace = "${kubernetes_namespace.dev.metadata.0.name}"
#}
#  data = {
#    postgres_db_name  = "airflow"
#    postgres_host     = "postgresql"
#    postgres_password = "airflow"
#    postgres_port     = "5432"
#    postgres_user     = "airflow"    
#}
#    # type = "kubernetes.io/basic-auth"
#    depends_on = [kubernetes_namespace.dev, azurerm_kubernetes_cluster_node_pool.webpool]
#}
####################################################################################
#resource "null_resource" "acr-isgwejocontainers-secret" {
#  triggers = {
#  }
#
#  provisioner "local-exec" {
#        command = "kubectl create secret docker-registry acr-auth-isgwejocontainers --namespace=feature1 --docker-server=isgwejocontainers.azurecr.io --docker-username=isgwejocontainers --docker-password=O47O7r5JrZVI+xfp61S9b2NAdoxrf2SR"
#  }
#  depends_on = [null_resource.azure_cli, kubernetes_namespace.feature1]
#}
#
####################################################################################
#resource "null_resource" "configmap-requirements" {
#  triggers = {
#  }
#
#  provisioner "local-exec" {
#        command = "kubectl create configmap requirements --from-file requirements.txt -n feature1"
#  }
#  depends_on = [null_resource.azure_cli, kubernetes_namespace.feature1]
#}
#
####################################################################################
