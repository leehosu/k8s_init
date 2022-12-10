#!/bin/bash

kubectl create ns datadog

helm repo add datadog https://helm.datadoghq.com

helm repo update
