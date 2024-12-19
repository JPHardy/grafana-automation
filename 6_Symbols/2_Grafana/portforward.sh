#!/bin/bash
kubectl port-forward -n grafana-monitoring svc/grafana 3000:3000
kubectl port-forward -n grafana-monitoring service/grafana-renderer 8080:3000
#This command will forward port 8080 on your local machine to port 3000 on the Grafana Renderer service. You can then access the Grafana Renderer at `http://localhost:8080`.


# prompts:
# - rewrite with comments
# - write as a bash file