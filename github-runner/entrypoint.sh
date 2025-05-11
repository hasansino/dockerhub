#!/bin/bash

set -e

if [ -S /var/run/docker.sock ]; then
    DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
    groupadd -g ${DOCKER_GID} docker-host || true
    usermod -aG docker-host github-runner
    chmod 660 /var/run/docker.sock || true
fi

if [ "$(id -u)" = "0" ]; then
    echo "Switching to github-runner user..."
    exec su - github-runner -c "cd /actions-runner && $(basename $0) $*"
    exit $?
fi

echo "Running as $(id -un)"

if [ ! -f .runner ]; then
    echo "Configuring GitHub Actions Runner..."
    ./config.sh --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}" --unattended --replace
fi

./run.sh
