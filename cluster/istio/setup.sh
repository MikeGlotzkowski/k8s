#!/bin/bash

ISTIO_VERSION="1.6.7"
ISTIO_PROFILE="default"
ISTIO_USE_IN_NS="default"
curl -L https://istio.io/downloadIstio | ISTIO_VERSION=$ISTIO_VERSION sh -
cd "istio-$ISTIO_VERSION"
export PATH=$PWD/istio-$ISTIO_VERSION/bin:$PATH
istioctl install --set profile=$ISTIO_PROFILE
kubectl label namespace $ISTIO_USE_IN_NS istio-injection=enabled
istioctl verify-install
istioctl analyze
kubectl get svc istio-ingressgateway -n istio-system
export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')
export INGRESS_HOST="127.0.0.1" #override "localhost"
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].port}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
echo $GATEWAY_URL



