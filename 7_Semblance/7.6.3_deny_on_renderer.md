@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" "http://grafana:3000
/render/d-solo/fe6uh0ry1962oe/1?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T
00:00:00.000Z&width=1000&height=500" --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: grafana
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get svc grafana -n grafana-monitoring
NAME      TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
grafana   ClusterIP   10.96.106.94   <none>        3000/TCP   24m
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" "http://10.96.106.94:3000/render/d-solo/fe6uh0ry1962oe/1?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-0
1-03T00:00:00.000Z&width=1000&height=500" --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:01:50 --:--:--     0^C
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" "http://10.96.106.94:3000/render/d-solo/1vqrxqx/1?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00
:00:00.000Z&width=1000&height=500" --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:--  0:01:05 --:--:--     0^C
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" \
>   "http://grafana-renderer:3000/render/d-solo/fe6uh0ry1962oe/1?\
>   orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
>   width=1000&height=500" \
>   --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0curl: (6) Could not resolve host: grafana-renderer
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" \
>   "https://automatic-space-fiesta-xxpj7gqw67cgp4-3000.app.github.dev/render/d-solo/fe6uh0ry1962oe/1?\
>   orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
>   width=1000&height=500" \
>   --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   150  100   150    0     0   1500      0 --:--:-- --:--:-- --:--:--  1515
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -H "Authorization: Bearer glsa_VIzyCRS0VB54j3UUraOluEFtSRR7vtzT_9d162011" \
>   "https://automatic-space-fiesta-xxpj7gqw67cgp4-3000.app.github.dev/render/d-solo/fe6uh0ry1962oe/1?\
>   orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&\
>   width=1000&height=500" \
>   --output dashboard.png
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   150  100   150    0     0   1500      0 --:--:-- --:--:-- --:--:--  1500
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get svc grafana-renderer -n grafana-monitoring
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
grafana-renderer   ClusterIP   10.103.206.15   <none>        3000/TCP   16m
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -v "http://10.103.206.15:3000/render/d-solo/<dashboard-id>?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500"
*   Trying 10.103.206.15:3000...
* TCP_NODELAY set
^C
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -v "http://localhost:3000/render/d-solo/fe6uh0ry1962oe?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500"
*   Trying ::1:3000...
* TCP_NODELAY set
* Connected to localhost (::1) port 3000 (#0)
> GET /render/d-solo/fe6uh0ry1962oe?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500 HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 302 Found
< Content-Type: text/html; charset=utf-8
< Location: /login
< Set-Cookie: redirect_to=%2Frender%2Fd-solo%2Ffe6uh0ry1962oe%3ForgId%3D1%26from%3D2024-01-01T00%3A00%3A00.000Z%26to%3D2024-01-03T00%3A00%3A00.000Z%26width%3D1000%26height%3D500; Path=/; HttpOnly; SameSite=Lax
< X-Content-Type-Options: nosniff
< X-Frame-Options: deny
< X-Xss-Protection: 1; mode=block
< Date: Sat, 14 Dec 2024 01:26:02 GMT
< Content-Length: 29
< 
<a href="/login">Found</a>.

* Connection #0 to host localhost left intact
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ curl -v "http://localhost:3000/render/d-solo/fe6uh0ry1962oe?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500"
*   Trying ::1:3000...
* TCP_NODELAY set
* Connected to localhost (::1) port 3000 (#0)
> GET /render/d-solo/fe6uh0ry1962oe?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500 HTTP/1.1
> Host: localhost:3000
> User-Agent: curl/7.68.0
> Accept: */*
> 
* Mark bundle as not supporting multiuse
< HTTP/1.1 302 Found
< Content-Type: text/html; charset=utf-8
< Location: /login
< Set-Cookie: redirect_to=%2Frender%2Fd-solo%2Ffe6uh0ry1962oe%3ForgId%3D1%26from%3D2024-01-01T00%3A00%3A00.000Z%26to%3D2024-01-03T00%3A00%3A00.000Z%26width%3D1000%26height%3D500; Path=/; HttpOnly; SameSite=Lax
< X-Content-Type-Options: nosniff
< X-Frame-Options: deny
< X-Xss-Protection: 1; mode=block
< Date: Sat, 14 Dec 2024 01:26:22 GMT
< Content-Length: 29
< 
<a href="/login">Found</a>.

* Connection #0 to host localhost left intact
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 


It seems you're encountering a connectivity issue when trying to reach the `grafana-renderer` service. The connection attempt to `10.103.206.15:3000` is not successful, and the request times out.

Here are a few suggestions to troubleshoot and resolve the issue:

### 1. **Check Service Accessibility**
Ensure the `grafana-renderer` service is accessible within the Kubernetes cluster. Since you're using `ClusterIP`, it should only be accessible within the cluster. To confirm if the service is properly exposed, you can use port forwarding:

```bash
kubectl port-forward -n grafana-monitoring svc/grafana-renderer 3000:3000
```

This command will forward the service to your local machine on port `3000`. Then, you can try the `curl` command again with `localhost:3000`.

```bash
curl -v "http://localhost:3000/render/d-solo/<dashboard-id>?orgId=1&from=2024-01-01T00:00:00.000Z&to=2024-01-03T00:00:00.000Z&width=1000&height=500"
```

### 2. **Check Renderer Pod Logs**
If port forwarding does not help, check the logs of the `grafana-renderer` pod to see if it's running properly and if there are any error messages:

```bash
kubectl logs -n grafana-monitoring <renderer-pod-name>
```

Find the pod name using:

```bash
kubectl get pods -n grafana-monitoring
```

### 3. **Verify Grafana-Renderer Deployment**
Check the deployment of the `grafana-renderer` to ensure that it is properly deployed and that the pod is running without issues:

```bash
kubectl get deployment grafana-renderer -n grafana-monitoring
```

### 4. **Accessing Renderer via External URL**
If you're using an external URL (such as `https://automatic-space-fiesta-xxpj7gqw67cgp4-3000.app.github.dev`), make sure it's properly configured and the DNS resolution is correct. From your previous successful curl attempt, it looks like the external URL works. Ensure this URL is being used correctly when you are unable to reach the internal service.

### 5. **Timeout or Resource Issues**
If the service is timing out, it might be due to resource constraints or networking issues within the cluster. You can investigate the pod's resource usage with:

```bash
kubectl describe pod <grafana-renderer-pod> -n grafana-monitoring
```

This can help identify if the pod is being killed or is resource-starved.

Let me know if you encounter any other specific errors during these steps!