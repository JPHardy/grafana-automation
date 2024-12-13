# 🔄 Upgrade Grafana Helm Chart

## 🚀 Command
`helm upgrade grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml` // Update Grafana deployment with new values

## 💡 Purpose
- Updates Grafana configuration // Apply changes from values.yaml
- Maintains namespace isolation // Keeps monitoring resources separate
- Uses Bitnami's stable chart // Ensures reliable deployment


prompts:
- objective: explain 
- keyresults: explain the relationship to rest of the project
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure