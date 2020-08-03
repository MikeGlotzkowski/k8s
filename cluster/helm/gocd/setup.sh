#!/bin/bash

RELEASE_NAME="gocd-app"

helm repo add stable https://kubernetes-charts.storage.googleapis.com
helm install ${RELEASE_NAME} stable/gocd -f values.yaml

