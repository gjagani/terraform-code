resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.azurerm_kubernetes_cluster
  location            = var.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "${azurerm_resource_group.aks_rg.name}-cluster"
  kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${azurerm_resource_group.aks_rg.name}-nrg"

  default_node_pool {
    name                 = "systempool"
    node_count           = 1
    vm_size              = "standard_D2as_v4"
    orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version
    #availability_zones   = "${var.availability_zones}"
    os_disk_size_gb = 4
    type            = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type" = "system"
      #"environment"      = "${var.environment}"
      "nodepoolos" = "linux"
      "app"        = "system-apps"
      #     "Created by"       = "${var.created_by}"
    }
    tags = {
      "nodepool-type" = "system"
      #"Environment"      = "${var.environment}"
      "nodepoolos" = "linux"
      "app"        = "system-apps"
      #"Created by"      = "${var.created_by}"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  #  service_principal {
  #    client_id     = var.appid
  #     client_secret = var.passwd
  #  }

  #Addon Profile
   #     addon_profile {
  #     aci_connector_linux {enabled = true}
  #       azure_policy {enabled = true}
  #       oms_agent {
  #        enabled = false
  #        log_analytics_workspace_id = azurerm_log_analytics_workspace.insights.id
  #       }
  #     }


  #Window Profile
  /* windows_profile {
    admin_username = "admin"
    admin_password = "Admin@123"
  }*/
  #Linux Profile
  /*linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }*/

  # Network Profile
  network_profile {
    network_plugin = "azure"
    # load_balancer_sku = "Standard"
  }


  /* tags = {
    "Environment"  = "${var.environment}"
    "Created by"   = "${var.created_by}"
  }
 */
}
          