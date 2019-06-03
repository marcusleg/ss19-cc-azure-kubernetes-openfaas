resource "azurerm_resource_group" "resource_group" {
  name     = "cc-project-resources"
  location = "${var.location}"
}

resource "azurerm_kubernetes_cluster" "kubernetes_cluster" {
  name                = "cc-project-kubernetes"
  location            = "${azurerm_resource_group.resource_group.location}"
  resource_group_name = "${azurerm_resource_group.resource_group.name}"
  dns_prefix          = "cc-project"

  agent_pool_profile {
    name            = "default"
    count           = "${var.worker_pool_size}"
    vm_size         = "${var.worker_instance_type}"
    os_type         = "Linux"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = "${var.kubernetes_client_id}"
    client_secret = "${var.kubernetes_client_secret}"
  }

  tags = {
    Environment = "Production"
  }
}
