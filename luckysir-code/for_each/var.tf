variable "resource_group_name" {
  default = "isg-cv-rg-test"
}

variable "azurerm_kubernetes_cluster" {
  default = "isg-cv-aks-test"
}

# TAG CREATED BY
variable "created_by" {
  description = "This variable defines the Tag Created by"
  default = "Lucky Soni"
}

# Subscription for AZ LOGIN
variable "az_subscription" {
  description = "This variable defines the Tag Created by"
  default = "1cb5f1f6-3531-4b97-9190-89ec0cfdd322"
  # default = "7a7f20cc-9d3e-424b-a6cf-8bd7156ec1d4"
}

# Azure AKS Environment Name
variable "environment" {
  description = "This variable defines the Environment"  
  default = "dev"
}

variable "location" {

  description = "Azure Region where all these resources will be provisioned"

  default = "East US"

}
##Ingress DNS name for "grafana-ingress"
variable "grafana-ingress" {
  description = "This variable defines the Environment"  
  default = "xcm-grafana.isgapps.com"
}
##Ingress DNS name for "crate-ingress"
variable "crate-ingress" {
  description = "This variable defines the Environment"  
  default = "xcm-cdb.isgapps.com"
}

variable "client_id" {
  default = "4f67eb34-1087-4852-a94a-e8b4450b6872"
}

variable "client_secret" {
  default = "wNc3nHvAMlK_dw4-v6.q_x_Z.EB6bN2JhS"
}

variable "tenant_id" {
  default = "492dbcb1-51db-4a02-9f13-1bbebc72b74f"
}

# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "P@ssw0rd1234isg"
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}

# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}

# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "ssh/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}

##Ingress Availability Zones
variable "availability_zones" {
  description = "This variable defines the Environment"  
  default = [1,2,3]
  #default = []
}



variable "nodes_prop" {
  description = "nodes"
  type        = map
  default = {
    spote2asv5 = {
      name                = "spote2asv5"
      vm_size             = "Standard_E2as_v5"
      priority            = "Spot"
      node_labels = {
        "keycloakpg": "true"
        "apisix": "true"
        "kafka": "true"
        "redis": "true"
        "tsdb": "true"
     }
    }
    
    spote4asv5 = {
      name                = "spote4asv5"
      vm_size             = "Standard_E4as_v5"
      priority            = "Spot"
    }
    spote8asv5= {
      name                = "spote8asv5"
      vm_size             = "Standard_E8as_v5"
      priority            = "Spot"
    }
    standarde2asv5 = {
      name                = "standarde2asv5"
      vm_size             = "Standard_E2as_v5"
      priority            = "Regular"
      node_labels = {
        "keycloakpg": "true"
        "apisix": "true"
        "kafka": "true"
        "redis": "true"
        "tsdb": "true" 
      }
    }
    standarde4asv5 = {
      name                = "standarde4asv5"
      vm_size             = "Standard_E4as_v5"
      priority            = "Regular"
      
    }
    standarde8asv5 = {
      name                = "standarde8asv5"
      vm_size             = "Standard_E8as_v5"
      priority            = "Regular"
    }
   
  }
}
                              