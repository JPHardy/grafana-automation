# 🔄 Setting Up Kubernetes Context for Grafana

## Create Context 🛠️

# Create a new context based on your current context
kubectl config set-context grafana-monitoring --namespace=monitoring --cluster=$(kubectl config current-context | cut -d/ -f1) --user=$(kubectl config current-context | cut -d/ -f2)

## Switch to the new context 🛠️

kubectl config use-context grafana-monitoring

## Verify your current context 🛠️

kubectl config current-context

## Verify you're in the correct namespace 🛠️

kubectl config get-contexts

We can use context to save time, we will always operate within the namespace of grafana-monitoring.

prompts:
- objective: install grafana with image renderer
- Format: Create a summary
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
- Rewrite: Eliminate duplicate information