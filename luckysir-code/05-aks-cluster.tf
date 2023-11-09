resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                   =  var.azurerm_kubernetes_cluster
  location               =  azurerm_resource_group.aks_rg.location
  resource_group_name    =  azurerm_resource_group.aks_rg.name
  dns_prefix             =  "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version     =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group    =  "${azurerm_resource_group.aks_rg.name}-nrg"
#  
  default_node_pool {
    name                 = "system"
    node_count           = 1
    vm_size              = "Standard_DS2_v2"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    # availability_zones   = [1, 2, 3]
    zones                = "${var.availability_zones}"
#   enable_auto_scaling  = true
#   max_count            = 3
#   min_count            = 1
    os_disk_size_gb      = 128
    type                 = "VirtualMachineScaleSets"
#   vnet_subnet_id       = azurerm_subnet.aks-default.id
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "${var.environment}"
      "nodepoolos"       = "linux"
      "app"              = "system-apps"
#     "Created by"       = "${var.created_by}"
    } 
    tags = {
      "nodepool-type"    = "system"
      "Environment"      = "${var.environment}"
      "nodepoolos"       = "linux"
      "app"              = "system-apps"
      "Created by"  	   = "${var.created_by}"
      "Creation Date"  	 = "$date"
    } 
  }
	
  identity {
    type = "SystemAssigned"
  }
#  service_principal {
#    client_id     = var.appid
#	client_secret = var.passwd 
#  }

#Addon Profile
#	addon_profile {
#	aci_connector_linux {enabled = true}
#	  azure_policy {enabled = true}
#	  oms_agent {
#	   enabled = false
#	   log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
#	  }
#	}
	
# RBAC and Azure AD Integration Block
#  role_based_access_control {
  role_based_access_control_enabled = true #{
#    enabled = true
    #azure_active_directory {
    #  managed = true
    #  admin_group_object_ids = [azuread_group.aks_administrators.id]
    #}
#  }	

#Window Profile
	windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }
# Linux Profile
	linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  
# Network Profile
	network_profile {
    network_plugin = "azure"
    load_balancer_sku = "standard"
  }
  
  tags = {
    "Environment"   = "${var.environment}"
    "Created by"    = "${var.created_by}"
    "Creation Date" = "23-November-2022"
  }

}

