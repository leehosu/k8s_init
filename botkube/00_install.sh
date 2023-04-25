#!/bin/sh

helm repo add botkube https://charts.botkube.io
helm repo update


export SLACK_API_BOT_TOKEN="xoxb-3791777260246-4886423088656-krCKHrTzgQwatEaPwCeXbV96"
export SLACK_API_APP_TOKEN="xapp-1-A04R9PG2SGM-4865209365172-459012bb1708cc45c6f1eef8a3808b512ff9cae79f6b4c089b2606147b5f8bf6"
export CLUSTER_NAME=arn:aws:eks:ap-northeast-2:893246771823:cluster/fnb-msa-prod
export ALLOW_KUBECTL=true
export SLACK_CHANNEL_NAME=156_k8s_production

helm install --version v1.0.0 botkube --namespace botkube --create-namespace \
--set communications.default-group.socketSlack.enabled=true \
--set communications.default-group.socketSlack.channels.default.name=${SLACK_CHANNEL_NAME} \
--set communications.default-group.socketSlack.appToken=${SLACK_API_APP_TOKEN} \
--set communications.default-group.socketSlack.botToken=${SLACK_API_BOT_TOKEN} \
--set settings.clusterName=${CLUSTER_NAME} \
--set 'sources.k8s-all-events.botkube/kubernetes.config.namespaces.include'='fnb-msa-prod' \
--set 'executors.k8s-default-tools.botkube/kubectl.enabled'=${ALLOW_KUBECTL} \
--set 'executors.k8s-default-tools.botkube/kubectl.config.defaultNamespace'='fnb-msa-prod' \
botkube/botkube
