# !/bin/bash

for depl in $(find . -type f -name "deployment.yaml"); do kubectl apply -f $depl; done;
