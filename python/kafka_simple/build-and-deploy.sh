# !/bin/bash
echo "--- starting build --"
./build.sh
echo "--- build finished --"

echo "--- deploying kafka_producer --"
kubectl apply -f ./kafka_producer/deployment.yaml

echo "--- deploying kafka_consumer --"
kubectl apply -f ./kafka_consumer/deployment.yaml

echo "--- deployment finished --"
kubectl get all

echo "--- ready --"
