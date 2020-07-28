# !/bin/bash

# echo "$DOCKER_SECRET" | docker login --username $DOCKER_USER --password-stdin
docker login -u $DOCKER_USER -p $DOCKER_SECRET
docker push ${IMAGE_NAME}:${IMAGE_VERSION}