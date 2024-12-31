#!/bin/bash

# Define parameters
dashboardId="be8l3oicijawwd"
tokenId="glsa_RGkj5jfMMcCXwF8HIdn3V9XJIUt86w3R_bc18f0da"
# kubectl get endpoints -n grafana-monitoring
serverUrl="http://10.244.0.3:3000"
panelId="1"
from="2024-01-01T00:00:00.000Z"
to="2024-01-03T00:00:00.000Z"
width="1000"
height="500"
outputFile="dashboard.png"

# Curl command to render the dashboard
curl -H "Authorization: Bearer $tokenId" \
  "$serverUrl/render/d-solo/$dashboardId/$panelId?orgId=1&from=$from&to=$to&width=$width&height=$height" \
  --output $outputFile