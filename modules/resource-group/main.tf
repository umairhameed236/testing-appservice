resource "azurerm_resource_group" "example_rg" {
    name     = var.name
    location = var.location
 
} 
output "RG_name" {
    value = var.name
}
output "RG_location" {
  value=var.location
}