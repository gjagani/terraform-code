#######################################################################################
# Azure Location
variable "location" {
  description = "Azure Region where all these resources will be provisioned"
  default = "East US"
}

##############################################################
# Azure Resource Group Name
variable "resource_group_name" {
  description = "This variable defines the Resource Group"
  default = "isg-cv-rg"
}

##############################################################
# Azure Resource Kubernetes Services Name
variable "azurerm_kubernetes_cluster" {
  description = "This variable defines the Kubernetes Services Name"
  default = "isg-cv-aks"
  }

##############################################################
# TAG CREATED BY
variable "created_by" {
  description = "This variable defines the Tag Created by"
  default = "Lucky Soni"
  }

##############################################################
# Subscription for AZ LOGIN
variable "az_subscription" {
  description = "This variable defines the Tag Created by"
  default = "1cb5f1f6-3531-4b97-9190-89ec0cfdd322"
  # default = "7a7f20cc-9d3e-424b-a6cf-8bd7156ec1d4"
  }

##############################################################
# Azure AKS Environment Name
variable "environment" {
  description = "This variable defines the Environment"  
  default = "dev"
}

##############################################################
##Ingress DNS name for "grafana-ingress"
variable "grafana-ingress" {
  description = "This variable defines the Environment"  
  default = "xcm-grafana.isgapps.com"
}

##############################################################
##Ingress DNS name for "crate-ingress"
variable "crate-ingress" {
  description = "This variable defines the Environment"  
  default = "xcm-cdb.isgapps.com"
}

##############################################################
##Ingress Availability Zones
variable "availability_zones" {
  description = "This variable defines the Environment"  
  default = [1,2,3]
  #default = []
}

#######################################################################################
##VM Size
variable "azurerm_kubernetes_cluster_node_pool" {
  description = "This variable defines the Environment"
   type = map
   default = {
    "spote2asv5" = "Standard_E2as_v5"
    "spote4asv5" = "Standard_E4as_v5"
    "spote8asv5" = "Standard_E8as_v5"
    "spotd2asv5" = "Standard_D2as_v5"
    "spotd8asv5" = "Standard_D8as_v5"
    "e2asv5"     = "Standard_E2as_v5"
    "e4asv5"     = "Standard_E4as_v5"
    "e8asv5"     = "Standard_E8as_v5"
    "d2asv5"     = "Standard_D2as_v5"
    "d8asv5"     = "Standard_D8as_v5"
    "system"     = "Standard_DS2_V5"
  }
}

#######################################################################################
# SSH Public Key for Linux VMs
variable "ssh_public_key" {
  default = "ssh/aksprodsshkey.pub"
  description = "This variable defines the SSH Public Key for Linux k8s Worker nodes"  
}
##############################################################
# Windows Admin Username for k8s worker nodes
variable "windows_admin_username" {
  type = string
  default = "azureuser"
  description = "This variable defines the Windows admin username k8s Worker nodes"  
}
##############################################################
# Windows Admin Password for k8s worker nodes
variable "windows_admin_password" {
  type = string
  default = "P@ssw0rd1234isg"
  description = "This variable defines the Windows admin password k8s Worker nodes"  
}
###################################################################
#variable "namespace" {
#	type = list
#  default = ["crate", "geowebcache", "hive", "ingress", "kb", "keda", "ks-cal-speed", "ks-conflation", "ks-crate-etl", "mlcv", "mlcvnetcore", "mlcvredis", "mlcvui", "mlcvuidemo", "monitoring", "redisha", "redissp", "spark", "trino", "ts-db", "zk"]

#}
###################################################################
variable "client_id" {
  default = "4f67eb34-1087-4852-a94a-e8b4450b6872"
}
####################################
variable "client_secret" {
  default = "wNc3nHvAMlK_dw4-v6.q_x_Z.EB6bN2JhS"
}
####################################
variable "tenant_id" {
  default = "492dbcb1-51db-4a02-9f13-1bbebc72b74f"
}
###################################################################
