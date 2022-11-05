#!/bin/sh

## 1) argocd login
argocd login $(kubectl get svc argocd-server -o json -n argocd | jq -r '.status.loadBalancer.ingress[0].hostname')


## 2) cluster add
argocd cluster add $(kubectl config current-context)
