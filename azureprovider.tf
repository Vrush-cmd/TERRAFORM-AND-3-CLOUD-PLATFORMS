provider "azurerm" {
	  version = "~> 1.4"
	  environment = "public"
}
resource "azurerm_resource_group" "network-rg" {
	  name     = "${lower(replace(var.app_name," ","-"))}-${var.environment}-rg"
	  location = var.location
	  tags = {
	    application = var.app_name
	    environment = var.environment
	  }
	}
	resource "azurerm_virtual_network" "network-vnet" {
	  name                = "${lower(replace(var.app_name," ","-"))}-${var.environment}-vnet"
	  address_space       = [var.network-vnet-cidr]
	  resource_group_name = azurerm_resource_group.network-rg.name
	  location            = azurerm_resource_group.network-rg.location
	  tags = {
	    application = var.app_name
	    environment = var.environment
	  }
	}
	resource "azurerm_subnet" "network-subnet" {
	  name                 = "${lower(replace(var.app_name," ","-"))}-${var.environment}-subnet"
	  address_prefix       = var.network-subnet-cidr
	  virtual_network_name = azurerm_virtual_network.network-vnet.name
	  resource_group_name  = azurerm_resource_group.network-rg.name
}
