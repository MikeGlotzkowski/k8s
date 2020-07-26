# !/bin/bash

IMAGE_NAME='kafkaconsumer-dot-net-core'

for tag in $(docker images | grep ${IMAGE_NAME} | awk '{print $2}'); do docker rmi --force ${IMAGE_NAME}:${tag}; done
docker build -t ${IMAGE_NAME}:0.0.1 .