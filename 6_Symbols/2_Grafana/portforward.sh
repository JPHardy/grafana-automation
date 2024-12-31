#!/bin/bash
kubectl port-forward -n grafana-monitoring svc/grafana 3000:3000
kubectl port-forward -n grafana-monitoring svc/grafana-imagerenderer 8081:3000
#This command will forward port 8081 on your local machine to port 3000 on the Grafana Renderer service. You can then access the Grafana Renderer at `http://localhost:8080`.


# prompts:
# - rewrite with comments
# - write as a bash file