#!/bin/bash

RELEASE_NAME="prometheus"

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install ${RELEASE_NAME} stable/prometheus
