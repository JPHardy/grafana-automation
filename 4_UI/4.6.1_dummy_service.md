@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl port-forward -n grafana-monitoring svc/dummy-deployment 3001:80
Error from server (NotFound): services "dummy-deployment" not found
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl apply -f dummy_service.yaml
deployment.apps/dummy-deployment unchanged
service/dummy-service unchanged
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ ^C
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl port-forward -n grafana-monitoring svc/dummy-service 3001:80
Forwarding from 127.0.0.1:3001 -> 3001
Forwarding from [::1]:3001 -> 3001
