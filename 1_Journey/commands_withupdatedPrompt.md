Based on the project files and error documentation, I'll help organize a more comprehensive command reference that includes error handling and troubleshooting steps. Here's the updated structure:

# 📋 Complete Command Reference

## 🚀 1. Initial Environment Setup
```bash
# Start Minikube with sufficient resources
minikube start --memory=4096 --cpus=2

# Verify Minikube status
minikube status

# Create monitoring namespace
kubectl create namespace grafana-monitoring

# Set and verify context
kubectl config set-context grafana-monitoring --namespace=monitoring
kubectl config use-context grafana-monitoring
kubectl config get-contexts
```

## 📦 2. Grafana Installation with Image Renderer

### Install via Helm
```bash
# Add and update Bitnami repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

# Get and customize values file
helm show values bitnami/grafana > values.yaml

# Add image renderer to values.yaml
plugins:
  install:
    - grafana-image-renderer

# Install Grafana
helm install grafana bitnami/grafana \
  --namespace grafana-monitoring \
  -f values.yaml
```

### Verify Installation
```bash
# Check pod status
kubectl get pods -n grafana-monitoring
# If pods are failing, check events
kubectl describe pod -n grafana-monitoring

# Get admin password (may need different secret name based on installation)
kubectl get secret grafana-admin \
  --namespace grafana-monitoring \
  -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d
```

## 🔄 3. Port Forwarding and Access

### Local Development
```bash
# Forward Grafana UI
kubectl port-forward -n grafana-monitoring svc/grafana 3000:3000

# Forward JSON data source (if using)
kubectl port-forward -n grafana-monitoring svc/json-datasource 3001:80
```

### Codespaces Environment
```bash
# Use Codespaces URL format
https://<codespace-name>-<port>.preview.app.github.dev
```

## 📸 4. Screenshot API Usage

### Setup API Key
```bash
# Test API key access
curl -H "Authorization: Bearer YOUR_API_KEY" \
  "http://localhost:3000/api/dashboards/home"

# Render dashboard with time range
curl -H "Authorization: Bearer YOUR_API_KEY" \
  "http://localhost:3000/render/d-solo/dashboard_uid/panel_id?\
  orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
  width=1000&height=500" \
  --output dashboard.png
```

## 🔧 5. Troubleshooting Commands

### Pod Issues
```bash
# Check pod logs
kubectl logs -n grafana-monitoring <pod-name>

# Check pod events
kubectl describe pod -n grafana-monitoring <pod-name>

# Restart deployment
kubectl rollout restart deployment -n grafana-monitoring grafana
```

### Plugin Issues
```bash
# Check plugin status from within pod
kubectl exec -it -n grafana-monitoring <pod-name> -- \
  grafana-cli plugins ls
```

## 🧹 6. Cleanup
```bash
# Remove Grafana installation
helm uninstall grafana -n grafana-monitoring

# Delete namespace and all resources
kubectl delete namespace grafana-monitoring

# Stop Minikube if needed
minikube stop
```

> 💡 **Common Issues & Solutions**:
- Secret not found: Verify secret name matches installation
- Port forwarding issues: Use Codespaces URL format
- Image renderer fails: Check plugin installation in values.yaml
- API errors: Verify API key has correct permissions

> ⚠️ **Prerequisites**:
- Minikube or K8s cluster running
- Helm 3.x installed
- kubectl configured
- Sufficient cluster resources

prompt:
# 🎯 Objective
- Create a comprehensive list of all commands from project files in logical order
- Ensure commands are properly categorized and documented
- Include relevant context and prerequisites

# 📋 Requirements
- Scan all project files for commands and scripts
- Organize commands by workflow stage/purpose
- Add descriptions and usage notes
- Validate command syntax
- Include error handling guidance

# 🔄 Actions
1. Review all project files systematically
2. Extract and document commands
3. Group related commands together
4. Add proper formatting and structure
5. Test command sequences
6. Update documentation with findings

# 📝 Format Guidelines
- Use clear section headers
- Include command descriptions
- Add usage examples
- Note prerequisites
- Document expected outputs
- Highlight important warnings

# 🏷️ Categories to Include
- Setup/Installation
- Configuration
- Operation/Usage
- Maintenance
- Troubleshooting
- Cleanup

