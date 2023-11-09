###############################################################
###Datasource to get Latest Azure AKS latest Version###
	data "azurerm_kubernetes_service_versions" "current" {
  location = azurerm_resource_group.aks_rg.location
  version_prefix  = 1.24
#  include_preview = false
}

###############################################################
#az aks get-versions --location centralindia -o table
