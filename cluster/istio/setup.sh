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

