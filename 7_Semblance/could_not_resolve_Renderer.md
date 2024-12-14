@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" \
>   "http://localhost:3000/render/d-solo/fe6uh0ry1962oe/1?\
>   orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
>   width=1000&height=500" \
>   --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100    15    0    15    0     0     29      0 --:--:-- --:--:-- --:--:--    29
@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" \
>   "http://grafana-renderer:3000/render/d-solo/fe6uh0ry1962oe/1?\
>   orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
>   width=1000&height=500" \
>   --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: grafana-renderer