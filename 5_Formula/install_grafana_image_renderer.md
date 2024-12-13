### Summary: Install Grafana with Image Renderer 🚀📊  

1️⃣ **Install Grafana CLI:**  
   ```bash  
   npm install -g @grafana/cli  
   ```  
   🛠️ *Verify with* `grafana-cli --version`.  

2️⃣ **Access Grafana Pod via Kubectl:**  
   ```bash  
   kubectl exec -it <pod-name> -n grafana-monitoring -- /bin/bash  
   ```  

3️⃣ **Install Image Renderer Plugin:**  
   ```bash  
   grafana-cli plugins install grafana-image-renderer  
   ```  
   🖼️ *Enables rendering support.*  

4️⃣ **Prepare `values.yaml` for Helm Install:**  
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
   ```  

5️⃣ **Install Grafana with Helm:**  
   ```bash  
   helm install grafana bitnami/grafana --namespace grafana-monitoring -f values.yaml  
   ```  
   🎯 *Deploy Grafana with configured plugin.*  

Enjoy visualizing your data with enhanced image rendering! 🎨✨

prompt:
- objective: install grafana with image renderer
- Format: Create a summary
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
- Rewrite: Eliminate duplicate information