# !/bin/bash

echo "$DOCKER_SECRET" | docker login --username $DOCKER_USER --password-stdin
docker push ${IMAGE_NAME}:${IMAGE_VERSION}