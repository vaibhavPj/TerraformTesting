resource "azurerm_resource_group" "Rg" {
  name     = "api-rg-pro"
  location = "West Europe"
}

resource "azurerm_app_service_plan" "app_service_plan" {
  name                = "api-appserviceplan-pro"
  location            = azurerm_resource_group.Rg.location
  resource_group_name = azurerm_resource_group.Rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "example" {
  name                = "monu-app-service"
  location            = azurerm_resource_group.Rg.location
  resource_group_name = azurerm_resource_group.Rg.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    linux_fx_version = "TOMCAT|8.5-java11"
  }
}
