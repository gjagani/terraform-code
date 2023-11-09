#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "spote2asv5"

resource "azurerm_kubernetes_cluster_node_pool" "spote2asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "spote2asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
 # os_disk_type          = "Ephemeral"
  os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               =  var.azurerm_kubernetes_cluster_node_pool["spote2asv5"]
# priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  eviction_policy       = "Delete"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "redisha"             = "true"
    "airflow"             = "true"
    "jour-corr-pro-osm"   = "true"
    "jour-exp-osm"        = "true"
    "jour-pro-osm"        = "true"
    "sp-cal-link-con-osm" = "true"
    "sp-cal-link-pro-osm" = "true"
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "spote4asv5"

resource "azurerm_kubernetes_cluster_node_pool" "spote4asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "spote4asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
  #os_disk_type          = "Ephemeral"
  os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["spote4asv5"]
# priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  eviction_policy       = "Delete"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "trino-upscale"         = "true"
    "trino2"                = "true"
    "tsdb"                  = "true"
    "v14tsdb"               = "true"
    "conf-con-osm-0"        = "true"
    "conf-con-osm-1"        = "true"
    "conf-con-osm-2"        = "true"
    "conf-con-osm-3"        = "true"
    "conf-con-osm-4"        = "true"
    "conf-pro-osm"          = "true"
    "corr-all-state-osm"    = "true"
    "corr-njnyct-metro-osm" = "true"
    "corr-ny-metro-osm"     = "true"
    "corr-upstate-ny-osm"   = "true"
    "jour-con-osm"          = "true"
    "jour-corr-con-osm"     = "true"
    "jour-exp-con-osm"      = "true"
    "Environment"           = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "Spote8asv5"

resource "azurerm_kubernetes_cluster_node_pool" "spote8asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "spote8asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
  #os_disk_type          = "Ephemeral"
  os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["spote8asv5"]
# priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  eviction_policy       = "Delete"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "redisstd"            = "true"
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "spotd2asv5"

resource "azurerm_kubernetes_cluster_node_pool" "spotd2asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "spotd2asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
  #os_disk_type          = "Ephemeral"
  os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["spotd2asv5"]
# priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  eviction_policy       = "Delete"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "kc-postgresql"       = "true"
    "kclient"             = "true"
    "kcc"                 = "true"
    "kop"                 = "true"
    "kb"                  = "true"
    "zop"                 = "true"
    "zk"                  = "true" 
    "st-alertmanager"     = "true"
    "st-prometheus"       = "true"
    "grafana"             = "true"
    "promeheus-opr"       = "true"
    "stat-metrics"        = "true"
    "k-exporter"          = "true"
    "jour-jmx"            = "true"
    "con-0-jmx"           = "true"
    "con-1-jmx"           = "true"
    "con-2-jmx"           = "true"
    "con-3-jmx"           = "true"
    "con-4-jmx"           = "true"
    "pro-jmx"             = "true"
    "trino-jmx"           = "true"
    "r-exporter"          = "true"
    "nfs-pro"             = "true"
    "cert"                = "true"
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "spotd8asv5"

resource "azurerm_kubernetes_cluster_node_pool" "spotd8asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "spotd8asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
  #os_disk_type          = "Ephemeral"
  os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["spotd8asv5"]
# priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  eviction_policy       = "Delete"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
  spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "geoserver"           = "true"
    "geowebcache"         = "true"
    "mapproxy"            = "true"
    "dev-cvapi"           = "true"
    "dev-cvapp"           = "true"
    "cvapi"               = "true"
    "cvapp"               = "true"
    "keyclock"            = "true"
    "kafka-python"        = "true"
    "bgp-purge-api"       = "true"
    "bg-process-api"      = "true"  
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "e2asv5"

resource "azurerm_kubernetes_cluster_node_pool" "e2asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "e2asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
#  os_disk_type          = "Ephemeral"
  # os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["e2asv5"]
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# eviction_policy       = "Deallocate"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
 scale_down_mode       = "Deallocate"
# spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "redisha"             = "true"
    "airflow"             = "true"

    "jour-corr-pro-osm"   = "true"
    "jour-exp-osm"        = "true"
    "jour-pro-osm"        = "true"
    "sp-cal-link-con-osm" = "true"
    "sp-cal-link-pro-osm" = "true"    
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "e4asv5"

