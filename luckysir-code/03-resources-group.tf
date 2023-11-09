##################################################
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
#Add Tag
  tags = {
    "Created by" = "${var.created_by}"
  }
}
#######################################################################################################################
# Create Azure AD Group in Active Directory for AKS Admins
#AKS-administrators-azure-ad
#
#data "azuread_client_config" "current" {}
#resource "azuread_group" "aks_administrators" {
#  display_name     = "${azurerm_resource_group.aks_rg.name}-cluster-administrators"
#  description = "Azure AKS Kubernetes administrators for the ${azurerm_resource_group.aks_rg.name}-cluster."
#  security_enabled = true
#}
##################################################
