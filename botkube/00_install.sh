#!/bin/sh

helm repo add botkube https://charts.botkube.io
helm repo update


export SLACK_API_BOT_TOKEN={SLACK_API_BOT_TOKEN}
export SLACK_API_APP_TOKEN={SLACK_API_APP_TOKEN}
export CLUSTER_NAME={KUBERNETES_CLUSTER_NAME}
export ALLOW_KUBECTL=true
export SLACK_CHANNEL_NAME={SLACK_CHANNEL_NAME}

helm install --version v1.0.0 botkube --namespace botkube --create-namespace \
--set communications.default-group.socketSlack.enabled=true \
--set communications.default-group.socketSlack.channels.default.name=${SLACK_CHANNEL_NAME} \
--set communications.default-group.socketSlack.appToken=${SLACK_API_APP_TOKEN} \
--set communications.default-group.socketSlack.botToken=${SLACK_API_BOT_TOKEN} \
--set settings.clusterName=${CLUSTER_NAME} \
--set 'executors.k8s-default-tools.botkube/kubectl.enabled'=${ALLOW_KUBECTL} \
botkube/botkube
