#!/bin/bash

helm install datadog-agent -f datadog-values.yaml --set datadog.site='{site}' --set datadog.apiKey='{datadog.apikey}' datadog/datadog -n datadog

