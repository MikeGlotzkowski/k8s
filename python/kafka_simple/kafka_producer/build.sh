# !/bin/bash

IMAGE_NAME='kafkaproducer'

for tag in $(docker images | grep ${IMAGE_NAME} | awk '{print $2}'); do docker rmi --force ${IMAGE_NAME}:${tag}; done
docker build -t ${IMAGE_NAME}:0.0.11 .