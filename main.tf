terraform {

  required_version = ">=0.17"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
  backend "azurerm" {
resource_group_name  = "resourcegroup-tfstate"
        storage_account_name = "tfstatesterraform"
        container_name       = "terraformcontainer"
        key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
subscription_id = "291cf271-21f2-49e1-ad94-bc8a4daa51db"
}
locals {
  rg_name    = "${var.resource_group_name}"
}
module "Module_RG" {
  source = "github.com/umairhameed236/testing-appservice/modules/resource-group"
  name = local.rg_name
  location = var.location
 
 
}


module "Appservice" {
  source = "github.com/umairhameed236/testing-appservice/modules/App-service"
  app_service_plan_name=var.app_service_plan_name
  app_service_name=var.app_service_name
  location="${module.Module_RG.RG_location}"
  resource_group_name="${module.Module_RG.RG_name}"
  
}