resource "azurerm_kubernetes_cluster_node_pool" "e4asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "e4asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
#  os_disk_type          = "Ephemeral"
  # os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["e4asv5"]
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# eviction_policy       = "Deallocate"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
 scale_down_mode       = "Deallocate"
# spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "trino-upscale"         = "true"
    "trino2"                = "true"
    "tsdb"                  = "true"
    "v14tsdb"               = "true"
    "conf-con-osm-0"        = "true"
    "conf-con-osm-1"        = "true"
    "conf-con-osm-2"        = "true"
    "conf-con-osm-3"        = "true"
    "conf-con-osm-4"        = "true"
    "conf-pro-osm"          = "true"
    "corr-all-state-osm"    = "true"
    "corr-njnyct-metro-osm" = "true"
    "corr-ny-metro-osm"     = "true"
    "corr-upstate-ny-osm"   = "true"
    "jour-con-osm"          = "true"
    "jour-corr-con-osm"     = "true"
    "jour-exp-con-osm"      = "true"
    "Environment"           = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "e8asv5"

resource "azurerm_kubernetes_cluster_node_pool" "e8asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "e8asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
#  os_disk_type          = "Ephemeral"
  # os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["e8asv5"]
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# eviction_policy       = "Deallocate"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
 scale_down_mode       = "Deallocate"
# spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "redisstd"            = "true"
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "d2asv5"

resource "azurerm_kubernetes_cluster_node_pool" "d2asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "d2asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
#  os_disk_type          = "Ephemeral"
  # os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["d2asv5"]
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# eviction_policy       = "Deallocate"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
 scale_down_mode       = "Deallocate"
# spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "kc-postgresql"      = "true"
    "kclient"            = "true"
    "kcc"                = "true"
    "kop"                = "true"
    "kb"                 = "true"
    "zop"                = "true"
    "zk"                 = "true"
    "st-alertmanager"    = "true"
    "st-prometheus"      = "true"
    "grafana"            = "true"
    "promeheus-opr"      = "true"
    "stat-metrics"       = "true"
    "k-exporter"         = "true"
    "jour-jmx"           = "true"
    "con-0-jmx"          = "true"
    "con-1-jmx"          = "true"
    "con-2-jmx"          = "true"
    "con-3-jmx"          = "true"
    "con-4-jmx"          = "true"
    "pro-jmx"            = "true"
    "trino-jmx"          = "true"
    "r-exporter"         = "true"
    "nfs-pro"            = "true"
    "cert"               = "true"
    "Environment"        = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################

#################################################################################################
#################################################################################################
# Create Linux Azure AKS Node Pool name "d8asv5"

resource "azurerm_kubernetes_cluster_node_pool" "d8asv5" {
# availability_zones    = [1, 2, 3]
  zones    = "${var.availability_zones}"
  enable_auto_scaling   = true
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks_cluster.id
  max_count             = 3
  min_count             = 0
  mode                  = "User"
  name                  = "d8asv5"
  node_count            = 0
  max_pods              = 150
  orchestrator_version  = data.azurerm_kubernetes_service_versions.current.latest_version
  os_disk_size_gb       = 64
#  os_disk_type          = "Ephemeral"
  # os_disk_type          = "Managed"
  os_type               = "Linux" # Default is Linux, we can change to Windows
  vm_size               = var.azurerm_kubernetes_cluster_node_pool["d8asv5"]
  priority              = "Regular"  # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# priority              = "Spot"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# eviction_policy       = "Deallocate"   # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
 scale_down_mode       = "Deallocate"
# spot_max_price        = "-1"     # Default is Regular, we can change to Spot with additional settings like eviction_policy, spot_max_price, node_labels and node_taints
# vnet_subnet_id        = azurerm_subnet.aks-default.id
  node_labels = {
    "geoserver"           = "true"
    "geowebcache"         = "true"
    "mapproxy"            = "true"
    "dev-cvapi"           = "true"
    "dev-cvapp"           = "true"
    "cvapi"               = "true"
    "cvapp"               = "true"
    "keyclock"            = "true"
    "kafka-python"        = "true"
    "bgp-purge-api"       = "true"
    "bg-process-api"      = "true"
    "Environment"         = "${var.environment}"
  }
  tags = {
    "nodepool-type" = "user"
    "nodepoolos"    = "linux"
    "Environment"   = "${var.environment}"
    "app"           = "elk"
    "Created by"    = "${var.created_by}"
  }
}

#################################################################################################
