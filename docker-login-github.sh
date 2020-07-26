# !/bin/bash
# uses github secrets

echo "loggin in with user: $GITHUB_DOCKER_USERNAME"
docker login -u $GITHUB_DOCKER_USERNAME -p $GITHUB_DOCKER_PASSWORD