########################################################################################
resource "null_resource" "crdapply" {
  triggers = {
    #key = tls_private_key.key.private_key_pem
  }

  provisioner "local-exec" {
        command = "kubectl apply -f ./12.2-cert-manager_manifests/cert-manager.crds.yaml"
  }
  depends_on = [null_resource.azure_cli]
}


########################################################################################
resource "null_resource" "cert-issuer" {
  triggers = {
  }

  provisioner "local-exec" {
        command = "kubectl apply -f ./12.2-cert-manager_manifests/cert-issuer.yaml -n util"
  }
  depends_on = [null_resource.azure_cli, helm_release.certmanager]
}

########################################################################################
