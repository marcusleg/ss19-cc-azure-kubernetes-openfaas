output "client_certificate" {
  value = "${azurerm_kubernetes_cluster.kubernetes_cluster.kube_config.0.client_certificate}"
}

output "kube_config" {
  value = "${azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw}"
}

resource "local_file" "kube_config" {
    content     = "${azurerm_kubernetes_cluster.kubernetes_cluster.kube_config_raw}"
    filename = "${path.module}/../artefacts/kubeconfig"
}
