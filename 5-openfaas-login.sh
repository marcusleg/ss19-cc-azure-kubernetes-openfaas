#!/bin/bash
export KUBECONFIG=${PWD}/artefacts/kubeconfig
export OPENFAAS_URL="http://$(helm status openfaas | grep gateway-external | awk '{print $4}'):8080"
echo "Visit ${OPENFAAS_URL} to access the OpenFaaS web interface."

grep Password artefacts/openfaas-login.txt | cut -d ' ' -f 2 | faas-cli login -u admin --password-stdin -g ${OPENFAAS_URL}
echo "You may start using the OpenFaaS CLI (e.g. 'faas-cli -g ${OPENFAAS_URL} list')"
