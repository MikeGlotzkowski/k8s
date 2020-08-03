URL:http://127.0.0.1:8153/

"stable" has been added to your repositories
NAME: gocd-app
LAST DEPLOYED: Mon Jul 27 19:50:27 2020
NAMESPACE: default
STATUS: deployed
REVISION: 1
NOTES:
1. Get the GoCD server URL by running these commands:
    It may take a few minutes before the IP is available to access the GoCD server.
         echo "GoCD server public IP: http://$(kubectl get ingress gocd-app-server --namespace=default  -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"

2. Get the service account token to configure the elastic agent plugin by doing the following:
    A default role gocd-app with cluster scoped privileges has been configured.

    The service account called gocd-app in namespace default has been associated with the role. To check,
        secret_name=$(kubectl get serviceaccount gocd-app --namespace=default  -o jsonpath="{.secrets[0].name}")
        kubectl get secret $secret_name --namespace=default -o jsonpath="{.data['token']}" | base64 --decode

    To obtain the CA certificate, do
        kubectl get secret $secret_name --namespace=default  -o jsonpath="{.data['ca\.crt']}" | base64 --decode


3. The GoCD server URL for configuring the Kubernetes elastic agent plugin settings:
    echo "http://$(kubectl get service gocd-app-server --namespace=default  -o jsonpath='{.spec.clusterIP}'):8153/go"

4. The cluster URL for configuring the Kubernetes elastic agent plugin settings can be obtained by:
    kubectl cluster-info

5. Persistence
    ################################################################################################
    WARNING: The default storage class will be used. The reclaim policy for this is usually `Delete`.
    You will lose all data at the time of pod termination!
    ################################################################################################