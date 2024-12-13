# 🔐 Grafana Admin Secret Not Found

## 🔍 Command Attempted
kubectl get secret grafana-admin -n grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d
Error from server (NotFound): secrets "grafana-admin" not found

prompt:
- objective: explain 
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
- Rewrite: Eliminate duplicate information