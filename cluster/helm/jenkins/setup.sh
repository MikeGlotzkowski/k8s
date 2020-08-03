#!/bin/bash

RELEASE_NAME="jenkins"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ${RELEASE_NAME} bitnami/jenkins
