Events:
  Type     Reason            Age                    From               Message
  ----     ------            ----                   ----               -------
  Warning  FailedScheduling  3m57s                  default-scheduler  0/1 nodes are available: pod has unbound immediate PersistentVolumeClaims. preemption: 0/1 nodes are available: 1 Preemption is not helpful for scheduling.
  Normal   Scheduled         3m56s                  default-scheduler  Successfully assigned grafana-monitoring/grafana-6996cf7c74-nc8bn to minikube
  Normal   Pulling           3m55s                  kubelet            Pulling image "docker.io/bitnami/grafana:11.3.0-debian-12-r3"
  Normal   Pulled            3m36s                  kubelet            Successfully pulled image "docker.io/bitnami/grafana:11.3.0-debian-12-r3" in 19.062s (19.062s including waiting). Image size: 701779472 bytes.
  Normal   Created           2m39s (x4 over 3m36s)  kubelet            Created container grafana
  Normal   Started           2m39s (x4 over 3m36s)  kubelet            Started container grafana
  Normal   Pulled            2m39s (x3 over 3m28s)  kubelet            Container image "docker.io/bitnami/grafana:11.3.0-debian-12-r3" already present on machine
  Warning  BackOff           2m8s (x12 over 3m26s)  kubelet            Back-off restarting failed container grafana in pod grafana-6996cf7c74-nc8bn_grafana-monitoring(8e92878a-4687-4324-99b3-9f557c403ce0)

  prompt:
- objective: Grafana install with helm
- Format: Create a summary
- Format: Use emojis
- Format: one-line comment
- Format: use markdown structure
- Rewrite: Eliminate duplicate information