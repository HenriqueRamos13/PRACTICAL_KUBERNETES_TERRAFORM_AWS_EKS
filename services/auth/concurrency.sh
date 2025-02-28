#!/bin/bash
# Script para teste de carga utilizando Apache Bench (ab)

# URL do endpoint. Substitua <LoadBalancerEndpoint> pelo DNS do seu LB.
URL=${1:-"<LoadBalancerEndpoint>"}
# Número total de requisições
NUM_REQUESTS=${2:-10000}
# Número de requisições concorrentes
CONCURRENCY=${3:-100}

echo "Um melhor é o loadtest, pode achar no npm ex: npx loadtest -c 10 --rps 200 <URL>/<PATH>"

echo "Iniciando teste de carga contra $URL"
echo "Total de requisições: $NUM_REQUESTS | Concurrency: $CONCURRENCY"

ab -n $NUM_REQUESTS -c $CONCURRENCY -v 2 $URL
