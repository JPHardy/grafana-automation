@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ helm install grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml

coalesce.go:237: warning: skipped value for grafana.plugins: Not a table.
coalesce.go:237: warning: skipped value for grafana.plugins: Not a table.
NAME: grafana
LAST DEPLOYED: Fri Dec 13 23:42:01 2024
NAMESPACE: grafana-monitoring
STATUS: deployed


@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS    RESTARTS      AGE
grafana-6996cf7c74-49vqd   0/1     Running   2 (17s ago)   49s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS             RESTARTS     AGE
grafana-6996cf7c74-49vqd   0/1     CrashLoopBackOff   2 (3s ago)   52s

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


  ### Summary of Deployment 🛠️

1. **Helm Installation** ✅  
   Successfully installed Grafana using the `bitnami/grafana` chart:  
   ```bash
   helm install grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml
   ```
   - Namespace: `grafana-monitoring`  
   - Status: **Deployed**

2. **Pods Issue** 🚨  
   After deployment, the Grafana pod entered a `CrashLoopBackOff` state:  
   ```bash
   NAME                       READY   STATUS             RESTARTS     AGE
   grafana-6996cf7c74-49vqd   0/1     CrashLoopBackOff   2 (3s ago)   52s
   ```

---

### **Values File Configuration Notes** 📄
- **Plugins**: Configured to install the `grafana-image-renderer`.  
  ```yaml
  plugins:
    install:
      - grafana-image-renderer
  ```
- **Security Context**:  
  ```yaml
  securityContext:
    runAsUser: 0
    fsGroup: 1000
  ```
- **Persistent Storage**: Enabled with a 30Mi size.  
- **Service**: NodePort set to port `30300`.  
- **Metrics**: Monitoring enabled.

---

### **Next Steps to Fix the Crash** 🔧
1. **Check Logs**: Investigate the pod logs to find the root cause of the crash:  
   ```bash
   kubectl logs grafana-6996cf7c74-49vqd -n grafana-monitoring
   ```
2. **Verify Plugins Directory**: Ensure the `extraVolumes` and `extraVolumeMounts` for plugins are correctly configured.  
3. **Inspect Resource Limits**: Verify if the pod has sufficient CPU/Memory allocated.
4. **Confirm Permissions**: Validate `securityContext` configuration to avoid potential permission issues.  

---

### 💡 Tip: Simplify YAML and Eliminate Redundancy  
- **Current Issue**: The `plugins` configuration might not be a valid table structure, as indicated by the warning:  
  ```bash
  coalesce.go:237: warning: skipped value for grafana.plugins: Not a table.
  ```
- **Suggested Fix**: Double-check the `values.yaml` for proper structure, and ensure no duplicate keys.  

Good luck debugging! 🚀


kubectl logs grafana-6996cf7c74-49vqd -n grafana-monitoring

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs grafana-6996cf7c74-49vqd -n grafana-monitoring
grafana 23:44:12.73 INFO  ==> 
grafana 23:44:12.73 INFO  ==> Welcome to the Bitnami grafana container
grafana 23:44:12.81 INFO  ==> Subscribe to project updates by watching https://github.com/bitnami/containers
grafana 23:44:12.81 INFO  ==> Submit issues and feature requests at https://github.com/bitnami/containers/issues
grafana 23:44:12.81 INFO  ==> Upgrade to Tanzu Application Catalog for production environments to access custom-configured and pre-packaged software components. Gain enhanced features, including Software Bill of Materials (SBOM), CVE scan result reports, and VEX documents. To learn more, visit https://bitnami.com/enterprise
grafana 23:44:12.81 INFO  ==> 
map[install:[grafana-image-renderer]]
grafana 23:44:12.92 INFO  ==> Installing plugin map[install @ [grafana-image-renderer]]
The provided version doesn't use semantic versioning format

Error: ✗ 404: Plugin not found
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 


### Root Cause of CrashLoopBackOff 🔍

The logs indicate that the Grafana pod fails due to an issue with the plugin installation:

```plaintext
The provided version doesn't use semantic versioning format
Error: ✗ 404: Plugin not found
```

---

### Why It Happened 🤔

