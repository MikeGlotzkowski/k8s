# k8s

![build and push all](https://github.com/MikeGlotzkowski/k8s/workflows/build%20and%20push%20all/badge.svg?branch=master)

## Komponents

### Cluster
    - Helm installed
        - GOCD (Piplines as code in repo, dynmic agents based on own agent image)
        - ~~Jenkins~~ (replaced by gocd)
        - Kafka (currently as message queue only)
        - Prometheus (log collecting, alertmanager)
    - Istio installed
        - Grafana (dashboard)
        - Kiali (mesh visualization)
    - Kubectl installed
        - Jaeger (distributed tracing)

### Application
    - One Kafka Topic
    - A python kafka producer sending messages and sleeping random times.
    - A python kafka consumer reading messages in one group.
    - A golang kafka consumer reading messages in one group.
    - A .net core kafka consumer reading messages in one group.
