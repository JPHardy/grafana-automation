I'll help organize all the commands from the project files into a logical sequence. Here's a comprehensive list:

# 📋 Complete Command Reference

## 🚀 1. Initial Setup
```bash
# Clone and setup repository
git pull
git add .
git commit -m "Codespaces" -m "updates"
git push
```

## 🛠️ 2. Minikube Setup
```bash
# Start Minikube cluster
minikube start

# Verify status
minikube status

# Get Minikube IP
minikube ip
```

## 📦 3. Grafana Installation

### Create Namespace
```bash
# Create monitoring namespace
kubectl create namespace grafana-monitoring

# Set context to new namespace
kubectl config set-context grafana-monitoring --namespace=monitoring --cluster=$(kubectl config current-context | cut -d/ -f1) --user=$(kubectl config current-context | cut -d/ -f2)

# Switch to new context
kubectl config use-context grafana-monitoring
```

### Install Grafana
```bash
# Add Bitnami repo
helm repo add bitnami https://charts.bitnami.com/bitnami

# Update repos
helm repo update

# Get values file
helm show values bitnami/grafana > values.yaml

# Install Grafana
helm install grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml
```

## 🔍 4. Verification Commands
```bash
# Check pod status
kubectl get pods -n grafana-monitoring

# Check services
kubectl get svc -n grafana-monitoring

# Get admin password
kubectl get secret grafana-admin --namespace grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d

# Get service URL
export NODE_PORT=$(kubectl get --namespace grafana-monitoring -o jsonpath="{.spec.ports[0].nodePort}" services grafana)
export NODE_IP=$(kubectl get nodes --namespace grafana-monitoring -o jsonpath="{.items[0].status.addresses[0].address}")
echo http://$NODE_IP:$NODE_PORT
```

## 🔄 5. Port Forwarding
```bash
# Forward Grafana service
kubectl port-forward -n grafana-monitoring svc/grafana 3000:3000

# Forward JSON data service
kubectl port-forward -n grafana-monitoring svc/json-datasource 3001:80
```

## 📸 6. Screenshot API Commands
```bash
# Basic screenshot command
curl -H "Authorization: Bearer YOUR_API_KEY" \
"https://YOUR-GRAFANA-URL/render/d-solo/your_dashboard_uid/your_panel_id?orgId=1&width=800&height=600&tz=UTC%2B00%3A00" \
--output image.png

# Dashboard home API test
curl -H "Authorization: Bearer YOUR_API_KEY" \
"http://localhost:3000/api/dashboards/home"
```

## 🔄 7. Upgrade/Maintenance Commands
```bash
# Upgrade Grafana installation
helm upgrade grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml

# Check deployment events
kubectl describe pod -n grafana-monitoring
```

## 🧹 8. Cleanup Commands
```bash
# Delete Grafana installation
helm uninstall grafana -n grafana-monitoring

# Delete namespace
kubectl delete namespace grafana-monitoring
```

> 💡 **Note**: Replace placeholders like `YOUR_API_KEY`, `YOUR-GRAFANA-URL`, and `your_dashboard_uid` with actual values from your setup.

> ⚠️ **Important**: Ensure you're in the correct namespace before running commands. Use `kubectl config get-contexts` to verify your current context.

prompts:
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

