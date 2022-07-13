[![Create Release](https://github.com/fullstack-devops/excalidraw/actions/workflows/create-release.yml/badge.svg)](https://github.com/fullstack-devops/excalidraw/actions/workflows/create-release.yml)
[![Anchore Container Scan](https://github.com/fullstack-devops/excalidraw/actions/workflows/anchore.yml/badge.svg)](https://github.com/fullstack-devops/excalidraw/actions/workflows/anchore.yml)

# excalidraw

Special thanks for the [Excalidraw project](https://github.com/excalidraw/excalidraw) for the great Virtual whiteboard they provide us.
Unfortunately, the current excalidraw container runs as root, which means that it cannot run in secured clusters with psp.
Well here is a fix for that, a repo for excalidraw in a rootless container ;). There is also a [helm chart](https://github.com/fullstack-devops/helm-charts/charts/excalidraw) with standard security policies enabled.

## Where can I get it?

| Type | Registry     | Link                                                                                | Pull source                                  |
| ---- | ------------ | ----------------------------------------------------------------------------------- | -------------------------------------------- |
| OCI  | GitHub       | [Package](https://github.com/fullstack-devops/excalidraw/pkgs/container/excalidraw) | `ghcr.io/fullstack-devops/excalidraw:latest` |
| OCI  | Red Hat Quay | [Repo](https://quay.io/repository/fullstack-devops/excalidraw?tab=info)             | `quay.io/fullstack-devops/excalidraw:latest` |
| helm | GitHub       | [Repo](https://github.com/fullstack-devops/helm-charts)                             | `fs-devops/excalidraw`                       |

more work tbd, eg.:
- mount own libaries docker-compose and helm/k8s 
