To update the steps for setting up **remote rendering** for **Grafana** using **Minikube**, you can follow this approach by setting up the necessary components in Kubernetes, instead of using Docker Compose. Here is how to do it:

### Steps to Set Up Remote Rendering for Grafana on Minikube:

1. **Deploy a Separate Image Renderer Container**:
   - Use the official **Grafana Image Renderer** Docker image that includes the required dependencies.
   - Create a Kubernetes deployment for the **Image Renderer** service.

2. **Create Kubernetes Resources**:
   First, define your Kubernetes resources for both **Grafana** and the **Image Renderer**.

#### Example Kubernetes Configuration:

```yaml
# grafana-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
      - name: grafana
        image: grafana/grafana:latest
        env:
          - name: GF_SECURITY_ADMIN_PASSWORD
            value: "your-password"
          - name: GF_RENDERING_ENABLED
            value: "true"
          - name: GF_RENDERING_SERVER_URL
            value: "http://grafana-renderer:3000/render"
        ports:
          - containerPort: 3000
        volumeMounts:
          - name: grafana-data
            mountPath: /var/lib/grafana
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana-renderer
spec:
  replicas: 1
  selector:
    matchLabels:
      app: grafana-renderer
  template:
    metadata:
      labels:
        app: grafana-renderer
    spec:
      containers:
      - name: grafana-renderer
        image: grafana/grafana-image-renderer:latest
        ports:
          - containerPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: grafana
spec:
  selector:
    app: grafana
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
---
apiVersion: v1
kind: Service
metadata:
  name: grafana-renderer
spec:
  selector:
    app: grafana-renderer
  ports:
    - protocol: TCP
      port: 3000
      targetPort: 3000
```

3. **Apply Kubernetes Configurations**:
   - Apply the resources using `kubectl` to deploy **Grafana** and the **Image Renderer** on your Minikube cluster.

   ```bash
   kubectl apply -f grafana-deployment.yaml
   ```

4. **Expose Grafana and Renderer**:
   - **Grafana** can be exposed via a **ClusterIP** or **NodePort** service to make it accessible. If you want to access it from outside the cluster, expose it as a **NodePort**.

   Here’s an example to update **Grafana** as a **NodePort**:

   ```yaml
   apiVersion: v1
   kind: Service
   metadata:
     name: grafana
   spec:
     selector:
       app: grafana
     ports:
       - protocol: TCP
         port: 3000
         targetPort: 3000
     type: NodePort
   ```

   Apply this using:

   ```bash
   kubectl apply -f grafana-nodeport-service.yaml
   ```

5. **Access Grafana**:
   Once both deployments are up and running, access **Grafana** via the **NodePort**.

   You can find the Minikube IP and Grafana port by running:

   ```bash
   minikube service grafana --url
   ```

6. **Verify Remote Rendering Configuration**:
   - Ensure that **Grafana** is correctly configured to use the **renderer** by checking the **GF_RENDERING_SERVER_URL** environment variable. You should be able to see rendering in the Grafana dashboards.

### Key Points:
- **Grafana Image Renderer** should be deployed as a separate service in your Minikube cluster.
- **Grafana** should be configured to use the **Image Renderer** by setting `GF_RENDERING_SERVER_URL` to the renderer service URL (`http://grafana-renderer:3000/render`).
- You can access **Grafana** using a **NodePort** service exposed by Minikube.

This configuration avoids modifying the base **Grafana Docker image** and ensures rendering tasks are handled remotely using the dedicated renderer container.