#!/bin/sh

# helm에 aws-efs-csi-driver repository 추가
echo "=========== helm repo clone about aws-efs-csi-driver repository  =========="
helm repo add aws-efs-csi-driver https://kubernetes-sigs.github.io/aws-efs-csi-driver/

echo "========== helm repo update =========="
# repository 업데이트
helm repo update

# 드라이버 설치
echo "========== install aws-efs-csi-driver ==========="
helm upgrade -i aws-efs-csi-driver aws-efs-csi-driver/aws-efs-csi-driver \
    --namespace kube-system \
    --set image.repository=602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/aws-efs-csi-driver \
    --set controller.serviceAccount.create=false \
    --set controller.serviceAccount.name=efs-csi-controller-sa
