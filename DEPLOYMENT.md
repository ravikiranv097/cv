# Linux self-hosted deployment

The workflow builds the app image and runs it with Docker host networking. The production app listens on TCP port 3000, so access it at `http://<server-ip>:3000`. Ensure that port is allowed by the server firewall.

## Prepare the server

Install Docker Engine first and verify `docker info` succeeds as an administrator. Then run this repository's account setup script as root:

```sh
sudo bash scripts/setup-github-runner-user.sh
```

The script creates `github-runner` if needed and adds it to the `docker` group. Docker group membership grants root-equivalent access to the host, so only use this account for trusted workflows and protect the deployment branch.

Install and configure the GitHub Actions runner under the `github-runner` Linux account. This runner was registered with the custom label `rkv`, which the workflow uses to select it. Restart the runner service after running the setup script so it picks up Docker group membership.

Verify Docker access as the runner account before deploying:

```sh
sudo -u github-runner docker info
```

The workflow runs on pushes to `main` and can also be started manually from the Actions tab. It replaces the `cv-app` container; the runner host must have TCP port 3000 available.