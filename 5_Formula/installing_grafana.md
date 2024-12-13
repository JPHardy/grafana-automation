Sure! Here’s the updated summary to include the installation of the Grafana Image Renderer plugin:

🎯 **Summary: Installing Grafana with Bitnami Helm Chart and Image Renderer Plugin**

🚀 **Quick Install Steps**
- `helm repo add bitnami https://charts.bitnami.com/bitnami` // Add Bitnami repo
- `helm repo update` // Get latest charts
- `kubectl create namespace grafana-monitoring` // Create namespace
- `helm install grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml` // Install Grafana with values file

** Please be patient while the chart is being deployed **

1. Get the application URL by running these commands:
    export NODE_PORT=$(kubectl get --namespace grafana-monitoring -o jsonpath="{.spec.ports[0].nodePort}" services grafana)
    export NODE_IP=$(kubectl get nodes --namespace grafana-monitoring -o jsonpath="{.items[0].status.addresses[0].address}")
    echo http://$NODE_IP:$NODE_PORT

2. Get the admin credentials:

    echo "User: admin"
    echo "Password: $(kubectl get secret grafana-admin --namespace grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d)"


🔑 **Access Setup**
- `kubectl get secret grafana-admin -n grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d` // Get admin password
- `minikube ip` // Get access URL
- Access via: `http://<minikube-ip>:30300` // Default port

⚙️ **Optional Configuration (values.yaml)**
```yaml
plugins:
  install:
    - grafana-image-renderer

securityContext:
  runAsUser: 0
  fsGroup: 1000

extraVolumes:
  - name: plugins
    emptyDir: {}

extraVolumeMounts:
  - name: plugins
    mountPath: /opt/bitnami/grafana/data/plugins
    subPath: plugins
    readOnly: false

admin:
  user: admin
  password: your-password

persistence:
  enabled: true
  size: 30Mi

service:
  type: NodePort
  nodePorts:
    grafana: 30300

metrics:
  enabled: true
```

🔍 **Verification**
- `kubectl get pods -n grafana-monitoring` // Check pod status
- `kubectl get svc -n grafana-monitoring` // Check service status

Would you like me to help with dashboard setup or data source configuration? 🤔

This summary ensures the Image Renderer plugin is included and necessary permissions are set. Let me know if you need any more tweaks! 😊📈🚀


prompt:
- Hello can I use helm and bitnami to install grafana instead?
- Create a summary
- Use emojis
- Use succinct, one-line comment
- Eliminate duplicate information
- this is my original document, please update to reflect the plugin install

