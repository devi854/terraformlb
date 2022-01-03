terraform {
  required_providers {
      azurerm = {
        source = "hashicorp/azurerm"
        version = "=2.46.0"
          
      }
  }
  backend "azurerm" {
    resource_group_name = "kubepoc-rg"
    storage_account_name = "terraformlab1423"
    container_name = "container11"
    key = "terraform.kubepoc-rg"
    access_key = "NtHyx5DyHP/f7b7AFQGULOLfndDR+s4y48vrrh4Ebw5DUdjh7I9z76PvhZwXo317oujXLWAMJQI96lfn44OS/A=="
    
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subsccription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  
}
resource "azurerm_resource_group" "proclabrg" {
  name = "proc12"
  location = "East US"
  
}
resource "azurerm_virtual_network" "procvnet" {
  name = "procvnet12"
  resource_group_name = azurerm_resource_group.proclabrg.name
  location = azurerm_resource_group.proclabrg.location
  address_space = [ "10.90.0.0/16" ]
  
}
resource "azurerm_subnet" "subnet1" {
  name = "websubnet"
  resource_group_name = azurerm_resource_group.proclabrg.name
  virtual_network_name = azurerm_virtual_network.procvnet.name
  address_prefixes = [ "10.90.1.0/24" ]

}
resource "azurerm_subnet" "subnet2" {
  name = "appsubnet"
  resource_group_name = azurerm_resource_group.proclabrg.name
  virtual_network_name = azurerm_virtual_network.procvnet.name
  address_prefixes = [ "10.90.2.0/24" ]

  
}
resource "azurerm_subnet" "subnet3" {
  name = "dbsubnet"
  resource_group_name = azurerm_resource_group.proclabrg.name
  virtual_network_name = azurerm_virtual_network.procvnet.name
  address_prefixes = [ "10.90.3.0/24" ]

  
}