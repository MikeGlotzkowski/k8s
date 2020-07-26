# !/bin/bash
# uses github secrets

echo "loggin in with user: $GITHUB_DOCKER_USERNAM"
docker login -u $GITHUB_DOCKER_USERNAME -p $GITHUB_DOCKER_PASSWORD