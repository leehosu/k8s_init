#!/bin/bash

## ArgoCD Install
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


## argocd-server Type update
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'



