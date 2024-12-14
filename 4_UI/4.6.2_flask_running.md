@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ kubectl port-forward -n grafana-monitoring svc/json-datasource 3001:80
Error from server (NotFound): services "json-datasource" not found
@rifaterdemsahin ➜ /workspaces/grafana-automation (main) $ cd 6_Symbols/
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl apply -f json-source-code-configmap.yaml
error: the path "json-source-code-configmap.yaml" does not exist
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl apply -f dummy_data_configmap.yaml
configmap/dummy-data created
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl apply -f dummy-service.yaml
error: the path "dummy-service.yaml" does not exist
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl apply -f dummy_service.yaml 
deployment.apps/dummy-deployment created
service/dummy-service created
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                                READY   STATUS    RESTARTS   AGE
dummy-deployment-8599f54774-bf7w6   1/1     Running   0          23s
grafana-5cd79879df-ml9hx            1/1     Running   0          6m8s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring -l app=json-datasource
No resources found in grafana-monitoring namespace.
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring -l app=json-datasourcekubectl logs -n grafana-monitoring -l app=dummy-datakubectl logs -n grafana-monitoring -l app=dummy-data
error: selectors and the all flag cannot be used when passing resource/name arguments
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring -l app=dummy-data
No resources found in grafana-monitoring namespace.
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring -l app=dummy-data
No resources found in grafana-monitoring namespace.
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring
error: expected 'logs [-f] [-p] (POD | TYPE/NAME) [-c CONTAINER]'.
POD or TYPE/NAME is a required argument for the logs command
See 'kubectl logs -h' for help and examples
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl get pods -n grafana-monitoring
NAME                                READY   STATUS    RESTARTS   AGE
dummy-deployment-8599f54774-bf7w6   1/1     Running   0          2m52s
grafana-5cd79879df-ml9hx            1/1     Running   0          8m37s
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ ^C
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ kubectl logs -n grafana-monitoring dummy-deployment-8599f54774-bf7w6
Collecting flask
  Downloading flask-3.1.0-py3-none-any.whl (102 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 103.0/103.0 kB 6.3 MB/s eta 0:00:00
Collecting importlib-metadata>=3.6
  Downloading importlib_metadata-8.5.0-py3-none-any.whl (26 kB)
Collecting click>=8.1.3
  Downloading click-8.1.7-py3-none-any.whl (97 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 97.9/97.9 kB 14.8 MB/s eta 0:00:00
Collecting itsdangerous>=2.2
  Downloading itsdangerous-2.2.0-py3-none-any.whl (16 kB)
Collecting blinker>=1.9
  Downloading blinker-1.9.0-py3-none-any.whl (8.5 kB)
Collecting Jinja2>=3.1.2
  Downloading jinja2-3.1.4-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.3/133.3 kB 11.9 MB/s eta 0:00:00
Collecting Werkzeug>=3.1
  Downloading werkzeug-3.1.3-py3-none-any.whl (224 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 224.5/224.5 kB 16.1 MB/s eta 0:00:00
Collecting zipp>=3.20
  Downloading zipp-3.21.0-py3-none-any.whl (9.6 kB)
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-3.0.2-cp39-cp39-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (20 kB)
Installing collected packages: zipp, MarkupSafe, itsdangerous, click, blinker, Werkzeug, Jinja2, importlib-metadata, flask
Successfully installed Jinja2-3.1.4 MarkupSafe-3.0.2 Werkzeug-3.1.3 blinker-1.9.0 click-8.1.7 flask-3.1.0 importlib-metadata-8.5.0 itsdangerous-2.2.0 zipp-3.21.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv

[notice] A new release of pip is available: 23.0.1 -> 24.3.1
[notice] To update, run: pip install --upgrade pip
 * Serving Flask app 'server'
 * Debug mode: off
WARNING: This is a development server. Do not use it in a production deployment. Use a production WSGI server instead.
 * Running on all addresses (0.0.0.0)
 * Running on http://127.0.0.1:3001
 * Running on http://10.244.0.22:3001
Press CTRL+C to quit
@rifaterdemsahin ➜ /workspaces/grafana-automation/6_Symbols (main) $ 