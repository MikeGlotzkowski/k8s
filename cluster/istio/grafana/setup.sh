#!/bin/bash

istioctl install --set addonComponents.grafana.enabled=true
# kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000 &
