#!/bin/bash

istioctl install --set values.tracing.enabled=true
kubectl create namespace observability
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/crds/jaegertracing.io_jaegers_crd.yaml --output jaegertracing.io_jaegers_crd.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/service_account.yaml --output service_account.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role.yaml --output role.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/role_binding.yaml --output role_binding.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/operator.yaml --output operator.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role.yaml --output cluster_role.yaml
curl https://raw.githubusercontent.com/jaegertracing/jaeger-operator/master/deploy/cluster_role_binding.yaml --output cluster_role_binding.yaml

# in operator.yaml set value of "- name: WATCH_NAMESPACE" to empty 

kubectl apply -f .

kubectl apply -n observability -f - <<EOF
apiVersion: jaegertracing.io/v1
kind: Jaeger
metadata:
  name: simplest
EOF