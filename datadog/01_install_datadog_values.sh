#!/bin/bash

helm install datadog-agent -f datadog-values.yaml --set datadog.site='us5.datadoghq.com' --set datadog.apiKey=f90251964232846919a49cdccccaaa70 datadog/datadog -n datadog

