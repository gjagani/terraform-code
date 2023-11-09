resource "kubernetes_deployment" "geowebcache" {
  metadata {
    name = "geowebcache"
    labels = {
     #test = "MyExampleApp"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = geowebcache
      }
    }

    template {
      metadata {
        labels = {
          app = geowebcache
        }
      }

      spec {

        image_pull_secrets {
          name = acr-auth-isgwejocontainers
        }
        container {
          image = "isgwejocontainers.azurecr.io/stg_geo_webcache:#{Build.BuildId}#"
          name  = "geowebcache"
          port {
            container_port = 8080
          }

          volume_mount {
            name = "gwc-cache"
            mount_path = "/gwc_cache/"
            /* name = "share"
            mount_path = "/mnt" */
            }


          /* resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          } 

           liveness_probe {
            http_get {
              path = "/"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome"
              }
            }

            initial_delay_seconds = 3
            period_seconds        = 3
          } */
        }

        volume {
          name = "gwc-cache"
          persistent_volume_claim {
            claim_name = "gwcnfs"
          }
          /* name = share
          azure_file {
            secret_name = "mlcv-secret"
            share_name = "mlcvlogs/"
            read_only = false
          } */
        }

        node_selector = true
          #kubernetes.io/os = "linux"
          agentpool = "imputilpool"
      }
    }
  }
}

resource "kubernetes_service" "geowebcache" {
  metadata {
    name = "geowebcache"
  }
  spec {
    selector = {
      app = geowebcache
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "ClusterIP"
  }
}

/* resource "kubernetes_pod" "example" {
  metadata {
    name = "terraform-example"
    labels = {
      app = "MyApp"
    }
  }

  spec {
    container {
      image = "nginx:1.21.6"
      name  = "example"
    }
  }
} */