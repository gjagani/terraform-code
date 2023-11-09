########################################################################################
resource "helm_release" "certmanager" {
  name       = "certmanager"
  chart      = "./cert-manager/cert-manager"
  namespace  = "ingress"
  wait       = true
  depends_on = [null_resource.crdapply]
}
########################################################################################
resource "null_resource" "crdapply" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./cert-manager/cert-manager-crds.yaml"
  }
  depends_on = [kubernetes_namespace.namespaces]
}
########################################################################################
resource "null_resource" "cert-issuer" {
  provisioner "local-exec" {
    command = "kubectl apply -f ./cert-manager/cert-issuer.yaml -n ingress"
  }
  depends_on = [helm_release.certmanager]
}
########################################################################################
resource "helm_release" "ingress-nginx" {
  name       = "ingress"
  chart      = "./ingress/ingress-nginx"
  wait       = true
  namespace  = "ingress"
  depends_on = [null_resource.crdapply]
}
########################################################################################