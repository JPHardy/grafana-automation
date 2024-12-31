#!/bin/bash

# Define parameters
dashboardId="fe8kz3h1s6xogb"
tokenId="glsa_i9B85TxcGdhXFuM7W1kb3xIZFBYTpwWe_e6c71798"
serverUrl="http://10.244.0.7:3000"
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