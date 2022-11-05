#!/bin/sh

# argocd namespace add
kubectl create namespace argocd

# argoCD install
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml


# argoCD TypeChange
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