- The plugin `grafana-image-renderer` could not be installed because the version provided or inferred was incorrect, or the plugin name was not recognized.
- Grafana plugins need to be specified with proper versioning or rely on the latest supported version from the official plugin repository.

---

### Fixing the Issue 🛠️

1. **Correct the Plugin Configuration**  
   Update your `values.yaml` to ensure the plugin installation format is correct. Replace:
   ```yaml
   plugins:
     install:
       - grafana-image-renderer
   ```
   with:
   ```yaml
   plugins:
     - "grafana-image-renderer"
   ```

2. **Use the Latest Compatible Plugin Version**  
   Verify the latest supported version of `grafana-image-renderer` in the [Grafana Plugin Directory](https://grafana.com/grafana/plugins/). For example:
   ```yaml
   plugins:
     - "grafana-image-renderer:3.5.0"
   ```

3. **Verify Internet Access**  
   Ensure the pod can reach the Grafana plugin repository over the internet. Check the cluster's network policies or proxy settings.

---

### Steps to Apply the Fix 🚀

1. **Update the `values.yaml`**:
   Correct the `plugins` section and apply the updated configuration:
   ```bash
   helm upgrade grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml
   ```

2. **Delete and Restart the Pod**:
   Clean up the existing pod to force a new pod creation:
   ```bash
   kubectl delete pod grafana-6996cf7c74-49vqd -n grafana-monitoring
   ```

3. **Monitor the Pod Logs**:
   After the fix, monitor logs to confirm successful startup:
   ```bash
   kubectl logs -f grafana-<new-pod-name> -n grafana-monitoring
   ```

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS             RESTARTS      AGE
grafana-5b5b45cc9-gkdpb    0/1     CrashLoopBackOff   1 (9s ago)    13s
grafana-6996cf7c74-49vqd   0/1     CrashLoopBackOff   5 (19s ago)   4m7s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 

---

### Tips 💡
- Always specify plugin versions to avoid compatibility issues.
- Use Helm's `--set` flag for quick debugging, e.g.:
  ```bash
  helm upgrade grafana bitnami/grafana --namespace grafana-monitoring --set plugins[0]="grafana-image-renderer:3.5.0"
  ```
- Confirm that persistent volumes are properly mounted to save plugin installations across restarts. 

Let me know if you need further assistance! 🚀

### Deleting Pods with CrashLoopBackOff 🔧

To delete all problematic Grafana pods in the `grafana-monitoring` namespace, use the following steps:

1. **Delete All Pods in the Namespace**  
   This command will remove all pods in the `grafana-monitoring` namespace:
   ```bash
   kubectl delete pods --all -n grafana-monitoring
   ```

2. **Delete Specific Pods**  
   If you prefer to delete specific pods, run:
   ```bash
   kubectl delete pod grafana-5b5b45cc9-gkdpb -n grafana-monitoring
   kubectl delete pod grafana-6996cf7c74-b7xkf -n grafana-monitoring
   ```

---

### After Deleting Pods 💡
- **New Pods Creation**: Kubernetes will automatically create new pods based on the Deployment or StatefulSet configuration.
- **Monitor Pod Status**:
  ```bash
  kubectl get pods -n grafana-monitoring -w
  ```

If the new pods still enter the `CrashLoopBackOff` state, review the logs with:
```bash
kubectl logs <new-pod-name> -n grafana-monitoring
```

Let me know if you need help debugging further! 🚀

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS             RESTARTS      AGE
grafana-5b5b45cc9-gmtg2    0/1     CrashLoopBackOff   1 (11s ago)   15s
grafana-6996cf7c74-4ktc5   0/1     CrashLoopBackOff   1 (11s ago)   15s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 

To debug the `CrashLoopBackOff` state, check the logs of the problematic pods. Here’s how:

### Check Logs of Individual Pods

1. **Get Logs for a Specific Pod**:
   Replace `<pod-name>` with the name of one of the pods (e.g., `grafana-5b5b45cc9-gmtg2`):
   ```bash
   kubectl logs grafana-5b5b45cc9-gmtg2 -n grafana-monitoring
   ```
   Similarly, for the other pod:
   ```bash
   kubectl logs grafana-6996cf7c74-4ktc5 -n grafana-monitoring
   ```

2. **Follow Logs in Real-Time** (Optional):
   ```bash
   kubectl logs -f <pod-name> -n grafana-monitoring
   ```

---

### Analyze the Output
Once you have the logs, look for errors or stack traces to identify the issue. Common causes include:
- Plugin installation errors.
- Configuration file syntax issues.
- Insufficient permissions or missing dependencies.

---

Let me know what the logs reveal, and I can help troubleshoot further! 🚀


@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs grafana-6996cf7c74-4ktc5 -n grafana-monitoring
grafana 23:49:15.86 INFO  ==> 
grafana 23:49:15.86 INFO  ==> Welcome to the Bitnami grafana container
grafana 23:49:15.86 INFO  ==> Subscribe to project updates by watching https://github.com/bitnami/containers
grafana 23:49:15.86 INFO  ==> Submit issues and feature requests at https://github.com/bitnami/containers/issues
grafana 23:49:15.86 INFO  ==> Upgrade to Tanzu Application Catalog for production environments to access custom-configured and pre-packaged software components. Gain enhanced features, including Software Bill of Materials (SBOM), CVE scan result reports, and VEX documents. To learn more, visit https://bitnami.com/enterprise
grafana 23:49:15.86 INFO  ==> 
[grafana-image-renderer:3.5.0]
grafana 23:49:16.06 INFO  ==> Installing plugin [grafana-image-renderer @ 3.5.0]
The provided version doesn't use semantic versioning format

Error: ✗ 404: Plugin not found

The logs show the issue persists due to an invalid plugin configuration. Here's the root cause and how to fix it:

---

### Root Cause:
1. **Semantic Versioning Issue**:  
   The error indicates that the provided plugin version format isn't compliant with the expected semantic versioning format.
   
2. **Plugin Not Found**:  
   Grafana can't locate the specified plugin version (`grafana-image-renderer:3.5.0`).

---

### Fix:

1. **Remove the Plugin Version**  
   Instead of specifying a version, allow Grafana to install the latest supported version:
   ```yaml
   plugins:
     - "grafana-image-renderer"
   ```

2. **Verify Plugin Compatibility**  
   Check the [Grafana Plugin Directory](https://grafana.com/grafana/plugins/) to confirm the correct plugin name and version. For example, if a specific version is required:
   ```yaml
   plugins:
     - "grafana-image-renderer:3.6.0"
   ```

3. **Ensure Internet Access**  
   Verify that the Grafana pod can reach the internet to download plugins. This may require checking proxy configurations or network policies.

---

### Apply Changes and Restart:
1. **Update the Helm Chart**:  
   Update your `values.yaml` or apply the fix directly:
   ```bash
   helm upgrade grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml
   ```

2. **Delete the Failing Pods**:  
   Let Kubernetes recreate them:
   ```bash
   kubectl delete pods --all -n grafana-monitoring
   ```

3. **Monitor Logs**:  
   Confirm the plugin installation succeeds:
   ```bash
   kubectl logs -f <new-pod-name> -n grafana-monitoring
   ```

---

### Additional Debugging:
If the error persists, manually validate the plugin installation:
```bash
kubectl exec -it <pod-name> -n grafana-monitoring -- bash
grafana-cli plugins install grafana-image-renderer
```

Let me know how it goes! 🚀

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - grafana.resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS             RESTARTS      AGE
grafana-5b5b45cc9-gmtg2    0/1     CrashLoopBackOff   1 (11s ago)   15s
grafana-6996cf7c74-4ktc5   0/1     CrashLoopBackOff   1 (11s ago)   15s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs grafana-6996cf7c74-4ktc5 -n grafana-monitoring
grafana 23:49:15.86 INFO  ==> 
grafana 23:49:15.86 INFO  ==> Welcome to the Bitnami grafana container
grafana 23:49:15.86 INFO  ==> Subscribe to project updates by watching https://github.com/bitnami/containers
grafana 23:49:15.86 INFO  ==> Submit issues and feature requests at https://github.com/bitnami/containers/issues
grafana 23:49:15.86 INFO  ==> Upgrade to Tanzu Application Catalog for production environments to access custom-configured and pre-packaged software components. Gain enhanced features, including Software Bill of Materials (SBOM), CVE scan result reports, and VEX documents. To learn more, visit https://bitnami.com/enterprise
grafana 23:49:15.86 INFO  ==> 
[grafana-image-renderer:3.5.0]
grafana 23:49:16.06 INFO  ==> Installing plugin [grafana-image-renderer @ 3.5.0]
The provided version doesn't use semantic versioning format

Error: ✗ 404: Plugin not found
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl delete pods --all -n grafana-monitoring
pod "grafana-5b5b45cc9-gmtg2" deleted
pod "grafana-6996cf7c74-4ktc5" deleted
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ helm upgrade grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml
Release "grafana" has been upgraded. Happy Helming!
NAME: grafana
LAST DEPLOYED: Fri Dec 13 23:51:07 2024
NAMESPACE: grafana-monitoring
STATUS: deployed
REVISION: 4
TEST SUITE: None
NOTES:
CHART NAME: grafana
CHART VERSION: 11.4.0
APP VERSION: 11.3.0

Did you know there are enterprise versions of the Bitnami catalog? For enhanced secure software supply chain features, unlimited pulls from Docker, LTS support, or application customization, see Bitnami Premium or Tanzu Application Catalog. See https://www.arrow.com/globalecs/na/vendors/bitnami for more information.

** Please be patient while the chart is being deployed **

1. Get the application URL by running these commands:
    export NODE_PORT=$(kubectl get --namespace grafana-monitoring -o jsonpath="{.spec.ports[0].nodePort}" services grafana)
    export NODE_IP=$(kubectl get nodes --namespace grafana-monitoring -o jsonpath="{.items[0].status.addresses[0].address}")
    echo http://$NODE_IP:$NODE_PORT

2. Get the admin credentials:

    echo "User: admin"
    echo "Password: $(kubectl get secret grafana-admin --namespace grafana-monitoring -o jsonpath="{.data.GF_SECURITY_ADMIN_PASSWORD}" | base64 -d)"
# Note: Do not include grafana.validateValues.database here. See https://github.com/bitnami/charts/issues/20629


WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - grafana.resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl delete pods --all -n grafana-monitoring
pod "grafana-597c784f59-tmbzs" deleted
pod "grafana-5b5b45cc9-xwfmh" deleted
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl delete pods --all -n grafana-monitoring
pod "grafana-597c784f59-b9565" deleted
pod "grafana-5b5b45cc9-sbrll" deleted
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS             RESTARTS     AGE
grafana-597c784f59-cpbxw   0/1     CrashLoopBackOff   1 (4s ago)   8s
grafana-5b5b45cc9-n2s28    0/1     CrashLoopBackOff   1 (4s ago)   8s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 


If you'd like to manually install the `grafana-image-renderer` plugin after the pod is created, here’s how you can proceed:

---

### Steps to Manually Install Plugin 🛠️

1. **Exec into the Pod**  
   Use `kubectl exec` to get a shell inside the Grafana pod:
   ```bash
   kubectl exec -it <pod-name> -n grafana-monitoring -- bash
   ```
   Replace `<pod-name>` with the name of your running Grafana pod, e.g., `grafana-6996cf7c74-4ktc5`.

2. **Run the Plugin Installation Command**  
   Inside the pod, run the Grafana CLI command to install the `grafana-image-renderer` plugin:
   ```bash
   grafana-cli plugins install grafana-image-renderer
   ```

3. **Restart the Pod**  
   After installing the plugin, restart the Grafana pod to apply the changes:
   ```bash
   kubectl delete pod <pod-name> -n grafana-monitoring
   ```

4. **Verify Plugin Installation**  
   Once the pod restarts, check the installed plugins using the Grafana CLI:
   ```bash
   kubectl exec -it <new-pod-name> -n grafana-monitoring -- bash
   grafana-cli plugins ls
   ```

---

### Persistent Fix (Optional) 💡

For future-proofing, you can automate this by adding an `initContainer` to your Helm chart. This container would pre-install the plugin before the main Grafana container starts.

Example:
```yaml
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
```

This ensures the plugin is always installed during deployment. Let me know if you need help with that configuration! 🚀

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
        
# prompts:
# - objective: cli install with image renderer
# - Format: Create a summary
# - Format: Use emojis
# - Format: one-line comment
# - Format: use markdown structure
# - Rewrite: Eliminate duplicate information

