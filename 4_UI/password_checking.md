@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get secret grafana-admin --namespace grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d
your-password@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 
