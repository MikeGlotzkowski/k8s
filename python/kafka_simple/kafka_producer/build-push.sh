# !/bin/bash

export IMAGE_NAME='sebilhd/kafkaproducer-python'
export IMAGE_VERSION='0.0.14'
echo "=================================================="
echo "Building $IMAGE_NAME in version $IMAGE_VERSION"
docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} .
echo "=================================================="
echo "Loggin in into docker registry as $DOCKER_USER"
echo "$DOCKER_SECRET" | docker login --username $DOCKER_USER --password-stdin
echo "=================================================="
echo "Pushing $IMAGE_NAME in version $IMAGE_VERSION"
docker push ${IMAGE_NAME}:${IMAGE_VERSION}
echo "=================================================="
