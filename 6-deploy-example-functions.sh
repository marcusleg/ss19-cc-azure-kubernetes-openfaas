#!/bin/bash
export OPENFAAS_URL="http://$(helm status openfaas | grep gateway-external | awk '{print $4}'):8080"

faas-cli deploy --image=larikk/hello-user --name=hello-user --handler=./hello-user --lang python3
faas-cli deploy --image=larikk/hostname --name=hostname --handler=./hostname --lang python3
faas-cli deploy --image=larikk/mandelbrot --name=mandelbrot --handler=./mandelbrot --lang java8

echo -n "Testing invokation of function 'hello-user'. Response: "
curl --data '{"name": "Kevin", "birthdate": "1990-12-24"}' ${OPENFAAS_URL}/function/hello-user

echo "To invoke the 'mandelbrot' function please visit ${OPENFAAS_URL}/function/mandelbrot?w=1600&h=1200&iter=40&html=true"
