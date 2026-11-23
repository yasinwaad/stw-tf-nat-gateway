provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-example-dev-southafricanorth"
  location = "southafricanorth"
}

resource "azurerm_virtual_network" "example" {
  name                = "vnet-example-dev-southafricanorth"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example" {
  name                 = "snet-example-dev-southafricanorth"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "pip-nat-example-dev-southafricanorth"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  allocation_method   = "Static"
  sku                 = "Standard"
}

module "nat_gateway" {
  source = "../.."

  project_name        = "example"
  environment         = "dev"
  owner               = "Yasin"
  resource_group_name = azurerm_resource_group.example.name
  public_ip_id        = azurerm_public_ip.example.id
  subnet_id           = azurerm_subnet.example.id
}