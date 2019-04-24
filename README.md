# azure-kubernetes-openfaas
Scripts for creating an Azure Kubernetes cluster and installing OpenFaaS.

## Prerequisites
You need to have the following programs installed  
* [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
* [Terraform](https://www.terraform.io/)
* [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
* [Helm](https://helm.sh/)

## How to use
* Run `az login` to login to Microsoft Azure account
* Run the numbered bash scripts in ascending order

You can access the Kubernetes cluster using the kubeconfig file in 'artefacts/kubeconfig' (e.g. `kubectl --kubeconfig=artefacts/kubeconfig get node`).  

OpenFaaS is running behind a load balancer on port 8080. You can find its IP by running `helm status openfaas | grep gateway-external`.  
The login credentials can be found in artefacts/openfaas-login.txt'.
