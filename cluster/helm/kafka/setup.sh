#!/bin/bash

RELEASE_NAME="kafka"

helm repo add bitnami https://charts.bitnami.com/bitnami
helm install ${RELEASE_NAME} bitnami/kafka
