############################################################################
###########################################################
#resource "kubernetes_namespace" "cert-manager" {
# metadata {
#   name = "cert-manager"
#  }
#}
###########################################################
#resource "kubernetes_namespace" "ingress" {
#  metadata {
#    name = "ingress"
#  }
#}
###########################################################
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}
###########################################################
resource "kubernetes_namespace" "etl" {
  metadata {
    name = "etl"
  }
}
###########################################################
resource "kubernetes_namespace" "kb" {
  metadata {
    name = "kb"
  }
}
###########################################################
resource "kubernetes_namespace" "ui" {
  metadata {
    name = "ui"
  }
}
###########################################################
resource "kubernetes_namespace" "util" {
  metadata {
    name = "util"
  }
}
###########################################################
resource "kubernetes_namespace" "db" {
  metadata {
    name = "db"
  }
}
###########################################################
###########################################################
#resource "kubernetes_namespace" "mlaas_ns" {
#  count = 5
#  metadata {
#	name = var.namespace[count.index]
#  }
#}
############################################################################
