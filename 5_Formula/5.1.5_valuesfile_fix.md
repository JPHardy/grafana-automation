Here is a concise summary of the Grafana installation with the image renderer plugin:

```yaml
# Grafana Installation with Image Renderer Plugin
initContainers:
  - name: install-plugins
    image: bitnami/grafana:latest
    command:
      - grafana-cli
      - plugins
      - install
      - grafana-image-renderer
    volumeMounts:
      - name: plugins
        mountPath: /opt/bitnami/grafana/data/plugins

securityContext:
  runAsUser: 0 # Run as root
  fsGroup: 1000 # Set file system group

extraVolumes:
  - name: plugins
    emptyDir: {} # Temporary storage for plugins

extraVolumeMounts:
  - name: plugins
    mountPath: /opt/bitnami/grafana/data/plugins
    subPath: plugins
    readOnly: false # Allow write access

admin:
  user: admin # Admin username
  password: your-password # Set your own password

persistence:
  enabled: true # Enable data persistence
  size: 30Mi # Set persistence size

service:
  type: NodePort # Expose service via NodePort
  nodePorts:
    grafana: 30300 # Grafana port

metrics:
  enabled: true # Enable metrics
```

**Objective**: Install Grafana with the image renderer plugin 🚀  
**Steps**:  
1. **Install Plugin**: Use `grafana-cli` in an init container 🛠️  
2. **Permissions**: Set `securityContext` to run as root and adjust file system group 👥  
3. **Persistence**: Enable data persistence with a 30Mi size for storage 💾  
4. **Expose**: Service set as NodePort for access at port 30300 🌐

**Format**: Simplified with necessary configuration and environment setup