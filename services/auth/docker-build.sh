#! /bin/bash

REPO_URL=${1:-"<account_id>.dkr.ecr.<region>.amazonaws.com/<repo_name>"}

docker build -t auth-app-image .
docker tag auth-app-image:latest ${REPO_URL}:latest
docker push ${REPO_URL}:latest
kubectl set image deployment/auth-app-deployment auth-app=${REPO_URL}:latest
kubectl rollout status deployment/auth-app-deployment
kubectl rollout restart deployment/auth-app-deployment

