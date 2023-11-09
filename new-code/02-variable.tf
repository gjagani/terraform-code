# Azure Resource Group Name
variable "resource_group_name" {
  default = "isg-511-scalable"
}

# Azure Kubernetes Cluster Name 
variable "azurerm_kubernetes_cluster" {
  default = "isg-511-aks"
}

# Subscription for AZ LOGIN
variable "az_subscription" {
  description = "This variable defines the Tag Created by"
  default     = "1cb5f1f6-3531-4b97-9190-89ec0cfdd322"
}

# Azure AKS Environment Name
variable "environment" {
  description = "This variable defines the Environment"
  default     = "511nj"
}

# Azure Region Location
variable "location" {
  description = "Azure Region where all these resources will be provisioned"
  default     = "Australia East"
}
#Ingress Availability Zones
variable "orchestrator_version" {
  description = "This variable defines aks version"
  default     = "1.27.3"
}

variable "availability_zones" {
  description = "This variable defines the Environment"
  default     = []
}

## VM Size
variable "node_pool" {
  description = "This variable defines the Environment"
  type        = map(any)
  default = {
    d2sv5 = {
      name                = "d2sv5"
      vm_size             = "Standard_D2s_v5"
      node_count          = 0
      max_count           = 20
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "d2sv5" : "true","airflow" : "true", "kafka-client" : "true", "grafana" : "true", "loki" : "true"
      }
      tags = {
        "Created_by" : "DevOps Team"
      }
    }
    e2sv5 = {
      name                = "e2sv5"
      vm_size             = "Standard_E2s_v5"
      node_count          = 0
      max_count           = 20
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"
      nodepool_label = {
        "e2sv5" : "true","kafka" : "true", "keycloak" : "true", "airflow-worker" : "true", "martin" : "true"
      }
      tags = {
        "Created_by" : "DevOps Team"
      }
    }
    e4sv5 = {
      name                = "e4sv5"
      vm_size             = "Standard_E4s_v5"
      node_count          = 0
      max_count           = 20
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "redis" = "true", "e4sv5" = "true", "tsdb" = "true"
      }
      tags = {
        "Created_by" : "DevOps Team"
      }
    }
    e8sv5 = {
      name                = "e8sv5"
      vm_size             = "Standard_E8s_v5"
      node_count          = 0
      max_count           = 5
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "e8sv5" = "true"
      }
      tags = {
        "Created_by" : "DevOps Team"
      }
    }
    e16sv5 = {
      name                = "e16sv5"
      vm_size             = "Standard_E16s_v5"
      node_count          = 0
      max_count           = 5
      min_count           = 0
      enable_auto_scaling = "false"
      zones               = []
      mode                = "User"
      os_disk_size_gb     = 128
      os_disk_type        = "Managed"
      os_type             = "Linux"

      nodepool_label = {
        "e16sv5" = "true"
      }
      tags = {
        "Created_by" : "DevOps Team"
      }
    }
  }
}

variable "namespaces" {
  description = "This is list of namespaces"
  type        = list(string)
  default = [
    "ingress",
    "kb",
    "db",
    "monitoring",
    "airflow",
    "web",
  ]
}