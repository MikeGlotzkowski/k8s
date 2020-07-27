# !/bin/bash

for image in $(docker images | grep 'kafkaproducer\|kafkaconsumer\|gocd-agent-docker-dind-cn' | awk '{print $1":"$2}'); 
do
    docker push $image
done;