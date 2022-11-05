#!/bin/sh

## 1) 기존의 cm 제거
## kubectl get cm -n logging
## kubectl delete cm fluent-bit-config

## 2) apply  01_fluentbit-cm.yaml

## 3) fluentbit 재시작 - delete pod
