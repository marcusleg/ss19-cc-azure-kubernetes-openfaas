#!/bin/bash
cd terraform/
terraform init
terraform apply -var-file config.tfvars
cd ..
