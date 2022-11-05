#!/bin/sh

## create k8s namespace
kubectl create ns logging

## helm repo add
helm repo add fluent https://fluent.github.io/helm-charts


## helm install
helm upgrade --install fluent-bit fluent/fluent-bit -n logging

