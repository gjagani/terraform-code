data "azurerm_kubernetes_service_versions" "current" {
  location        = var.location
  version_prefix  = 1.21
  include_preview = false
}