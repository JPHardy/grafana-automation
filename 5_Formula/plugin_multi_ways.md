logo for Grafana Image Renderer
Grafana Image Renderer
Version
3.11.6
From
Grafana Labs
Downloads
17,496,079
Dependencies
Grafana >=8.3.11
Signature
Signed
Grafana Backend Image Renderer that uses headless chrome to capture images.
Project site | Apache License
Renderer plugins cannot be managed by the Plugin Catalog.
Overview
Version history
Changelog
A Grafana backend plugin that handles rendering panels and dashboards to PNGs using a headless browser (Chromium).

Requirements
Supported operating systems
Linux (x64)
Windows (x64)
Mac OS X (x64)
Dependencies
This plugin is packaged in a single executable with Node.js runtime and Chromium browser. This means that you don't need to have Node.js and Chromium installed in your system for the plugin to function.

However, the Chromium browser depends on certain libraries. If you don't have all of those libraries installed in your system, you may see some errors when you try to render an image. For more information including troubleshooting help, refer to Grafana Image Rendering documentation.

Memory requirements
Rendering images requires a lot of memory, mainly because Grafana creates browser instances in the background for the actual rendering. We recommend a minimum of 16GB of free memory on the system rendering images.

Rendering multiple images in parallel requires an even bigger memory footprint. You can use the remote rendering service in order to render images on a remote system, so your local system resources are not affected.

Plugin installation
You can install the plugin using Grafana CLI (recommended way) or with Grafana Docker image.

Grafana CLI (recommended)
grafana-cli plugins install grafana-image-renderer
Grafana Docker image
This plugin is not compatible with the current Grafana Docker image and requires additional system-level dependencies. We recommend setting up another Docker container for rendering and using remote rendering instead. For instruction, refer to Run in Docker.

If you still want to install the plugin with the Grafana Docker image, refer to the instructions on building a custom Grafana image in Grafana Docker documentation.

Remote rendering service installation
Note: Requires an internet connection.

You can run this plugin as a remote HTTP rendering service. In this setup, Grafana renders an image by making an HTTP request to the remote rendering service, which in turn renders the image and returns it back in the HTTP response to Grafana.

You can run the remote HTTP rendering service using Docker or as a standalone Node.js application.

Run in Docker
Grafana Docker images are published at Docker Hub.

The following example shows how you can run Grafana and the remote HTTP rendering service in two separate Docker containers using Docker Compose.

Create a docker-compose.yml with the following content:

version: '2'

services:
  grafana:
    image: grafana/grafana:latest
    ports:
      - '3000:3000'
    environment:
      GF_RENDERING_SERVER_URL: http://renderer:8081/render
      GF_RENDERING_CALLBACK_URL: http://grafana:3000/
      GF_LOG_FILTERS: rendering:debug
  renderer:
    image: grafana/grafana-image-renderer:latest
    ports:
      - 8081
Next, run docker compose.

docker-compose up
Run as standalone Node.js application
The following example describes how to build and run the remote HTTP rendering service as a standalone Node.js application and configure Grafana appropriately.

Clone the Grafana image renderer plugin Git repository.

Install dependencies and build:

yarn install --pure-lockfile
yarn run build
Run the server:

node build/app.js server --port=8081
Update Grafana configuration:

[rendering]
server_url = http://localhost:8081/render
callback_url = http://localhost:3000/
Restart Grafana.

Security
Access to the rendering endpoints is restricted to requests providing an auth token. This token should be configured in the Grafana configuration file and the renderer configuration file. This token is important when you run the plugin in remote rendering mode to avoid unauthorized file disclosure (see CVE-2022-31176).

See Grafana Image Rendering documentation to configure this secret token. The default value - is configured on both Grafana and the image renderer when you get started but we strongly recommend you to update this to a more secure value.

Configuration
For available configuration settings, please refer to Grafana Image Rendering documentation.

Troubleshooting
For troubleshooting help, refer to Grafana Image Rendering troubleshooting documentation.

Testing
In order to run the image-renderer automated test suites, you need to run the following command from the root folder:

yarn test
This will launch a Grafana instance in Docker and, then, run the test suites.

Notes:

If there are some expected changes in the reference image files (located in /tests/testdata), run yarn test-update and push the updated references.

If the tests are failing and you want to see the difference between the image you get and the reference image, run yarn test-diff. This will generate images (called diff_<test case>.png) containing the differences in the /tests/testdata folder.

Fixing Drone issues
If tests are successful in your local environement but fail in Drone. You can follow these steps to run the tests in an environment similar to the Drone pipeline. This will mount your local files of the grafana-image-renderer repo in the Docker image so any change that happens in the Docker image will be available in your local environment. This allows you to run yarn test-diff and yarn test-update in Docker and see the results locally.

Run the Drone environment in Docker:
cd ./devenv/docker/drone
docker-compose up
Open a terminal within the drone-docker-puppeteer container and run the following commands:
cd /drone/src
PUPPETEER_CACHE_DIR=/drone/src/cache yarn install --frozen-lockfile --no-progress
PUPPETEER_CACHE_DIR=/drone/src/cache CI=true yarn test-ci
Notes: The tests might take longer in the Docker container. If you run into timeout issues, you can run the test command with the --testTimeout option:

PUPPETEER_CACHE_DIR=/drone/src/cache CI=true yarn test-ci --testTimeout=10000