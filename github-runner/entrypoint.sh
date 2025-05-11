#!/bin/bash

if [ ! -f .runner ]; then
    echo "Configuring GitHub Actions Runner..."
    ./config.sh --url "${RUNNER_URL}" --token "${RUNNER_TOKEN}" --unattended --replace
fi

./run.sh
