###################################################
# Use a recent version of Terraform
terraform {
  required_version = "1.3.5"
  required_providers {
################################
  azurerm = {
      source = "hashicorp/azurerm"
      version = "3.31.0"
  }
################################
	kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.15.0"
    }
################################
	helm = {
      source = "hashicorp/helm"
      version = "2.7.0"
    }
################################
	azuread = {
      source = "hashicorp/azuread"
      version = "2.30.0"
    }
################################	
	random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
#######################################
	null = {
      source = "hashicorp/null"
      version = "3.2.0"
	}
#######################################
  kubectl = {
    source = "gavinbunney/kubectl"
    version = "1.14.0"
  }
######################################
################################
  }
################################
#  # Terraform State Storage to Azure Storage Container
#  backend "azurerm" {
#    resource_group_name   = "srdemo"
#    storage_account_name  = "terraformstateisg"
#    container_name        = "terraform"
#    key                   = "terraform.tfstate"
#  }  
################################
}
###################################################
################################
# Terraform Provider Block for AzureRM
provider "azurerm" {
	features {}
#	subscription_id 	= "f32ae8dc-45ff-43c9-a29b-0dc8b022e196"
#    client_id		 	= var.client_id
#    client_secret 		= var.client_secret
#    tenant_id 			= var.tenant_id
  
}
##########################################################################################################################
provider "kubernetes" {
  host				= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host}"
  username			= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.username}"
  password			= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.password}"
  client_certificate		= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)}"
  client_key			= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)}"
  cluster_ca_certificate	= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)}"
}
##########################################################################################################################
provider "helm" {
  kubernetes {
    host			= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host}"
	username		= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.username}"
	password		= "${azurerm_kubernetes_cluster.aks_cluster.kube_config.0.password}"
	client_certificate	= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_certificate)}"
	client_key		= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.client_key)}"
	cluster_ca_certificate	= "${base64decode(azurerm_kubernetes_cluster.aks_cluster.kube_config.0.cluster_ca_certificate)}"
  }
}
##########################################################################################################################
provider "null" {

}
##########################################################################################################################
# Create Random pet resource
resource "random_pet" "aksrandom" {}
################################
