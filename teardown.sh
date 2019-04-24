#!/bin/bash
cd terraform/
terraform destroy -var-file config.tfvars
cd ..

ID=$(grep kubernetes_client_id terraform/config.tfvars | sed -e 's/^kubernetes_client_id = "\(.*\)"$/\1/')
az ad sp delete --id ${ID}
