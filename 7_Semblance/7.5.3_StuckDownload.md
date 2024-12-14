@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" "http://10.96.200.10:3000/render/d-solo/fe6uh0ry1962oe/1?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500" --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:01:06 --:--:--     0

  port count check and rerun


  @rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ kubectl port-forward -n grafana-monitoring svc/grafana-renderer 3001:3000
Forwarding from 127.0.0.1:3001 -> 3000
Forwarding from [::1]:3001 -> 3000

@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl port-forward -n grafana-monitoring svc/grafana 3000:3000
Forwarding from 127.0.0.1:3000 -> 3000
Forwarding from [::1]:3000 -> 3000
