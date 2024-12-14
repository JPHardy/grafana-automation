@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS    RESTARTS   AGE
grafana-6f744c848d-8fjbb   0/1     Pending   0          35s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl describe pod -n grafana-monitoring
Name:             grafana-6f744c848d-8fjbb
Namespace:        grafana-monitoring
Priority:         0
Service Account:  grafana
Node:             minikube/192.168.49.2
Start Time:       Sat, 14 Dec 2024 00:53:08 +0000
Labels:           app.kubernetes.io/component=grafana
                  app.kubernetes.io/instance=grafana
                  app.kubernetes.io/managed-by=Helm
                  app.kubernetes.io/name=grafana
                  app.kubernetes.io/version=11.3.0
                  helm.sh/chart=grafana-11.4.0
                  pod-template-hash=6f744c848d
Annotations:      checksum/config: 3c99c7b861e9ddcb11e8be27314bf471dd18c79b6d06e5a0a25b71c04041879b
                  checksum/dashboard-provider: 01ba4719c80b6fe911b091a7c05124b64eeece964e09c058ef8f9805daca546b
                  checksum/secret: 627dc5377e2fd5403639f99aa6ebdba4e4f025062e8a39b24de9f8c99fd50754
Status:           Pending
IP:               
IPs:              <none>
Controlled By:    ReplicaSet/grafana-6f744c848d
Containers:
  grafana:
    Container ID:    
    Image:           docker.io/bitnami/grafana:11.3.0-debian-12-r3
    Image ID:        
    Port:            3000/TCP
    Host Port:       0/TCP
    SeccompProfile:  RuntimeDefault
    State:           Waiting
      Reason:        ContainerCreating
    Ready:           False
    Restart Count:   0
    Limits:
      cpu:                150m
      ephemeral-storage:  2Gi
      memory:             192Mi
    Requests:
      cpu:                100m
      ephemeral-storage:  50Mi
      memory:             128Mi
    Liveness:             tcp-socket :dashboard delay=120s timeout=5s period=10s #success=1 #failure=6
    Readiness:            http-get http://:dashboard/api/health delay=30s timeout=5s period=10s #success=1 #failure=6
    Environment Variables from:
      grafana-envvars  ConfigMap  Optional: false
    Environment:
      GF_SECURITY_ADMIN_PASSWORD:  <set to the key 'GF_SECURITY_ADMIN_PASSWORD' in secret 'grafana-admin'>  Optional: false
    Mounts:
      /bitnami/grafana from empty-dir (rw,path="app-volume-dir")
      /opt/bitnami/grafana/conf from empty-dir (rw,path="app-conf-dir")
      /opt/bitnami/grafana/data from data (rw)
      /opt/bitnami/grafana/tmp from empty-dir (rw,path="app-tmp-dir")
      /tmp from empty-dir (rw,path="tmp-dir")
Conditions:
  Type                        Status
  PodReadyToStartContainers   False 
  Initialized                 True 
  Ready                       False 
  ContainersReady             False 
  PodScheduled                True 
Volumes:
  empty-dir:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  data:
    Type:        PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:   grafana
    ReadOnly:    false
QoS Class:       Burstable
Node-Selectors:  <none>
Tolerations:     node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                 node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason            Age               From               Message
  ----     ------            ----              ----               -------
  Warning  FailedScheduling  5s (x2 over 43s)  default-scheduler  0/1 nodes are available: pod has unbound immediate PersistentVolumeClaims. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.
  Normal   Scheduled         3s                default-scheduler  Successfully assigned grafana-monitoring/grafana-6f744c848d-8fjbb to minikube
  Normal   Pulling           3s                kubelet            Pulling image "docker.io/bitnami/grafana:11.3.0-debian-12-r3"
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS    RESTARTS   AGE
grafana-6f744c848d-8fjbb   0/1     Running   0          84s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                       READY   STATUS    RESTARTS   AGE
grafana-6f744c848d-8fjbb   1/1     Running   0          114s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 