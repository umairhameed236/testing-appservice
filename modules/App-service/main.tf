resource "azurerm_app_service_plan" "appserviceplan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier = "Free"
    size = "F1"
  }
}
resource "azurerm_app_service" "webapp" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.appserviceplan.id
  
  site_config {
        linux_fx_version = "DOTNETCORE|3.1"

  }
}
