#!/usr/bin/env bash
set -euo pipefail

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run this script as root (for example: sudo bash $0)." >&2
  exit 1
fi

if ! getent group docker >/dev/null; then
  echo "The docker group does not exist. Install Docker Engine first." >&2
  exit 1
fi

if ! id github-runner >/dev/null 2>&1; then
  useradd --create-home --shell /bin/bash github-runner
fi

usermod --append --groups docker github-runner
echo "github-runner is ready to use Docker. Restart its runner service to apply the group change."