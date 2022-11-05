#!/bin/bash


# v2_4_1 download
wget https://github.com/kubernetes-sigs/aws-load-balancer-controller/releases/download/v2.4.1/v2_4_1_full.yaml


# master git install
kubectl apply -k "github.com/aws/eks-charts/stable/aws-load-balancer-controller/crds?ref=master"


# vim ./v2_4_1_full.yaml
# cluster-name change
# ServiceAccount remove

