#!/bin/bash
NAME=cloud-computing-project
PASSWORD=$(head -c 12 /dev/urandom | shasum | cut -d' ' -f1)

ID=$(az ad sp create-for-rbac --name ${NAME} --password ${PASSWORD} --output tsv | cut -f 1)
# TODO create and assign a role with minimal permissions

sed -i "s/^kubernetes_client_id = \".*\"/kubernetes_client_id = \"${ID}\"/" terraform/config.tfvars
sed -i "s/^kubernetes_client_secret = \".*\"/kubernetes_client_secret = \"${PASSWORD}\"/" terraform/config.tfvars
