#!/bin/sh

kubectl get svc argocd-server -o json -n argocd | jq -r '.status.loadBalancer.ingress[0].hostname'

