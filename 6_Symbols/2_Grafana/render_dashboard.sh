#!/bin/bash
# /workspaces/grafana-automation/6_Symbols/2_Grafana/render_dashboard.sh

# Define parameters
dashboardId="ee8l7vngt74lcc"
tokenId="glsa_A5cBg7AnfN31RcsUnYRY4ZOVYfTsKoUa_7fd912b0"
# minikube ip to send the query to a port forwarded enviroment from the codespaces terminal!
serverUrl="http://192.168.49.2:3000"
panelId="1"
from="2024-01-01T00:00:00.000Z"
to="2024-01-03T00:00:00.000Z"
width="1000"
height="500"
outputFile="dashboard.pdf"

# Curl command to render the dashboard
curl -H "Authorization: Bearer $tokenId" \
  "$serverUrl/render/d-solo/$dashboardId/$panelId?orgId=1&from=$from&to=$to&width=$width&height=$height" \
  --output $outputFile