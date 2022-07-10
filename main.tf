resource "azurerm_resource_group" "aks-rg" {
  name     = "aks-resources"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "aks-cluster-terraform"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
  dns_prefix          = "testakscluster"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}
