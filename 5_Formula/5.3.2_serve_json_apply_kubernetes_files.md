# 📊 JSON Data Source for Grafana

This guide helps set up a JSON data source that will serve mock data to Grafana dashboards for testing and development.

## 🔄 Relationship to Project
- Provides test data for Grafana dashboards // Mock data source for visualization
- Works with grafana-image-renderer // Enables screenshot testing with sample data
- Part of monitoring namespace // Integrates with Grafana monitoring stack

## 🚀 Deployment Steps
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

prompts:
- objective: explain the serve_json_apply_kubernetes_files.md file
- keyresults: explain the steps to apply the kubernetes files
- keyresults: explain the relationship to rest of the project
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
