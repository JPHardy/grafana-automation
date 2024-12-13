This is to create deployment so we can serve dummy data to Grafana.

# Apply the ConfigMap first
kubectl apply -f json-source-code-configmap.yaml

# Apply the deployment and service
kubectl apply -f json-server-deployment.yaml

# Verify the pod is running
kubectl get pods -n monitoring

# Check the logs
kubectl logs -n monitoring -l app=json-datasource

# Test the endpoint
kubectl port-forward -n monitoring svc/json-datasource 3001:80