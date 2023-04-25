#!/bin/bash


#cluster name 입력 필요
eksctl create iamserviceaccount \
    --cluster fnb-msa-prod \
    --namespace kube-system \
    --name aws-load-balancer-controller \
    --attach-policy-arn arn:aws:iam::893246771823:policy/AWSLoadBalancerControllerIAMPolicy \
    --override-existing-serviceaccounts \
    --approve

