#!/bin/bash
export KUBECONFIG=artefacts/kubeconfig
set -e

# create namespaces
kubectl apply -f https://raw.githubusercontent.com/openfaas/faas-netes/master/namespaces.yml

# add helm repo for OpenFaaS 
helm repo add openfaas https://openfaas.github.io/faas-netes/

# generate password
PASSWORD=$(head -c 12 /dev/urandom | shasum| cut -d' ' -f1)
kubectl -n openfaas create secret generic basic-auth \
--from-literal=basic-auth-user=admin \
--from-literal=basic-auth-password="$PASSWORD"
echo -e "Username: admin\nPassword: ${PASSWORD}" > artefacts/openfaas-login.txt

# install OpenFaaS helm chart
helm repo update \
&& helm upgrade openfaas --install openfaas/openfaas \
--namespace openfaas  \
--set basic_auth=true \
--set functionNamespace=openfaas-fn \
--set serviceType=LoadBalancer
