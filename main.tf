terraform {

  required_version = ">=0.16"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
subscription_id = "291cf271-21f2-49e1-ad94-bc8a4daa51db"
}
module "Module_RG" {
  source = "./Modules/Resource-Group"
  name = var.resource_group_name
  location = var.location
 
 
}


module "Appservice" {
  source = "./modules/App-service"
  app_service_plan_name=var.app_service_plan_name
  app_service_name=var.app_service_name
  location="${module.Module_RG.RG_location}"
  resource_group_name="${module.Module_RG.RG_name}"
  
}