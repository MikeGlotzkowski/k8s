# !/bin/bash

export IMAGE_NAME='sebilhd/kafkaconsumer-python'
export IMAGE_VERSION='0.0.18'
# for tag in $(docker images | grep ${IMAGE_NAME} | awk '{print $2}'); do docker rmi --force ${IMAGE_NAME}:${tag}; done
docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} .
