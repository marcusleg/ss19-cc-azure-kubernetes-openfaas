variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
}

variable "kubernetes_client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "kubernetes_client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "worker_instance_type" {
  default = "Standard_D2s_v3"
  description = "Type of Azure Compute instance you want as worker nodes"
}


variable "worker_pool_size" {
  default = 1
  description = "Number of Azure Compute instances you want running as worker nodes"
}
