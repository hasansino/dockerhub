#!/bin/bash

cleanup() {
    echo "Removing GitHub Actions Runner..."
    ./config.sh remove --token "${RUNNER_TOKEN}"
    exit 0
}

trap cleanup SIGINT SIGTERM

if [ ! -f .runner ]; then
    echo "Configuring GitHub Actions Runner..."
    ./config.sh \
    --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}" \
    --work "${RUNNER_WORKDIR}" \
    --unattended --replace
fi

chown -R user /ghrunner "${RUNNER_WORKDIR}"
sudo service docker start
sudo "$@"
