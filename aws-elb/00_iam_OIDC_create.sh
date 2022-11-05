#!/bin/sh

# region / cluster name 수정 필요
eksctl utils associate-iam-oidc-provider \
    --region ap-northeast-2 \
    --cluster fnb-msa-release\
    --approve


# check AWS IAM OIDC
echo "==============IAM OIDC================="
aws eks describe-cluster --name fnb-msa-release --query "cluster.identity.oidc.issuer" --output text


# aws iam list-open-id-connect-providers | grep OIDC ID

