@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ kubectl config set-context grafana-monitoring --namespace=monitoring
Context "grafana-monitoring" created.
@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ kubectl config get-contexts
CURRENT   NAME                 CLUSTER    AUTHINFO   NAMESPACE
          grafana-monitoring                         monitoring
*         minikube             minikube   minikube   default
@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ 